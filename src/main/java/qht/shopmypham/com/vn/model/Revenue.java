package qht.shopmypham.com.vn.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Revenue implements Serializable {
    Date date;
    BigDecimal totalRevenue;

    public Revenue() {
    }

    public Revenue(Date date, BigDecimal totalRevenue) {
        this.date = date;
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "Revenue{" +
                "date=" + date +
                ", totalRevenue=" + totalRevenue +
                '}';
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigDecimal gettotalRevenue() {
        return totalRevenue;
    }

    public void settotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
