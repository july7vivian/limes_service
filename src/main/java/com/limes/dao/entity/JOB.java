package com.limes.dao.entity;

/**
 * Created by dluo on 17/9/28.
 */
public class JOB {

    private String jobId;
    private String email;


    public JOB(){

    }

    public JOB(String jobId, String email){
        this.jobId = jobId;
        this.email = email;
    }


    public String getJobId(){
        return this.jobId;
    }


    public String getEmail(){
        return this.email;
    }


    public void setJobId(String jobId){
        this.jobId = jobId;
    }


    public void setEmail(String email){
        this.email = email;
    }

}
