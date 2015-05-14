package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.math.BigDecimal;
import java.util.*;

@Alias("JOYUser")
public class JOYUser {
	private String mobileNo;
	private String username;
	private String userpwd;
	private String email;
	private Date registerTime;
	private String gender;
	private String addr;
	private String  age;
	private Integer failedTimes;
	private Date   lockedTime;
	private String pushKey;
	private String authToken;
	private Date   lastActiveTime;
	private Integer authenticateId;
	private Integer authenticateDriver;
	private BigDecimal deposit;
	private String   homeAddr;
	private BigDecimal homeLatitude;
	private BigDecimal homeLongitude;
	private String corpAddr;
	private BigDecimal corpLatitude;
	private BigDecimal corpLongitude;
	private String     face_info;
	private String     voice_info;


	public String getFace_info() {
		return face_info;
	}

	public void setFace_info(String face_info) {
		this.face_info = face_info;
	}

	public String getVoice_info() {
		return voice_info;
	}

	public void setVoice_info(String voice_info) {
		this.voice_info = voice_info;
	}

	public String getHomeAddr() {
		return homeAddr;
	}



	public void setHomeAddr(String homeAddr) {
		this.homeAddr = homeAddr;
	}



	public BigDecimal getHomeLatitude() {
		return homeLatitude;
	}



	public void setHomeLatitude(BigDecimal homeLatitude) {
		this.homeLatitude = homeLatitude;
	}



	public BigDecimal getHomeLongitude() {
		return homeLongitude;
	}



	public void setHomeLongitude(BigDecimal homeLongitude) {
		this.homeLongitude = homeLongitude;
	}



	public String getCorpAddr() {
		return corpAddr;
	}



	public void setCorpAddr(String corpAddr) {
		this.corpAddr = corpAddr;
	}



	public BigDecimal getCorpLatitude() {
		return corpLatitude;
	}



	public void setCorpLatitude(BigDecimal corpLatitude) {
		this.corpLatitude = corpLatitude;
	}



	public BigDecimal getCorpLongitude() {
		return corpLongitude;
	}



	public void setCorpLongitude(BigDecimal corpLongitude) {
		this.corpLongitude = corpLongitude;
	}



	public String getMobileNo() {
		return mobileNo;
	}



	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getUserpwd() {
		return userpwd;
	}



	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Date getRegisterTime() {
		return registerTime;
	}



	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}



	






	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}



	public Integer getFailedTimes() {
		return failedTimes;
	}



	public void setFailedTimes(Integer failedTimes) {
		this.failedTimes = failedTimes;
	}



	public Date getLockedTime() {
		return lockedTime;
	}



	public void setLockedTime(Date lockedTime) {
		this.lockedTime = lockedTime;
	}



	public String getPushKey() {
		return pushKey;
	}



	public void setPushKey(String pushKey) {
		this.pushKey = pushKey;
	}



	public String getAuthToken() {
		return authToken;
	}



	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}



	public Date getLastActiveTime() {
		return lastActiveTime;
	}



	public void setLastActiveTime(Date lastActiveTime) {
		this.lastActiveTime = lastActiveTime;
	}



	public Integer getAuthenticateId() {
		return authenticateId;
	}



	public void setAuthenticateId(Integer authenticateId) {
		this.authenticateId = authenticateId;
	}



	public Integer getAuthenticateDriver() {
		return authenticateDriver;
	}



	public void setAuthenticateDriver(Integer authenticateDriver) {
		this.authenticateDriver = authenticateDriver;
	}


	public JOYUser(String mobileNo, String username, String userpwd, String email, Date registerTime, String gender, String addr, String age, Integer failedTimes, Date lockedTime, String pushKey, String authToken, Date lastActiveTime, Integer authenticateId, Integer authenticateDriver, BigDecimal deposit, String homeAddr, BigDecimal homeLatitude, BigDecimal homeLongitude, String corpAddr, BigDecimal corpLatitude, BigDecimal corpLongitude, String face_info, String voice_info) {
		this.mobileNo = mobileNo;
		this.username = username;
		this.userpwd = userpwd;
		this.email = email;
		this.registerTime = registerTime;
		this.gender = gender;
		this.addr = addr;
		this.age = age;
		this.failedTimes = failedTimes;
		this.lockedTime = lockedTime;
		this.pushKey = pushKey;
		this.authToken = authToken;
		this.lastActiveTime = lastActiveTime;
		this.authenticateId = authenticateId;
		this.authenticateDriver = authenticateDriver;
		this.deposit = deposit;
		this.homeAddr = homeAddr;
		this.homeLatitude = homeLatitude;
		this.homeLongitude = homeLongitude;
		this.corpAddr = corpAddr;
		this.corpLatitude = corpLatitude;
		this.corpLongitude = corpLongitude;
		this.face_info = face_info;
		this.voice_info = voice_info;
	}

	public JOYUser() {
		
	}







	public BigDecimal getDeposit() {
		return deposit;
	}



	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((mobileNo == null) ? 0 : mobileNo.hashCode());
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
		JOYUser other = (JOYUser) obj;
		if (mobileNo == null) {
			if (other.mobileNo != null)
				return false;
		} else if (!mobileNo.equals(other.mobileNo))
			return false;
		return true;
	}



    
	
	
}
