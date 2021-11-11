package com.ogong.pms.servlet.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ogong.pms.dao.CafeDao;
import com.ogong.pms.domain.Cafe;

@WebServlet("/admin/cafeList")
public class AdminCafeListController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  CafeDao cafeDao;

  @Override
  public void init(ServletConfig config) throws ServletException {
    ServletContext 웹애플리케이션공용저장소 = config.getServletContext();
    cafeDao = (CafeDao) 웹애플리케이션공용저장소.getAttribute("cafeDao");
  }

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    try {
      List<Cafe> cafeList = cafeDao.getCafeList();

      if (cafeList == null) {
        throw new Exception("등록된 스터디카페가 없습니다.");
      }

      request.setAttribute("cafeList", cafeList);

      request.setAttribute("pageTitle", "🏘 스터디 카페 목록");
      request.setAttribute("contentUrl", "/admin/AdminCafeList.jsp");
      request.getRequestDispatcher("/template1.jsp").forward(request, response);

      // request.getRequestDispatcher("/admin/AdminCafeList.jsp").forward(request, response);

    } catch (Exception e) {
      request.setAttribute("error", e);

      // 오류가 발생하면 오류 내용을 출력할 뷰를 호출한다.
      RequestDispatcher 요청배달자 = request.getRequestDispatcher("/Error.jsp");
      요청배달자.forward(request, response);
    }
  }
}
