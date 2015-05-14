package com.joymove.entity;

import java.util.*;
import java.math.*;
import org.apache.ibatis.type.Alias;

@Alias("JOYCar")
public class JOYCar {
	
	static public int STATE_FREE = 0;
	static public int STATE_BUSY = 1;
	static public int STATE_RESERVE = 2;
	
	
	
	private Integer    id;
	private BigDecimal positionX;
	private BigDecimal positionY;
	private Integer     state;
	private String      desp;
	
	//成功的预定了或者订了车的人
	private String      mobileNo;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public BigDecimal getPositionX() {
		return positionX;
	}
	public void setPositionX(BigDecimal positionX) {
		this.positionX = positionX;
	}
	public BigDecimal getPositionY() {
		return positionY;
	}
	public void setPositionY(BigDecimal positionY) {
		this.positionY = positionY;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public String getDesp() {
		return desp;
	}
	public void setDesp(String desp) {
		this.desp = desp;
	}
	
	
	public JOYCar(Integer id, BigDecimal positionX, BigDecimal positionY,
			Integer state, String desp, String  mobileNo) {
		super();
		this.id = id;
		this.positionX = positionX;
		this.positionY = positionY;
		this.state = state;
		this.desp = desp;
		this.mobileNo = mobileNo;
	}
	public JOYCar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
}
