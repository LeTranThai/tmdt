package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class OTP implements Serializable {
    String idOTP, idA, OTP;
    int count;
    public OTP() {
    }

    public OTP(String idOTP, String idA, String OTP, int count) {
        this.idOTP = idOTP;
        this.idA = idA;
        this.OTP = OTP;
        this.count = count;
    }

    public String getIdOTP() {
        return idOTP;
    }

    public void setIdOTP(String idOTP) {
        this.idOTP = idOTP;
    }

    public String getIdA() {
        return idA;
    }

    public void setIdA(String idA) {
        this.idA = idA;
    }

    public String getOTP() {
        return OTP;
    }

    public void setOTP(String OTP) {
        this.OTP = OTP;
    }

    public int getcount() {
        return count;
    }

    public void setcount(int count) {
        this.count = count;
    }
}