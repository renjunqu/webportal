package com.joymove.dao;
import com.joymove.entity.*;

import java.util.*;
import java.math.*;



public interface JOYPowerBarDao {
	
	public List<JOYPowerBar>  getPowerBarByScope(Map<String, Object> likeCondition);
}
