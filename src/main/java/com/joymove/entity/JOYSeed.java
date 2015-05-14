package com.joymove.entity;


import org.apache.ibatis.type.Alias;

import java.math.BigDecimal;
import java.util.Date;
/**
 * Created by figoxu on 15/5/5.
 */
@Alias("JOYSeed")
public class JOYSeed {

    public static int type_coupon_seed = 0;// coupon seed
    public static int status_seed_alive = 0;//this seed could be used
    public static int status_seed_used = 1;//this seed has alreay be used

    private Integer id;
    private String mobileNo;
    private String code;
    private BigDecimal balance;
    private Date createTime;
    private Integer status;
    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public JOYSeed(Integer id, String mobileNo, String code, BigDecimal balance, Date createTime, Integer status, Integer type) {
        this.id = id;
        this.mobileNo = mobileNo;
        this.code = code;
        this.balance = balance;
        this.createTime = createTime;
        this.status = status;
        this.type = type;
    }

    public JOYSeed() {
    }
}
