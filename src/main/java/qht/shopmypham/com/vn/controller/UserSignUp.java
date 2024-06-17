package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Email;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.LoginService;
import qht.shopmypham.com.vn.service.OTPService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.EmailUtil;
import qht.shopmypham.com.vn.tools.Encode;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@WebServlet(name = "SignupController", value = "/signup")
public class UserSignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String re_password = request.getParameter("repass");
        LoginService los = new LoginService();
        Account acc = los.checkUser(user.toLowerCase());
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (user == null || password == null || re_password == null) {
            response.sendRedirect("/login.jsp");
        } else {
            if (acc == null) {
                if (password.equals(re_password)) {
                    List<Account> accountList = AccountService.getAllAccount();
                    Collections.reverse(accountList);
                    String number = String.format("%06d", new Random().nextInt(999999));
                    los.signUp(user.toLowerCase(), Encode.enCodeMD5(password), email, accountList.get(0).getId() + 1);
                    Email email1 = new Email();
                    email1.setFrom("thaile1004lop9a6@gmail.com");
                    email1.setFromPasswork("ytom nvkd larf pdla");
                    email1.setTo(email);
                    email1.setSubject("Xác thực tài khoản");
                    StringBuffer sb = new StringBuffer();
                    sb.append("Chào ").append(user + ". ");
                    sb.append("Mật mã OTP của bạn là ").append(number + ".\n");
                    email1.setContent(sb.toString());
                    try {
                        EmailUtil.send(email1);
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                    request.getSession().setAttribute("otp", number);
                    request.getSession().setAttribute("otpUserId", accountList.get(0).getId() + 1);
                    request.setAttribute("success", "Otp xác thực đã gửi tới email của bạn!");
                    request.getRequestDispatcher("otp.jsp").forward(request, response);
                    action = 5;
                    level = 2;
                    content = "Đăng kí tài khoản thành công";
                } else {
                    response.sendRedirect("login.jsp");
                    action = 5;
                    level = 2;
                    content = "Đăng kí tài khoản thất bại";
                }
            } else {
                request.setAttribute("error", "Tên tài khoản đã tồn tại!");
                request.setAttribute("active","active");
                request.getRequestDispatcher("login.jsp").forward(request,response);
                action = 5;
                level = 2;
                content = "Đăng kí tài khoản thất bại";
            }
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }
}
