package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.util.Arrays;
@Alias("JOYIdAuthInfo")
public class JOYIdAuthInfo {
	
	private String mobileNo;
	
	private byte[] idAuthInfo;
	private byte[] idAuthInfo_back;
	private String idName;//姓名
	private String idNo;//省份证号
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public byte[] getIdAuthInfo() {
		return idAuthInfo;
	}
	public void setIdAuthInfo(byte[] idAuthInfo) {
		this.idAuthInfo = idAuthInfo;
	}
	public byte[] getIdAuthInfo_back() {
		return idAuthInfo_back;
	}
	public void setIdAuthInfo_back(byte[] idAuthInfo_back) {
		this.idAuthInfo_back = idAuthInfo_back;
	}
	public String getIdName() {
		return idName;
	}
	public void setIdName(String idName) {
		this.idName = idName;
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	public JOYIdAuthInfo(String mobileNo, byte[] idAuthInfo,
			byte[] idAuthInfo_back, String idName, String idNo) {
		super();
		this.mobileNo = mobileNo;
		this.idAuthInfo = idAuthInfo;
		this.idAuthInfo_back = idAuthInfo_back;
		this.idName = idName;
		this.idNo = idNo;
	}
	public JOYIdAuthInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
	
	
}
