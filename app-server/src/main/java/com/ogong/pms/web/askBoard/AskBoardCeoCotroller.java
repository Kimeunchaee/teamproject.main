package com.ogong.pms.web.askBoard;

import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ogong.pms.dao.AskBoardDao;
import com.ogong.pms.domain.AskBoard;
import com.ogong.pms.domain.CeoMember;

@Controller
public class AskBoardCeoCotroller {

  @Autowired  AskBoardDao askBoardDao;
  @Autowired  SqlSessionFactory sqlSessionFactory;

  @GetMapping("/askboard/ceoaddform")
  public ModelAndView addFrom() {
    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "💬문의글 등록");
    mv.addObject("contentUrl", "askBoard/AskBoardCeoAddForm.jsp");
    mv.setViewName("template1");

    return mv;
  }

  @PostMapping("/askboard/ceoadd")
  public ModelAndView add(HttpSession session, HttpServletRequest request, AskBoard askBoard) throws Exception {

    if (askBoard.getAskStatus() == 2) {
      askBoard.setAskTempPW(Integer.parseInt(request.getParameter("password")));
    }
    askBoard.setAskCeoWriter((CeoMember) session.getAttribute("loginCeoUser"));
    askBoardDao.insertCeo(askBoard);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "💬문의글 등록");
    mv.addObject("refresh", "1;url=ceomylist");
    mv.addObject("contentUrl", "askBoard/AskBoardCeoAdd.jsp");
    mv.setViewName("template1");

    return mv;

  }

  @GetMapping("/askboard/ceomylist")
  public ModelAndView list(HttpSession session) throws Exception {

    CeoMember loginCeoUser = (CeoMember) session.getAttribute("loginCeoUser");

    Collection<AskBoard> ceoMyAskBoardList = askBoardDao.findCeoMyAll(loginCeoUser.getCeoNo());

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "💬문의글 목록");
    mv.addObject("ceoMyAskBoardList", ceoMyAskBoardList);
    mv.addObject("contentUrl", "askBoard/AskBoardCeoMyList.jsp");
    mv.setViewName("template1");

    return mv;
  }

  @GetMapping("/askboard/ceomydetail")
  public ModelAndView detail(int askNo) throws Exception {
    AskBoard myAskBoard = askBoardDao.findByNo(askNo);

    if (myAskBoard == null) {
      throw new Exception("문의게시글 상세 오류!");
    }

    int i = myAskBoard.getAskVeiwCount() + 1;
    myAskBoard.setAskVeiwCount(i);

    askBoardDao.updateViewCount(myAskBoard);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "💬문의글 상세");
    mv.addObject("myAskBoard", myAskBoard);
    mv.addObject("contentUrl", "askBoard/AskBoardCeoMyDetail.jsp");
    mv.setViewName("template1");

    return mv;
  }

  @GetMapping("/askboard/ceoupdateform")
  public ModelAndView updateForm(int askNo) throws Exception {

    AskBoard ceoAskBoard = askBoardDao.findByNo(askNo);
    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "💬문의글 수정");
    mv.addObject("ceoAskBoard", ceoAskBoard);
    mv.addObject("contentUrl", "askBoard/AskBoardCeoUpdateForm.jsp");
    mv.setViewName("template1");

    return mv;
  }

  @PostMapping("/askboard/ceoupdate")
  public ModelAndView update(AskBoard askBoard) throws Exception {

    AskBoard prevAskBoard = askBoardDao.findByNo(askBoard.getAskNo());
    if (prevAskBoard == null) {
      throw new Exception("해당 번호의 문의글이 없습니다.");
    }
    askBoard.setAskRegisteredDate(prevAskBoard.getAskRegisteredDate());
    askBoardDao.update(askBoard);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:ceomylist");

    return mv;
  }

  @GetMapping("/askboard/ceodelete")
  public ModelAndView delete(int askNo) throws Exception { 

    askBoardDao.deletereply(askNo);
    askBoardDao.delete(askNo);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:ceomylist");

    return mv;
  }
}







