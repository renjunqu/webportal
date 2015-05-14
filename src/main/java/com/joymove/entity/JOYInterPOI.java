package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.math.BigDecimal;
@Alias("JOYInterPOI")
public class JOYInterPOI {
	//推荐兴趣点
	private Integer id;
	private String title;
	private String name;
	private BigDecimal latitude;
	private BigDecimal longitude;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getLatitude() {
		return latitude;
	}
	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
	public BigDecimal getLongitude() {
		return longitude;
	}
	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	public JOYInterPOI(Integer id, String title, String name,
			BigDecimal latitude, BigDecimal longitude) {
		super();
		this.id = id;
		this.title = title;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public JOYInterPOI() {
		super();
		// TODO Auto-generated constructor stub
	}
}
