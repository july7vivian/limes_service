package com.limes.service;

import com.limes.dao.mapper.FtpAccountMapper;

import javax.annotation.Resource;
import java.sql.Timestamp;

/**
 * Created by dluo on 17/9/12.
 */
public interface FtpAccountService {

    boolean AccountExist(String userName);
    void insertAccount(String userName, String password, Timestamp datetime, String Email);
    String getEmail(String userName);

}
