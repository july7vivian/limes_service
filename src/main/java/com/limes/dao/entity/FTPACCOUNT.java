package com.limes.dao.entity;

import com.limes.util.Email;

import java.sql.Timestamp;

/**
 * Created by dluo on 17/9/12.
 */
public class FTPACCOUNT {
    private String userName;
    private String passWord;
    private String Email;
    private Timestamp expire;


    public FTPACCOUNT(){

    }

    public FTPACCOUNT(String userName, String passWord, Timestamp expire, String Email) {
        this.userName = userName;
        this.passWord = passWord;
        this.expire = expire;
        this.Email = Email;
    }

    public String getUserName(){
        return this.userName;
    }

    public String getPassword(){
        return this.passWord;
    }

    public String getEmail(){
        return Email;
    }


    public Timestamp getExpire(){
        return this.expire;
    }

    public void setUserName(String userName){
        this.userName = userName;
    }

    public void setPassWord(String passWord){
        this.passWord = passWord;
    }

    public void setEmail(String eMail){
        this.Email = eMail;
    }


}
