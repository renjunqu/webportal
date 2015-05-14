package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.math.BigDecimal;

@Alias("JOYOrder")
public class JOYOrder {
	
	
	private Integer id;
	private String mobileNo;
	private Integer carId;
	private Date startTime;
	private Date stopTime;
	private Integer delMark;
	private Integer rentStatus;
	private Integer type;
	private Integer batonMode;
	private String  destination;
	private Integer    state;
	private String   carVinNum;
	private String   orderStops;
	
	
	
	public static int DEL_MARK=1;
	public static int NON_DEL_MARK = 0;
	
	public static int state_busy = 1;
	public static int state_wait_pay = 2;
	public static int state_pay_over = 3;
	
	
	
	
	public String getOrderStops() {
		return orderStops;
	}
	public void setOrderStops(String orderStops) {
		this.orderStops = orderStops;
	}
	public Integer getBatonMode() {
		return batonMode;
	}
	public void setBatonMode(Integer batonMode) {
		this.batonMode = batonMode;
	}

	
	
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
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
	public Integer getCarId() {
		return carId;
	}
	public void setCarId(Integer carId) {
		this.carId = carId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getStopTime() {
		return stopTime;
	}
	public void setStopTime(Date stopTime) {
		this.stopTime = stopTime;
	}
	public Integer getDelMark() {
		return delMark;
	}
	public void setDelMark(Integer delMark) {
		this.delMark = delMark;
	}
	public Integer getRentStatus() {
		return rentStatus;
	}
	public void setRentStatus(Integer rentStatus) {
		this.rentStatus = rentStatus;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	public String getCarVinNum() {
		return carVinNum;
	}
	public void setCarVinNum(String carVinNum) {
		this.carVinNum = carVinNum;
	}
	
	
	
	
	
	
	public JOYOrder(Integer id, String mobileNo, Integer carId, Date startTime,
			Date stopTime, Integer delMark, Integer rentStatus, Integer type,
			Integer batonMode, String destination, Integer state,
			String carVinNum
			) {
		super();
		this.id = id;
		this.mobileNo = mobileNo;
		this.carId = carId;
		this.startTime = startTime;
		this.stopTime = stopTime;
		this.delMark = delMark;
		this.rentStatus = rentStatus;
		this.type = type;
		this.batonMode = batonMode;
		this.destination = destination;
		this.state     = state;
		this.carVinNum     = carVinNum;
	}
	public JOYOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public double getTotalFee() {
		Date start = this.startTime;
		Date stop = null;
		if(this.state==state_busy) {
			stop = new Date(System.currentTimeMillis());
		} else {
			stop = this.stopTime;
		}
		System.out.println("stop is "+stop.getTime());
		System.out.println("start is "+start.getTime());
		System.out.println("diff is "+(stop.getTime() - start.getTime()));
		
		double result =  stop.getTime() - start.getTime();
		result = result/(100000.0 * 60);
		return result;
	}

	
	

}
