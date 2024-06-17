package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.CategoryRevenue;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

public class CategoryRevenueService {
    public static void insertCategoryRevenue(String categoryName, String date, BigDecimal totalRevenue) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO CategoryRevenue(categoryName, date, totalRevenue) " +
                                "VALUES (?,?,?)")
                        .bind(0, categoryName)
                        .bind(1, date)
                        .bind(2, totalRevenue)
                        .execute()
        );
    }

    public static List<CategoryRevenue> getCategoryRevenue(String month, String year) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT categoryName AS categoryName, date, SUM(totalRevenue) AS totalRevenue " +
                            "FROM categoryrevenue " +
                            "WHERE DATE_FORMAT(date, '%Y-%m') = :monthYear " +
                            "GROUP BY categoryName, date")
                    .bind("monthYear", year + "-" + month)
                    .mapToBean(CategoryRevenue.class)
                    .stream().collect(Collectors.toList());
        });
    }
}
