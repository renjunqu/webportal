package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.util.Arrays;
import java.util.Date;
@Alias("JOYDriverLicense")
public class JOYDriverLicense {

	private String mobileNo;
	
	private byte[] driverAuthInfo;
	
	private String driverLicenseNumber;
	
	private Date   expireTime;

	
	
	
	




	public String getMobileNo() {
		return mobileNo;
	}




	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}




	public byte[] getDriverAuthInfo() {
		return driverAuthInfo;
	}




	public void setDriverAuthInfo(byte[] driverAuthInfo) {
		this.driverAuthInfo = driverAuthInfo;
	}




	public String getDriverLicenseNumber() {
		return driverLicenseNumber;
	}




	public void setDriverLicenseNumber(String driverLicenseNumber) {
		this.driverLicenseNumber = driverLicenseNumber;
	}


	






	public JOYDriverLicense() {
	}
	

	public Date getExpireTime() {
		return expireTime;
	}




	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}




	public JOYDriverLicense(String mobileNo, byte[] driverAuthInfo,
			String driverLicenseNumber, Date expireTime) {
		super();
		this.mobileNo = mobileNo;
		this.driverAuthInfo = driverAuthInfo;
		this.driverLicenseNumber = driverLicenseNumber;
		this.expireTime = expireTime;
	}
	
	
	
}
