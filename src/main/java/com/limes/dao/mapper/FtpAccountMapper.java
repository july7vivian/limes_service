package com.limes.dao.mapper;

import com.limes.dao.entity.FTPACCOUNT;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;

/**
 * Created by dluo on 17/9/12.
 */

@Repository
public interface FtpAccountMapper {
    int AccountExist(String userName);
    void insertAccount(FTPACCOUNT ftpaccount);
    String getEmail(String userName);
}
