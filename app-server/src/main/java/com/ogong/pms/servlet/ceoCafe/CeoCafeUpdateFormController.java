package com.ogong.pms.servlet.ceoCafe;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ogong.pms.dao.CafeDao;
import com.ogong.pms.domain.Cafe;
import com.ogong.pms.servlet.cafe.CafeHandlerHelper;

@WebServlet("/ceomember/cafe/updateform")
public class CeoCafeUpdateFormController extends HttpServlet  {
  private static final long serialVersionUID = 1L;

  CafeDao cafeDao;

  @Override
  public void init(ServletConfig config) throws ServletException {
    ServletContext 웹애플리케이션공용저장소 = config.getServletContext();
    cafeDao = (CafeDao) 웹애플리케이션공용저장소.getAttribute("cafeDao");
  }

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    try {

      Cafe cafe = cafeDao.findByCafeNo(Integer.parseInt(request.getParameter("cafeno")));

      if (cafe == null) {
        throw new Exception("등록된 카페가 없습니다.");
      }

      String status = CafeHandlerHelper.getCafeStatusLabel(cafe.getCafeStatus());

      request.setAttribute("cafe", cafe);
      request.setAttribute("cafeStatus", status);

      request.setAttribute("pageTitle", "🙂 마이페이지");
      request.setAttribute("contentUrl", "/ceoCafe/CeoCafeUpdateForm.jsp");
      request.getRequestDispatcher("/template1.jsp").forward(request, response);

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.getRequestDispatcher("/Error.jsp").forward(request, response);
    }
  }
}




