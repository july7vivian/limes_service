package com.limes.eventbus;

import com.google.common.eventbus.AsyncEventBus;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.concurrent.Executors;


/**
 * 异步消息总线装配器 将事件处理器注册到事件总线
 *
 */
@Service
public class EventBusAssembler {

    private AsyncEventBus eventBus;

    private Integer threadPoolSize = 10;

    private String identifier = "limes";

    @PostConstruct
    public void init() {
        if (eventBus == null) {
            this.eventBus = new AsyncEventBus(identifier, Executors.newFixedThreadPool(threadPoolSize));
        }
    }

    public void postEamil(String subject,String text) {
        WarnEamilEvent warnEamilEvent = new WarnEamilEvent(subject, text);
        this.eventBus.post(warnEamilEvent);
    }
    
    public void register(Object obj) {
        this.eventBus.register(obj);
    }

    public void unregister(Object obj) {
        this.eventBus.unregister(obj);
    }

    public Integer getThreadPoolSize() {
        return threadPoolSize;
    }

    public void setThreadPoolSize(Integer threadPoolSize) {
        this.threadPoolSize = threadPoolSize;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public AsyncEventBus getEventBus() {
        return eventBus;
    }

    public void setEventBus(AsyncEventBus eventBus) {
        this.eventBus = eventBus;
    }
}
