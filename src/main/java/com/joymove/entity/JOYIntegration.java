package com.joymove.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.json.simple.JSONObject;
@Alias("JOYIntegration")
public class JOYIntegration {
	
	private Integer jifenId;
	
	private String mobileNo;
	
	private Integer jiFen;
	
	private String jifenDesc;
	
	private Integer statusMark;
	
	private Date jifenDate;

	
	
	
	
	public Integer getJifenId() {
		return jifenId;
	}


	


	public void setJifenId(Integer jifenId) {
		this.jifenId = jifenId;
	}





	public String getMobileNo() {
		return mobileNo;
	}





	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}





	public Integer getJiFen() {
		return jiFen;
	}





	public void setJiFen(Integer jiFen) {
		this.jiFen = jiFen;
	}





	public String getJifenDesc() {
		return jifenDesc;
	}





	public void setJifenDesc(String jifenDesc) {
		this.jifenDesc = jifenDesc;
	}





	public Integer getStatusMark() {
		return statusMark;
	}





	public void setStatusMark(Integer statusMark) {
		this.statusMark = statusMark;
	}





	public Date getJifenDate() {
		return jifenDate;
	}





	public void setJifenDate(Date jifenDate) {
		this.jifenDate = jifenDate;
	}


	
	
	
	


	public JOYIntegration(Integer jifenId, String mobileNo, Integer jiFen,
			String jifenDesc, Integer statusMark, Date jifenDate) {
		this.jifenId = jifenId;
		this.mobileNo = mobileNo;
		this.jiFen = jiFen;
		this.jifenDesc = jifenDesc;
		this.statusMark = statusMark;
		this.jifenDate = jifenDate;
	}


	


	public JOYIntegration() {
	}





	public JSONObject toJSON(){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("jifen",this.getJiFen());
		jsonObj.put("jifenDesc",this.getJifenDesc());
		//SimpleDateFormat   dateFormatter   =   new   SimpleDateFormat   ("yyyy-MM-dd   HH:mm:ss     ");   
		//String dateStr = dateFormatter.format(new   Date(System.currentTimeMillis()));
		jsonObj.put("startTime",this.getJifenDate().getTime()/1000);

		return jsonObj;
	}





	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((jiFen == null) ? 0 : jiFen.hashCode());
		result = prime * result
				+ ((jifenDate == null) ? 0 : jifenDate.hashCode());
		result = prime * result
				+ ((jifenDesc == null) ? 0 : jifenDesc.hashCode());
		result = prime * result + ((jifenId == null) ? 0 : jifenId.hashCode());
		result = prime * result
				+ ((mobileNo == null) ? 0 : mobileNo.hashCode());
		result = prime * result
				+ ((statusMark == null) ? 0 : statusMark.hashCode());
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
		JOYIntegration other = (JOYIntegration) obj;
		if (jiFen == null) {
			if (other.jiFen != null)
				return false;
		} else if (!jiFen.equals(other.jiFen))
			return false;
		if (jifenDate == null) {
			if (other.jifenDate != null)
				return false;
		} else if (!jifenDate.equals(other.jifenDate))
			return false;
		if (jifenDesc == null) {
			if (other.jifenDesc != null)
				return false;
		} else if (!jifenDesc.equals(other.jifenDesc))
			return false;
		if (jifenId == null) {
			if (other.jifenId != null)
				return false;
		} else if (!jifenId.equals(other.jifenId))
			return false;
		if (mobileNo == null) {
			if (other.mobileNo != null)
				return false;
		} else if (!mobileNo.equals(other.mobileNo))
			return false;
		if (statusMark == null) {
			if (other.statusMark != null)
				return false;
		} else if (!statusMark.equals(other.statusMark))
			return false;
		return true;
	}
	
	
	
}
