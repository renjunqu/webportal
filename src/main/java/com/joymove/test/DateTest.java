package com.joymove.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {
	public static void main(String[] args) throws Exception {
		/*new Date().getTime();
		long currentTimeMillis = System.currentTimeMillis()/1000;
		String valueOf = String.valueOf(currentTimeMillis);
		System.out.println(valueOf);
		long parseLong = Long.parseLong(valueOf);
		System.out.println(parseLong);
		//System.out.println(System.currentTimeMillis()/1000);
		//String ss = "1423628702";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		String format = sd.format(new Date(parseLong));
		Date parse = sd.parse(valueOf);
		System.out.println(parse);*/
		String beginDate="1328007600000";  
		  
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");  
		  
		String sd = sdf.format(new Date(Long.parseLong(beginDate)));  
		Date parse = sdf.parse(sd);  
		System.out.println(sd);  
		
	}
}
