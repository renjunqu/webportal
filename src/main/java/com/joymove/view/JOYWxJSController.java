package com.joymove.view;

import com.joymove.entity.JOYPayReqInfo;
import com.joymove.service.JOYFansService;
import com.joymove.service.JOYPayReqInfoService;
import com.joymove.service.JOYWXJSService;
import com.joymove.util.WeChatPay.WeChatPayUtil;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by qurj on 15/5/28.
 */

@Scope("prototype")
@Controller("JOYWXJSController")
public class JOYWXJSController {

    @Resource(name = "JOYPayReqInfoService")
    private JOYPayReqInfoService joyPayReqInfoService;

    final static Logger logger = LoggerFactory.getLogger(JOYWXJSController.class);




    @Resource(name = "JOYWXJSService")
    JOYWXJSService joywxjsService;


    @RequestMapping(value={"wxjs/getSignature"}, method= RequestMethod.POST)
    public  @ResponseBody JSONObject getSignature(@RequestBody JSONObject jsonAttr,HttpServletRequest request){
        logger.trace("getSignature method was invoked...");
        JSONObject Reobj=new JSONObject();
        Reobj.put("result", "10001");
        try {

            String.format("sdfdsf");

            JSONObject signJson = new JSONObject();
            signJson.put("noncestr", WeChatPayUtil.genNonceStr());
            signJson.put("timestamp", String.valueOf(System.currentTimeMillis()).substring(0, 10));
            logger.debug("now, the client send us: " + jsonAttr.toString());
            signJson.putAll(jsonAttr);
            logger.debug("try to get signature");
            String signature = joywxjsService.getSignature(signJson);
            logger.debug("signature result is "+signature);
            if(signature!=null) {
                Reobj.put("result","10000");
                Reobj.putAll(signJson);
                Reobj.put("signature",signature);
            }
        } catch(Exception e) {
            Reobj.put("result", "10001");
            logger.trace("exception: ",e);
        }
        return Reobj;
    }

    @RequestMapping(value={"wxjs/luckPayReq"}, method= RequestMethod.POST)
    public  @ResponseBody JSONObject luckPayReq(@RequestBody JSONObject jsonAttr,HttpServletRequest request){
        logger.trace("luckPayReq method was invoked...");
        JSONObject Reobj=new JSONObject();
        JOYPayReqInfo wxpayInfo = new JOYPayReqInfo();

        Reobj.put("result", "10001");
        try {

            String wx_trade_no = "luckPay" + String.valueOf(System.currentTimeMillis());
            String wx_code = WeChatPayUtil.genePayStr(String.valueOf(Double.valueOf(100).longValue()), wx_trade_no);
            joyPayReqInfoService.insertRecord(wxpayInfo);  //insertWXPayInfo(wxpayInfo);
            /** generate result **/
            wxpayInfo.mobileNo = "18500217642";
            wxpayInfo.type = JOYPayReqInfo.type_wx;
            Reobj.put("wx_code",new JSONParser().parse(wx_code));
        } catch(Exception e) {
            Reobj.put("result", "10001");
            logger.trace("exception: ",e);
        }
        return Reobj;
    }




}
