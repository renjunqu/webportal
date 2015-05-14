package com.joymove.dao;

import com.joymove.entity.*;

import java.util.*;
import java.math.*;

public interface JOYParkDao {
	public List<JOYPark>  getParkByScope(Map<String, Object> likeCondition);

}
