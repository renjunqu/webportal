package com.joymove.entity;

/**
 * Created by qurj on 15/5/12.
 */
import org.apache.ibatis.type.Alias;

@Alias("JOYWXPayInfo")
public class JOYWXPayInfo {
    private Integer id;
    private String out_trade_no;
    private String mobileNo;
    private Double totalFee;
    private Integer payOverFlag;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }


    public Double getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(Double totalFee) {
        this.totalFee = totalFee;
    }

    public Integer getPayOverFlag() {
        return payOverFlag;
    }

    public void setPayOverFlag(Integer payOverFlag) {
        this.payOverFlag = payOverFlag;
    }

    public JOYWXPayInfo(Integer id, String out_trade_no, String mobileNo, Double totalFee, Integer payOverFlag) {
        this.id = id;
        this.out_trade_no = out_trade_no;
        this.mobileNo = mobileNo;
        this.totalFee = totalFee;
        this.payOverFlag = payOverFlag;
    }

    public JOYWXPayInfo() {
    }
}
