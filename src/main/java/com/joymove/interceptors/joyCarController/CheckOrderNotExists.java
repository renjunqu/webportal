package com.joymove.interceptors.joyCarController;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.ModelAndView;
import org.json.simple.*;
import org.json.simple.parser.*;

import com.joymove.util.JsonHashUtils;
import com.joymove.entity.JOYOrder;
import com.joymove.entity.JOYUser;
import com.joymove.service.JOYOrderService;
import com.joymove.service.JOYUserService;

import java.math.BigDecimal;



public class CheckOrderNotExists extends HandlerInterceptorAdapter {
	
	private JOYOrderService   joyOrderService;
	
	
	

	public JOYOrderService getJoyOrderService() {
		return joyOrderService;
	}




	public void setJoyOrderService(JOYOrderService joyOrderService) {
		this.joyOrderService = joyOrderService;
	}

	
	



	@Override  
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse response, Object handler) throws Exception {
		    Hashtable<String, Object> jsonObj = (Hashtable<String, Object>)req.getAttribute("jsonArgs");
		    
			JSONObject reObj = new JSONObject();
			Object orderId = jsonObj.get("orderId");
			
			try {
					Map<String,Object> likeCondition = new HashMap<String, Object>();
    				likeCondition.put("id", orderId);
    				JOYOrder order =  joyOrderService.getOrderById(likeCondition);
    				if(order !=null) {
    					req.setAttribute("cOrder", order);
    					return true;
    				} 
 			} catch(Exception e){
 				System.out.println(e.toString());
				
			}
			
		  reObj.put("result","10003");
	      response.setContentType("application/json;charset=UTF-8");           
		  response.setHeader("Cache-Control", "no-cache");
		  response.getWriter().write(reObj.toString()); 
	      return false;
		}
	
}
