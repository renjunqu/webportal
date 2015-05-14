package com.joymove.entity;

import org.apache.ibatis.type.Alias;

import java.util.*;
import java.math.*;
@Alias("JOYPark")
public class JOYPark {
	
	private Integer    id;
	private BigDecimal positionX;
	private BigDecimal positionY;
	private String      desp;
	
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

	public String getDesp() {
		return desp;
	}
	public void setDesp(String desp) {
		this.desp = desp;
	}
	public JOYPark(Integer id, BigDecimal positionX, BigDecimal positionY,
			String desp) {
		super();
		this.id = id;
		this.positionX = positionX;
		this.positionY = positionY;
		this.desp = desp;
	}
	public JOYPark() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((desp == null) ? 0 : desp.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((positionX == null) ? 0 : positionX.hashCode());
		result = prime * result
				+ ((positionY == null) ? 0 : positionY.hashCode());
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
		JOYPark other = (JOYPark) obj;
		if (desp == null) {
			if (other.desp != null)
				return false;
		} else if (!desp.equals(other.desp))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (positionX == null) {
			if (other.positionX != null)
				return false;
		} else if (!positionX.equals(other.positionX))
			return false;
		if (positionY == null) {
			if (other.positionY != null)
				return false;
		} else if (!positionY.equals(other.positionY))
			return false;
		return true;
	}
	
	

}
