package com.joymove.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.joymove.dao.JOYCarDao;
import com.joymove.dao.JOYCouponDao;
import com.joymove.dao.JOYOrderDao;
import com.joymove.dao.JOYReserveOrderDao;
import com.joymove.entity.JOYCar;
import com.joymove.entity.JOYCoupon;
import com.joymove.entity.JOYOrder;
import com.joymove.entity.JOYReserveOrder;
import com.joymove.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("JOYOrderService")
public class JOYOrderServiceImpl  implements JOYOrderService {
	
	final static Logger logger = LoggerFactory.getLogger(JOYOrderServiceImpl.class);
	@Autowired
	private JOYOrderDao joyOrderDao;
	@Autowired
	private JOYCarDao joyCarDao;
	@Autowired
	private JOYReserveOrderDao joyReserveOrderDao;
	@Autowired
	private JOYCouponDao joyCouponDao;
	@Resource(name="scheduler")
	private Scheduler scheduler;

	

	/****** business proc ************/


	
	@Override
	// i do not need transaction
	public boolean insertOrder(JOYOrder order) throws Exception {
		// TODO Auto-generated method stub
		//delete  my reserve  ********************************
		 Map<String,Object> likeCondition = new HashMap<String, Object>();
		 likeCondition.put("mobileNo", order.getMobileNo());
		 likeCondition.put("delFlag", JOYReserveOrder.NODEL_FLAG);
		 likeCondition.put("expSeconds", JOYReserveOrder.EXPIRE_SECONDS);
		
		//first delete the reserve order
		JOYReserveOrder reOrder = new JOYReserveOrder();
		reOrder.setCarId(order.getCarId());
		reOrder.setMobileNo(order.getMobileNo());
		joyReserveOrderDao.updateReserveOrderDelFlag(reOrder);
		//then delete the scheduler job
		JobKey key = new JobKey(order.getMobileNo()+order.getCarId(), "clearExpire");
	    logger.debug("to be deleted jobs : "+ key.toString());
		scheduler.deleteJob(key);
		//first change car state  *****************************
		JOYCar car = new JOYCar();
		car.setId(order.getCarId());
		car.setMobileNo(order.getMobileNo());
		car.setState(JOYCar.STATE_FREE);
		joyCarDao.setCarFree(car);
		car.setState(JOYCar.STATE_BUSY);
		joyCarDao.setCarBusy(car);
		likeCondition = new HashMap<String, Object>();
		likeCondition.put("id", order.getCarId());
		List<JOYCar> cars = joyCarDao.getCarById(likeCondition);
		car = cars.get(0);
		if(car.getState()==JOYCar.STATE_BUSY && order.getMobileNo().equals(car.getMobileNo())) {
			joyOrderDao.insertOrder(order);
			return true;
		} else {
			return false;
		}
			
		
	}

	@Override
	public void deleteOrder(JOYOrder order) {
		JOYCar car = new JOYCar();
		car.setId(order.getCarId());
		car.setState(JOYCar.STATE_FREE);
		joyCarDao.setCarFree(car);
		order.setDelMark(JOYOrder.DEL_MARK);
		joyOrderDao.deleteOrder(order);
		
	}

	@Override
	public List<JOYOrder> getNeededOrder(Map<String, Object> likeCondition) {
		// TODO Auto-generated method stub
		return joyOrderDao.getNeededOrder(likeCondition);
	}

	@Override
	public void updateDestination(JOYOrder cOrder) {
		// TODO Auto-generated method stub
		joyOrderDao.updateDestination(cOrder);
		
	}

	@Override
	public void changeBatonMode(JOYOrder cOrder) {
		// TODO Auto-generated method stub
		joyOrderDao.changeBatonMode(cOrder);
	}

	@Override
	public void updateOrderStop(JOYOrder order) {
		// TODO Auto-generated method stub
		joyOrderDao.updateOrderStop(order);
	}

	@Override
	public void deleteOrder(Long[] couponIds, JOYOrder order) {
		// TODO Auto-generated method stub
		for(Long id:couponIds) {	
			joyCouponDao.deleteCouponById(id);
		}
		deleteOrder(order);
	}


	@Override
	public JOYOrder getOrderById(Map<String, Object> likeCondition) {
		return joyOrderDao.getJOYOrderById(likeCondition);
	}

}
