package com.limes.eventbus;


public class WarnEamilEvent {
    private  String subject;
    private  String msg;

    public WarnEamilEvent(String subject, String msg) {
        this.subject = subject;
        this.msg = msg;
    }

    public String getMsg(){
        return msg;
    }

    public String getSubject() {
        return subject;
    }

}
