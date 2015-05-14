package com.joymove.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.KeyGenerator;
import com.googlecode.ehcache.annotations.Property;
import com.googlecode.ehcache.annotations.TriggersRemove;
import com.joymove.dao.JOYUserDao;
import com.joymove.entity.JOYUser;
import com.joymove.service.JOYUserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
@Service("JOYUserService")
public class JOYUserServiceImpl implements JOYUserService{
	
	final static Logger logger = LoggerFactory.getLogger(JOYUserServiceImpl.class);
	@Autowired
	private JOYUserDao joyuserDao;
	
	/*******          business proc *************/
	
	//@Transactional(rollbackFor=Exception.class, propagation=Propagation.REQUIRED) 
	
	@Override
	@TriggersRemove(cacheName="joyUserCache", 
    keyGenerator = @KeyGenerator (
            name = "HashCodeCacheKeyGenerator",
            properties = @Property( name="includeMethod", value="false" )
        )
    ) 
	public JOYUser insertJOYUser(JOYUser user) {
		
			joyuserDao.insertJOYUser(user);
			
			//throw new Exception("test");
		    return user;
	}
	
	@Override
	@Cacheable(cacheName="joyUserCache", 
    keyGenerator = @KeyGenerator (
            name = "HashCodeCacheKeyGenerator",
            properties = @Property( name="includeMethod", value="false" )
        )
    )
	public List<JOYUser> getJOYUserInfo(JOYUser user) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		logger.warn("inside get joy user info ");
		Map<String, Object> likeCondition = new HashMap<String, Object>();
			likeCondition.put("mobileNo", user.getMobileNo());
		return joyuserDao.getAllJOYUser(likeCondition);
	}
	
	@Override
	@Cacheable(cacheName="joyUserCache", 
    keyGenerator = @KeyGenerator (
            name = "HashCodeCacheKeyGenerator",
            properties = @Property( name="includeMethod", value="false" )
        )
    )
	public String checkUserState(JOYUser user) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String errMsg = null;
		logger.warn("inside get joy user info ");
		Map<String, Object> likeCondition = new HashMap<String, Object>();
		likeCondition.put("mobileNo", user.getMobileNo());
		List<JOYUser> users = joyuserDao.getAllJOYUser(likeCondition);
		JOYUser currUser = users.get(0);
		if( currUser.getAuthenticateId() ==0 ) {
			errMsg = "用户身份认证未通过";
		} else if(currUser.getAuthenticateDriver() ==0 ) {
			errMsg = "用户驾照认证未通过";
		} else if(currUser.getDeposit().compareTo(BigDecimal.ONE)<0){
			errMsg = "用户押金余额不足";
		}
		return errMsg;
	}
	
	
	
	
	

	
	@Override
	@Cacheable(cacheName="joyUserCache", 
    keyGenerator = @KeyGenerator (
            name = "HashCodeCacheKeyGenerator",
            properties = @Property( name="includeMethod", value="false" )
        )
    )
	public List<JOYUser> getJOYUserByMobileNo(JOYUser user) {
		// TODO Auto-generated method stub
		logger.warn("inside get joy user by mobileNo ");
		Map<String, Object> likeCondition = new HashMap<String, Object>();
		likeCondition.put("mobileNo", user.getMobileNo());
		return joyuserDao.getJOYUserByPhone(likeCondition);
	}
	
	
	
	@Override
	@TriggersRemove(cacheName="joyUserCache", 
    keyGenerator = @KeyGenerator (
            name = "HashCodeCacheKeyGenerator",
            properties = @Property( name="includeMethod", value="false" )
        )
    )
	public void updateJOYUser(JOYUser user) {
		logger.warn("inside update JOYUser ");
		joyuserDao.updateJOYUser(user);
	}


    
	@Override
	public List<JOYUser> getJOyUserNeeded(Map<String, Object> likeCondition) {
		// TODO Auto-generated method stub
		return joyuserDao.getAllJOYUser(likeCondition);
	}
    
	
	public static void main(String [] args){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:**/applicationContext-mvc.xml");
		JOYUserService service  = (JOYUserService)context.getBean("JOYUserService");
		JOYUser user = new JOYUser();
		JOYUser user1 = new JOYUser();
		user.setMobileNo("18500411146");
		user1.setMobileNo("18500217642");
		List<JOYUser> users1 = service.getJOYUserByMobileNo(user);
		System.out.println("users1 is "+users1);
		List<JOYUser> users2 = service.getJOYUserByMobileNo(user1);
		System.out.println("users2 is "+users2);
		System.out.println("test over");
		
		
	}

	@Override
	@TriggersRemove(cacheName="joyUserCache", 
    keyGenerator = @KeyGenerator (
            name = "HashCodeCacheKeyGenerator",
            properties = @Property( name="includeMethod", value="false" )
        )
    )
	public int triggerUserCache(JOYUser user) {
		// TODO Auto-generated method stub
		//use it to trigger cache remove
		return 0;
		
	}
	
	
	
}
