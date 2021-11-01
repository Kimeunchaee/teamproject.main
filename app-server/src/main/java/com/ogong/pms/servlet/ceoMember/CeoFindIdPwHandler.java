package com.ogong.pms.servlet.ceoMember;

import java.io.IOException;
import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import org.apache.ibatis.session.SqlSession;
import com.ogong.pms.dao.CeoMemberDao;
import com.ogong.pms.domain.CeoMember;

@WebServlet("/ceomember/find")
public class CeoFindIdPwHandler extends GenericServlet {
  private static final long serialVersionUID = 1L;

  //RandomPw randomPw;
  CeoMemberDao ceoMemberDao;
  SqlSession sqlSession;

  @Override
  public void init(ServletConfig config) throws ServletException {
    ServletContext 웹애플리케이션공용저장소 = config.getServletContext();
    sqlSession = (SqlSession) 웹애플리케이션공용저장소.getAttribute("sqlSession");
    ceoMemberDao = (CeoMemberDao) 웹애플리케이션공용저장소.getAttribute("ceoMemberDao");
  }

  @Override
  public void service(ServletRequest request, ServletResponse response)
      throws ServletException, IOException {
    try {
      int no = Integer.parseInt(request.getParameter("no"));
      CeoMember ceoMember = ceoMemberDao.findByNo(no);

      if (ceoMember == null) {
        throw new Exception("해당 번호의 회원이 없습니다.");
      } 

      request.setAttribute("ceoMember", ceoMember);
      request.getRequestDispatcher("/ceoMember/CeoMemberFind.jsp").forward(request, response);

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.getRequestDispatcher("/Error.jsp").forward(request, response);
    }
  }
}