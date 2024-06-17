package qht.shopmypham.com.vn.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import qht.shopmypham.com.vn.model.Revenue;
import qht.shopmypham.com.vn.service.RevenueService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "RevenueServlet", value = "/RevenueServlet")
public class RevenueServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();

        try {
            List<Revenue> revenueList = RevenueService.getRevenue(startDate, endDate);
            for (Revenue revenue : revenueList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("date", revenue.getDate());
                jsonObject.put("totalRevenue", revenue.gettotalRevenue());
                jsonArray.put(jsonObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(jsonArray);
        out.print(jsonArray.toString());
        out.flush();
    }
}
