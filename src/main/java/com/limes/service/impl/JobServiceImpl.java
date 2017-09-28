package com.limes.service.impl;

import com.limes.dao.entity.JOB;
import com.limes.dao.mapper.JobMapper;
import com.limes.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dluo on 17/9/28.
 */

@Service("jobService")
public class JobServiceImpl implements JobService{

    @Resource
    private JobMapper jobMapper;

    public void insertData(JOB job){
        jobMapper.insertData(job);
    }
}
