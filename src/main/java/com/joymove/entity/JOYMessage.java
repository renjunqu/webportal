package com.joymove.entity;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.json.simple.JSONObject;
@Alias("JOYMessage")
public class JOYMessage {
	 
	private Integer id;
	
	private String type;
	
	private String content;
	
	private Date createTime;
	
	private String mobileNo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}


	
	
	public JOYMessage(Integer id, String type, String content, Date createTime,
			String mobileNo) {
		super();
		this.id = id;
		this.type = type;
		this.content = content;
		this.createTime = createTime;
		this.mobileNo = mobileNo;
	}

	public JOYMessage() {
	
	}

	public JSONObject toJSON(){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("type",this.getType());
		jsonObj.put("content",this.getContent());
		jsonObj.put("createTime",this.getCreateTime().getTime()/1000);
		return jsonObj;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result
				+ ((createTime == null) ? 0 : createTime.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((mobileNo == null) ? 0 : mobileNo.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		JOYMessage other = (JOYMessage) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (createTime == null) {
			if (other.createTime != null)
				return false;
		} else if (!createTime.equals(other.createTime))
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
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}
	
	

}
