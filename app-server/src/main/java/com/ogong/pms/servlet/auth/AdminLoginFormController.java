package com.ogong.pms.servlet.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/form")
public class AdminLoginFormController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  //  public static Admin loginAdmin;
  //  public static Admin getLoginAdmin() {
  //    return loginAdmin;
  //  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // request.getRequestDispatcher("/admin/AdminLoginForm.jsp").forward(request, response);

    request.setAttribute("pageTitle", "🖐 오늘의 공부 로그인");
    request.setAttribute("contentUrl", "/admin/AdminLoginForm.jsp");
    request.getRequestDispatcher("/template1.jsp").forward(request, response);
  } 
}
