package com.joymove.service.impl;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoaderListener;

import com.joymove.jobs.ClearExpireReserveJob;
import com.joymove.service.*;
import com.joymove.dao.*;
import com.joymove.entity.*;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;

//import org.springframework.scheduling


@Service("JOYReserveOrderService")
public class JOYReserveOrderServiceImpl  implements JOYReserveOrderService {
	
	
	final static Logger logger = LoggerFactory.getLogger(JOYReserveOrderServiceImpl.class);
	@Autowired
	private JOYReserveOrderDao joyReserveOrderDao;
	@Autowired
	private JOYCarDao   joyCarDao;
	@Resource(name="scheduler")
	private Scheduler scheduler;
	

	
	/*******    business proc   *******/
	
	public void clearExpireReserve(String mobileNo,Integer carId) {
		try {
			// TODO Auto-generated method stub
			JobDataMap jobDataMap = new JobDataMap();
			jobDataMap.put("carId", carId.toString());
			jobDataMap.put("owner", mobileNo.toString());
			JobDetail job = newJob(ClearExpireReserveJob.class)
					.withIdentity(mobileNo+carId, "clearExpire")
					.usingJobData(jobDataMap)
					.build();
			Trigger trigger = newTrigger()
					    .startAt(new Date(System.currentTimeMillis()+60*1000*10))
					    .withSchedule(simpleSchedule()
					    .withIntervalInMinutes(1)
					    .repeatForever())
	            		.build();
			 scheduler.scheduleJob(job, trigger);
		} catch(Exception e){
		    e.printStackTrace();	
		}
	}

	
	
	@Override
	public List<JOYReserveOrder> getNeededReserveOrder(
			Map<String, Object> likeCondition) {
		// TODO Auto-generated method stub
		return joyReserveOrderDao.getNeededReserveOrder(likeCondition);
	}

	
	public void updateCarReserveState(JOYCar car){
		joyCarDao.setCarReserve(car);
	}
	
	
	
	
	@Override
	public boolean insertReserveOrder(JOYReserveOrder cOrder) throws SchedulerException  {
		// TODO Auto-generated method stub
		
		cOrder.setDelflag(JOYReserveOrder.DEL_FLAG);
		//this.updateReserveOrderDelFlagByMobileNo(cOrder);
		//clear others 
		 Map<String,Object> likeCondition = new HashMap<String, Object>();
		 likeCondition.put("mobileNo", cOrder.getMobileNo());
		 likeCondition.put("delFlag", JOYReserveOrder.NODEL_FLAG);
		 likeCondition.put("expSeconds", JOYReserveOrder.EXPIRE_SECONDS);
		 //remove the old reserve
		 List<JOYReserveOrder> reOrders = joyReserveOrderDao.getNeededReserveOrder(likeCondition);
		 for(JOYReserveOrder order:reOrders) {
			 this.updateReserveOrderDelFlag(order);
		 }
		 //start to reserve the new
		JOYCar car = new JOYCar();
		car.setId(cOrder.getCarId());
        car.setState(JOYCar.STATE_RESERVE);
        car.setMobileNo(cOrder.getMobileNo());
        joyCarDao.setCarReserve(car);
		
		//set a timer to clear the reserve info
		likeCondition.put("id", car.getId());
		List<JOYCar> cars = joyCarDao.getCarById(likeCondition);
		car = cars.get(0);
		if(cOrder.getMobileNo().equals(car.getMobileNo())) {
			cOrder.setDelflag(JOYReserveOrder.NODEL_FLAG);
			joyReserveOrderDao.insertReserveOrder(cOrder);
			/*start a delay task*/
			clearExpireReserve(car.getMobileNo(),car.getId());
			return true;
		} else {
			return false;
		}
			
	}

	
	@Override
	public void updateReserveOrderDelFlag(JOYReserveOrder cOrder) throws SchedulerException {
		
		
				
				cOrder.setDelflag(JOYReserveOrder.DEL_FLAG);
				joyReserveOrderDao.updateReserveOrderDelFlag(cOrder);
				//update car 's state
				JOYCar car = new JOYCar();
				car.setMobileNo(cOrder.getMobileNo());
				car.setId(cOrder.getCarId());
				joyCarDao.clearReserve(car);
				//delete the job
				JobKey key = new JobKey(cOrder.getMobileNo()+cOrder.getCarId(), "clearExpire");
				logger.debug("to be deleted jobs : "+ key.toString());
				scheduler.deleteJob(key);
	}

}
