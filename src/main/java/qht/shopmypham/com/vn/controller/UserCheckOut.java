package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckOutController", value = "/checkout")
public class UserCheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        Account acc = (Account) request.getSession().getAttribute("a");
        List<ListProductByCart> list = acc.getProductCart();
        String command = request.getParameter("command");
        if (acc != null) {
            idA = acc.getId();
            if (command.equals("total")) {
                Voucher voucher = (Voucher) request.getSession().getAttribute("voucher");
                int totalPrice = 0;
                for (ListProductByCart l : list) {
                    Product p = ProductService.getProductById(l.getIdP());
                    totalPrice += (p.getPrice() * l.getQuantity());
                }
                int reduction = 0;
                if (voucher != null) {
                    reduction = totalPrice * voucher.getPrice() / 100;
                }
                int priceLast = totalPrice - reduction;
//                String wardID = request.getParameter("wardID");
//                String districtID = request.getParameter("districtID");
//                int calculateFee = api.calculateFee(districtID, wardID);
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write("<li>Tổng tiền hàng <span>" + Format.formatPrice(totalPrice) + "đ</span></li>\n" +
//                        "                                <li>Phí vận chuyển <span>" + Format.formatPrice(calculateFee) + "đ</span></li>\n" +
//                        "                                <input type=\"hidden\" id=\"fee\" value=\"" + calculateFee + "\">\n" +
//                        "                                <li>Giảm giá <span>- " + Format.formatPrice(reduction) + "đ</span></li>\n" +
//                        "
                int calculateFee = (totalPrice>=100000)?0:25000;
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("<li>Tổng tiền hàng <span>" + Format.formatPrice(totalPrice) + "đ</span></li>\n" +
                        "                                <li>Phí vận chuyển <span>" + Format.formatPrice(calculateFee) + "đ</span></li>\n" +
                        "                                <input type=\"hidden\" id=\"fee\" value=\"" + calculateFee + "\">\n" +
                        "                                <li>Giảm giá <span>- " + Format.formatPrice(reduction) + "đ</span></li>\n" +
                        "    <li>Tổng thanh toán <span>" + Format.formatPrice(priceLast + calculateFee) + "đ</span></li>");
            }

            if (command.equals("checkout")) {
                List<Payment> paymentList = PaymentService.getAllPayment();
                request.setAttribute("list", list);
                request.setAttribute("activePage", "active");
                request.setAttribute("paymentList", paymentList);
                if (acc == null) request.getRequestDispatcher("login.jsp").forward(request, response);
                if (acc != null) idA = acc.getId();
                request.getRequestDispatcher("/user-template/checkout.jsp").forward(request, response);
                content = "Truy cập trang thanh toán";
            }
            if (command.equals("success")) {
                request.setAttribute("success", "Đặt hàng thành công, mời bạn tiếp tục mua hàng!");
                List<Payment> paymentList = PaymentService.getAllPayment();
                List<ListProductByCart> list1 = new ArrayList<>();
                request.setAttribute("list", list1);
                request.setAttribute("paymentList", paymentList);
                request.getRequestDispatcher("/user-template/checkout.jsp").forward(request, response);
                content = "Đặt hàng thành công";
            }
            LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        HttpSession session = request.getSession();
        Voucher voucher = (Voucher) request.getSession().getAttribute("voucher");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc != null) {
            idA = acc.getId();
            String nowDate = DateUtil.getDateNow();
            String name = request.getParameter("name");
            String note = request.getParameter("note");
            String phone = request.getParameter("phone");
            String address_detail = request.getParameter("address_detail");
            String provinceID = request.getParameter("provinceID");
            String districtID = request.getParameter("districtID");
            String wardID = request.getParameter("wardID");
            String payment = request.getParameter("payment");
            List<ListProductByCart> list = acc.getProductCart();

            int totalPrice = 0;

            for (ListProductByCart l : list) {
                Product p = ProductService.getProductById(l.getIdP());
                totalPrice += (p.getPrice() * l.getQuantity());
            }

            int reduction = 0;
            if (voucher != null) {
                reduction = totalPrice * voucher.getPrice() / 100;
            }
            int priceLast = totalPrice - reduction;
            int calculateFee = (totalPrice >= 100000) ? 0 : 25000;
            BigDecimal finalTotal = new BigDecimal(priceLast + calculateFee);

            if (voucher != null) {
                CheckOutService.addCheckOutByIdA( wardID, districtID,phone, "62de2c8249bf428fa738b40355a2316a", payment, name, note,
                        String.valueOf(acc.getId()), String.valueOf(voucher.getId()), nowDate, provinceID, address_detail);
                VoucherService.editQuantityVouchert(voucher.getId(), voucher.getQuantity() - 1);
                if ((voucher.getQuantity() - 1) == 0) {
                    VoucherService.editStatusVouchert(voucher.getId(), 0);
                }
            } else {
                CheckOutService.addCheckOutByIdA( wardID, districtID,phone, "62de2c8249bf428fa738b40355a2316a", payment, name, note, String.valueOf(acc.getId()), null, nowDate, provinceID, address_detail);
            }
            session.removeAttribute("voucher");
            List<CheckOut> checkOutList = CheckOutService.getCheckOutByIdA(String.valueOf(acc.getId()));
            String idCk = String.valueOf(checkOutList.get(checkOutList.size() - 1).getIdCk());
            for (ListProductByCart l : list) {
                ProductService.upQuantityProductById(String.valueOf(ProductService.getProductById1(l.getIdP()).getQuantity() - l.getQuantity()), String.valueOf(l.getIdP()));
                ProductCheckoutService.addProductToProductCheckout(idCk, String.valueOf(l.getIdP()), String.valueOf(l.getQuantity()));
            }

            CartService.deleteProductByIda(String.valueOf(acc.getId()));

            SimpleDateFormat inputFormat = new SimpleDateFormat("hh:mm:ss a dd/MM/yyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date sqlDate = null;
            try {
                java.util.Date parsedDate = inputFormat.parse(nowDate);
                sqlDate = Date.valueOf(outputFormat.format(parsedDate));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            RevenueService.insertRevenue(sqlDate.toString(), finalTotal);

            // Thêm doanh thu vào bảng CategoryRevenue
            for (ListProductByCart l : list) {
                Product p = ProductService.getProductById(l.getIdP());
                Categories category = CategoryService.getCategoriesById(String.valueOf(p.getIdC()));
                BigDecimal categoryRevenue = new BigDecimal(p.getPrice() * l.getQuantity());
                CategoryRevenueService.insertCategoryRevenue(category.getNameC(), sqlDate.toString(),  categoryRevenue);
            }

            if (acc != null) idA = acc.getId();
            LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
