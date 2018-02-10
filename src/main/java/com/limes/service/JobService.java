package com.limes.service;

import com.limes.dao.entity.JOB;

/**
 * Created by dluo on 17/9/28.
 */
public interface JobService {

    void insertData(String jobId, String email);
    String getStatus(String jobId);
}
