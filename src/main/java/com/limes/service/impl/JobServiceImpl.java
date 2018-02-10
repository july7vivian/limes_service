package com.limes.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.limes.dao.entity.JOB;
import com.limes.dao.mapper.JobMapper;
import com.limes.service.JobService;
import com.limes.util.HttpUtil;
import org.omg.PortableInterceptor.INACTIVE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
//import com.limes.util.HttpUtil;

import javax.annotation.Resource;

/**
 * Created by dluo on 17/9/28.
 */

@Service("jobService")
public class JobServiceImpl implements JobService{

    private static final Logger logger = LoggerFactory.getLogger(JobServiceImpl.class);

    @Resource
    private JobMapper jobMapper;

    public void insertData(String jobId, String email){
        JOB job = new JOB(jobId, email);
        jobMapper.insertData(job);
    }

    public String getStatus(String jobId){
        StringBuffer param = new StringBuffer("job_id=");
        param.append(jobId);
        String result = HttpUtil.queryStatus("http://localhost:8080/get_status", param.toString(), "2", "3");
        System.out.println(result);
        int  status;
        try {
            status = Integer.parseInt(result);
        }catch (Exception e){
            logger.warn("Wrong status value! It can only be -1 or 0 or 1 or 2 ");
            throw new RuntimeException(e.getMessage() + "!wrong status value!" );
        }
        String msg="unknown";
        switch (status){
            case -1:msg = "unknown";break;
            case 0: msg = "scheduled";break;
            case 1: msg = "running";break;
            case 2: msg = "finished";break;
        }
        return msg;
    }

}
