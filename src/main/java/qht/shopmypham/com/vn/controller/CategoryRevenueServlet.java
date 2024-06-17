package qht.shopmypham.com.vn.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import qht.shopmypham.com.vn.model.CategoryRevenue;
import qht.shopmypham.com.vn.service.CategoryRevenueService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CategoryRevenueServlet", value = "/CategoryRevenueServlet")
public class CategoryRevenueServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String month = request.getParameter("month");
        String year = request.getParameter("year");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();

        try {
            List<CategoryRevenue> revenues = CategoryRevenueService.getCategoryRevenue(month, year);
            for (CategoryRevenue revenue : revenues) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("categoryName", revenue.getCategoryName());
                jsonObject.put("date", revenue.getDate());
                jsonObject.put("totalRevenue", revenue.getTotalRevenue());
                jsonArray.put(jsonObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        out.print(jsonArray.toString());
        out.flush();
    }
}
