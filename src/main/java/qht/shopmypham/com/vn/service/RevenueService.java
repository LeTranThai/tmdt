package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Product;
import qht.shopmypham.com.vn.model.Revenue;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

public class RevenueService {
    public static void insertRevenue(String date, BigDecimal totalRevenue) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO revenue(date, totalRevenue) " +
                                "VALUES (?,?)")
                        .bind(0, date)
                        .bind(1, totalRevenue)
                        .execute()

        );
    }

    public static List<Revenue> getRevenue(String startDate, String endDate) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT date, SUM(totalRevenue) as totalRevenue FROM revenue WHERE date BETWEEN :startDate AND :endDate GROUP BY date")
                    .bind("startDate", startDate)
                    .bind("endDate", endDate)
                    .mapToBean(Revenue.class)
                    .stream().collect(Collectors.toList());
        });
    }
}
