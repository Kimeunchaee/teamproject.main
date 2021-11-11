package com.ogong.pms.servlet.auth;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ogong.pms.dao.AdminDao;
import com.ogong.pms.domain.Admin;

@WebServlet("/admin/login")
public class AuthAdminLoginController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  AdminDao adminDao;

  //  public static Admin loginAdmin;
  //  public static Admin getLoginAdmin() {
  //    return loginAdmin;
  //  }

  @Override
  public void init() throws ServletException {
    ServletContext 웹애플리케이션공용저장소 = getServletContext();
    adminDao = (AdminDao) 웹애플리케이션공용저장소.getAttribute("adminDao");
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
      Admin admin = adminDao.findByEmailAndPassword(email, password);

      if (admin != null) {
        HttpSession session = request.getSession();
        request.getSession().setAttribute("loginAdmin", admin);
        //request.getRequestDispatcher("/admin/AdminLogin.jsp").forward(request, response);

        request.setAttribute("pageTitle", "🖐 오늘의 공부 로그인");
        request.setAttribute("contentUrl", "/admin/AdminLogin.jsp");
        request.getRequestDispatcher("/template1.jsp").forward(request, response);
      }

      else {
        // 오류가 나면 2초 뒤에 로그인 폼으로 가게 해 버려
        response.setHeader("Refresh", "2;url=form");

        // 로그인 오류 시 가게 될 페이지
        request.setAttribute("pageTitle", "로그인 오류!");
        request.setAttribute("contentUrl", "/admin/AdminLoginFail.jsp");
        request.getRequestDispatcher("/template1.jsp").forward(request, response);
        //throw new Exception(" >> 이메일과 암호가 일치하는 관리자를 찾을 수 없습니다.");
      }

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.getRequestDispatcher("/Error.jsp").forward(request, response);
    }
  }
}
