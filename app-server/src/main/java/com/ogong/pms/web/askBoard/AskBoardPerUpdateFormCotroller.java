package com.ogong.pms.web.askBoard;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ogong.pms.dao.AskBoardDao;
import com.ogong.pms.domain.AskBoard;

@WebServlet("/askboard/perupdateform")
public class AskBoardPerUpdateFormCotroller extends HttpServlet {
  private static final long serialVersionUID = 1L;

  AskBoardDao askBoardDao;

  @Override
  public void init() {
    ServletContext 웹애플리케이션공용저장소 = getServletContext();
    askBoardDao = (AskBoardDao) 웹애플리케이션공용저장소.getAttribute("askBoardDao");
  }

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    try {

      int askNo = Integer.parseInt(request.getParameter("askNo"));
      AskBoard perAskBoard = askBoardDao.findByNo(askNo);

      request.setAttribute("pageTitle", "💬문의글 수정");
      request.setAttribute("perAskBoard", perAskBoard);
      request.setAttribute("contentUrl", "/askBoard/AskBoardPerUpdateForm.jsp");
      request.getRequestDispatcher("/template1.jsp").forward(request, response);

    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("error", e);
      request.getRequestDispatcher("/Error.jsp").forward(request, response);
    }
  }
}
