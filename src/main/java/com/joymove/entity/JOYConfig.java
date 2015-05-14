package com.joymove.entity;


import org.apache.ibatis.type.Alias;

@Alias("JOYConfig")
public class JOYConfig {
	
	private int id;
	
	private String className;
	
	private String configKey;
	
	private String configValue;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getConfigKey() {
		return configKey;
	}

	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}

	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((className == null) ? 0 : className.hashCode());
		result = prime * result
				+ ((configKey == null) ? 0 : configKey.hashCode());
		result = prime * result
				+ ((configValue == null) ? 0 : configValue.hashCode());
		result = prime * result + id;
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
		JOYConfig other = (JOYConfig) obj;
		if (className == null) {
			if (other.className != null)
				return false;
		} else if (!className.equals(other.className))
			return false;
		if (configKey == null) {
			if (other.configKey != null)
				return false;
		} else if (!configKey.equals(other.configKey))
			return false;
		if (configValue == null) {
			if (other.configValue != null)
				return false;
		} else if (!configValue.equals(other.configValue))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
