package com.limes.dao.mapper;

import com.limes.dao.entity.JOB;
import org.springframework.stereotype.Repository;

/**
 * Created by dluo on 17/9/28.
 */
@Repository
public interface JobMapper {
    void insertData(JOB job);
}
