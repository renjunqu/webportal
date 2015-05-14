package com.joymove.entity;
import org.apache.ibatis.type.Alias;

import java.util.*;
import java.math.*;
@Alias("JOYReserveOrder")
public class JOYReserveOrder {
	private Integer id;
	private String mobileNo;
	private Date startTime;
	private Integer carId;
	private Integer delFlag;
	private String carVinNum;
	
	static public int DEL_FLAG = 1;
	static public int NODEL_FLAG = 0;
	static public int EXPIRE_SECONDS = 600;
	
	
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
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Integer getCarId() {
		return carId;
	}
	public void setCarId(Integer carId) {
		this.carId = carId;
	}
	public Integer getDelflag() {
		return delFlag;
	}
	public void setDelflag(Integer delFlag) {
		this.delFlag = delFlag;
	}
	
	public String getCarVinNum() {
		return carVinNum;
	}
	public void setCarVinNum(String carVinNum) {
		this.carVinNum = carVinNum;
	}
	
	
	
	public JOYReserveOrder(Integer id, String mobileNo, Date startTime,
			Integer carId, Integer delFlag,String carVinNum) {
		super();
		this.id = id;
		this.mobileNo = mobileNo;
		this.startTime = startTime;
		this.carId = carId;
		this.delFlag = delFlag;
		this.carVinNum = carVinNum;
		
	}
	public JOYReserveOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((carId == null) ? 0 : carId.hashCode());
		result = prime * result
				+ ((carVinNum == null) ? 0 : carVinNum.hashCode());
		result = prime * result + ((delFlag == null) ? 0 : delFlag.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((mobileNo == null) ? 0 : mobileNo.hashCode());
		result = prime * result
				+ ((startTime == null) ? 0 : startTime.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JOYReserveOrder other = (JOYReserveOrder) obj;
		if (carId == null) {
			if (other.carId != null)
				return false;
		} else if (!carId.equals(other.carId))
			return false;
		if (carVinNum == null) {
			if (other.carVinNum != null)
				return false;
		} else if (!carVinNum.equals(other.carVinNum))
			return false;
		if (delFlag == null) {
			if (other.delFlag != null)
				return false;
		} else if (!delFlag.equals(other.delFlag))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mobileNo == null) {
			if (other.mobileNo != null)
				return false;
		} else if (!mobileNo.equals(other.mobileNo))
			return false;
		if (startTime == null) {
			if (other.startTime != null)
				return false;
		} else if (!startTime.equals(other.startTime))
			return false;
		return true;
	}
	
	

}
