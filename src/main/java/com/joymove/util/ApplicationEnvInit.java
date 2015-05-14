package com.joymove.util;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.Scheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.futuremove.cacheServer.amqp.MQConsumer;
import com.futuremove.cacheServer.amqp.listeners.CMShutdownListener;
import com.futuremove.cacheServer.utils.ConfigUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Consumer;

public class ApplicationEnvInit implements ServletContextListener {
	
	final static Logger logger = LoggerFactory.getLogger(ApplicationEnvInit.class);
	
	static MQConsumer mq = null;
	static Channel channel = null;
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {

		return;
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
       //start the  amqp  consumer
		
		

		return;
	}

}
