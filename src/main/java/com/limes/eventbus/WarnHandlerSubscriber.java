package com.limes.eventbus;

import com.limes.util.Email;
import com.google.common.eventbus.Subscribe;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WarnHandlerSubscriber implements InitializingBean {
    private static final Logger logger = LoggerFactory.getLogger(WarnHandlerSubscriber.class);

    @Resource
    private EventBusAssembler eventBusAssembler;


    @Subscribe
    public void postEamil(WarnEamilEvent warnEamilEvent) {
        Email.sendWarnEmail(warnEamilEvent.getSubject(), warnEamilEvent.getMsg());
    }


    @Override
    public void afterPropertiesSet() throws Exception {
        eventBusAssembler.register(this);
    }


}