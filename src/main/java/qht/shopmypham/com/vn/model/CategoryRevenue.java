package qht.shopmypham.com.vn.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class CategoryRevenue implements Serializable {
    private String categoryName;
    private BigDecimal totalRevenue;
    private Date date;

    public CategoryRevenue() {
    }

    public CategoryRevenue(String categoryName, BigDecimal totalRevenue, Date date) {
        this.categoryName = categoryName;
        this.totalRevenue = totalRevenue;
        this.date = date;
    }

    @Override
    public String toString() {
        return "CategoryRevenue{" +
                "categoryName='" + categoryName + '\'' +
                ", totalRevenue=" + totalRevenue +
                ", date=" + date +
                '}';
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public BigDecimal getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
