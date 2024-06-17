package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Otp", value = "/otp")
public class Otp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String otp = request.getParameter("otp");
        String otpInfo = (String) request.getSession().getAttribute("otp");
        Integer userId = (Integer) request.getSession().getAttribute("otpUserId");
        if (otp.equals(otpInfo)) {
            AccountService.lockUpAcountById("1", userId.toString());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("active");
        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("no");
        }
    }
}
