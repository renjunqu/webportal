package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/*
 *  new car, dynamic data inside cache server
 *  the old JOYCar just used to test
 * */
@Alias("JOYNCar")
public class JOYNCar {
	//the primary key
	private String vinNum;
	//the register time
	private Date registerTime;
	//rsa pub key
	private String RSAPubKey;
	//rsa pri key
	private String RSAPriKey;
	//register state
	
	//license num 
	private String licensenum;
	
	
	public String getLicensenum() {
		return licensenum;
	}
	public void setLicensenum(String licensenum) {
		this.licensenum = licensenum;
	}
	private Integer registerState;
	
	
	public String getVinNum() {
		return vinNum;
	}
	public void setVinNum(String vinNum) {
		this.vinNum = vinNum;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public String getRSAPubKey() {
		return RSAPubKey;
	}
	public void setRSAPubKey(String rSAPubKey) {
		RSAPubKey = rSAPubKey;
	}
	public String getRSAPriKey() {
		return RSAPriKey;
	}
	public void setRSAPriKey(String rSAPriKey) {
		RSAPriKey = rSAPriKey;
	}
	public Integer getRegisterState() {
		return registerState;
	}
	public void setRegisterState(Integer registerState) {
		this.registerState = registerState;
	}
	
	
	
	public JOYNCar(String vinNum, Date registerTime, String rSAPubKey,
			String rSAPriKey,  Integer registerState,String licensenum) {
		super();
		this.vinNum = vinNum;
		this.registerTime = registerTime;
		RSAPubKey = rSAPubKey;
		RSAPriKey = rSAPriKey;
		this.licensenum = licensenum;
		this.registerState = registerState;
	}
	
	public JOYNCar() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	

}
