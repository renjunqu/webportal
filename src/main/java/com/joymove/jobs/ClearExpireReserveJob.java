package com.joymove.jobs;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.mongodb.morphia.Datastore;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.futuremove.cacheServer.amqp.handler.impl.RegisterHandler;
import com.futuremove.cacheServer.service.CarService;
import com.futuremove.cacheServer.test.Human;
import com.futuremove.cacheServer.entity.*;
import com.joymove.dao.JOYCarDao;
import com.joymove.entity.JOYCar;

public class ClearExpireReserveJob  implements Job {
	
	final static Logger logger = LoggerFactory.getLogger(ClearExpireReserveJob.class);
	
	/************  business proc  ***********************/
	
	
	
	
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		try {
			Map args = arg0.getJobDetail().getJobDataMap();
			String carId = (String)args.get("carId");
			String owner = (String)args.get("owner");
	
			//ApplicationContext context = new ClassPathXmlApplicationContext("classpath:**/applicationContext-bean.xml");
			WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
			Scheduler scheduler = (Scheduler)context.getBean("scheduler");
			JobKey jobKey = new JobKey(owner + carId, "clearExpire");
			JOYCarDao joyCarDao = (JOYCarDao)context.getBean("joycarDao");
		    //update the car's state
			JOYCar car = new JOYCar();
			car.setMobileNo(owner);
			car.setId(Integer.parseInt(carId));
			joyCarDao.clearReserve(car);
			logger.info("clear expire timer running ......... for fake car: "+carId+"......");
			//delete the job
			scheduler.deleteJob(jobKey);
		} catch(Exception e){
			logger.debug("exception happens when clear expire for fake car ");
			logger.debug(e.toString());
			//logger.debug(e.printStackTrace());
			logger.debug("show exception over");
		}
		//System.out.println("Job executing: "+name + " ****** Date: "+new Date());
	}
}
