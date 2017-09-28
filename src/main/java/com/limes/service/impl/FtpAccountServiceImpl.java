package com.limes.service.impl;

import com.limes.dao.entity.FTPACCOUNT;
import com.limes.dao.mapper.FtpAccountMapper;
import com.limes.service.FtpAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;

/**
 * Created by dluo on 17/9/12.
 */

@Service("ftpAccountService")
public class FtpAccountServiceImpl implements FtpAccountService{

    @Resource
    private FtpAccountMapper ftpAccountMapper;

    public boolean AccountExist(String userName){
        if (ftpAccountMapper.AccountExist(userName)==0){
            return false;
        }
        return true;
    }
    public void insertAccount(String userName, String password, Timestamp datetime, String Email){
        FTPACCOUNT ftpaccount = new FTPACCOUNT(userName, password, datetime, Email);
        ftpAccountMapper.insertAccount(ftpaccount);
    }

    public String getEmail(String userName){
        return ftpAccountMapper.getEmail(userName);

    }
}
