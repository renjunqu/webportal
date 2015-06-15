package com.joymove.view;


import com.joymove.service.JOYFansService;
import org.json.simple.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import com.joymove.entity.JOYFans;


@Scope("prototype")
@Controller("JOYFansController")
public class JOYFansController {

    @Resource(name = "JOYFansService")
    JOYFansService joyFansService;

    @RequestMapping(value={"fanmgr/addFan"}, method= RequestMethod.POST)
    public  @ResponseBody JSONObject addFan(HttpServletRequest request){
        System.out.println("addFan method was invoked...");
        JSONObject Reobj=new JSONObject();
        Reobj.put("result", "10001");
        try {
               String mobileNo = request.getParameter("mobileNo");
               String email    = request.getParameter("email");
               JOYFans fan  = new JOYFans();
               fan.email = email;
               fan.mobileNo = mobileNo;
               joyFansService.insertRecord(fan);
               Reobj.put("result","10000");
        } catch(Exception e) {
            Reobj.put("result", "10001");
            System.out.println(e);
        }
        return Reobj;
    }
	
	
	

	
	
    
}
