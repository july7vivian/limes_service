package com.limes.service.impl;

import com.limes.service.EmailService;
import com.limes.service.FtpAccountService;
import com.limes.service.RoleService;
import com.limes.util.ExceptionDealUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;
import java.util.regex.*;


/**
 * Created by dluo on 17/6/24.
 */

@Service("emailService")
public class EmailServiceImpl implements EmailService{

    private static final Logger logger = LoggerFactory.getLogger(ConfigServiceImpl.class);
    private static Properties properties = null;
    static {
        Resource resource = new ClassPathResource("properties/email.properties");
        EncodedResource encodedResource = new EncodedResource(resource, "UTF-8");

        try {
            properties = PropertiesLoaderUtils.loadProperties(encodedResource.getResource());
        } catch (IOException e) {
            logger.warn("\t配置文件读取失败 " + e.getMessage() + "\t" + ExceptionDealUtil.eToStringWithLog(e));
        }
    }

    @javax.annotation.Resource
    private FtpAccountService ftpAccountService;

    public void sentEmail(HttpServletRequest request){

//        String param = request.getQueryString();
//        Map map = request.getParameterMap();
        String email = request.getParameter("email");


        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();


        mailSender.setHost(properties.getProperty("HOST.SERVER_"));

        mailSender.setUsername(properties.getProperty("USERNAME_"));
        mailSender.setPassword(properties.getProperty("PASSWORD_"));

        SimpleMailMessage smm = new SimpleMailMessage();
        smm.setFrom(mailSender.getUsername());
        smm.setTo(email);

        String[] msg = createFTP(email);


        smm.setSubject("Limes FTP Account");
        smm.setText("Welcome to  Limes service! Your FTP account is "+msg[0]+ ", password is "+msg[1]+"\nThis account will expire at "+msg[2]+", please finish your linkage as soon.\nThanks!");
        mailSender.send(smm);
    }


    private String[] createFTP(String email){
        //允许英文字母、数字、下划线、英文句号、以及中划线组成
        Pattern p = Pattern.compile("([a-zA-Z0-9_-]+)@([a-zA-Z0-9_-]+)(\\.[a-zA-Z0-9_-]+)+$");
        Matcher m = p.matcher(email);
        String username="", domain="";
        String[] result = new String[3];
        if (m.matches()){
            username = m.group(1);
            domain = m.group(2);
        }
        String account = username+domain;
        String password = createPassword(6);

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, 3); //现在时间的3天后
        cal.set(Calendar.HOUR_OF_DAY, 8);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date date=cal.getTime();
        Timestamp expire = new Timestamp(date.getTime());
        ftpAccountService.insertAccount(account, password, expire, email);
        result[0] = account;
        result[1] = password;
        result[2] = expire.toString();
        return result;
    }


    private String createPassword(int length){
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }


    private void runShell(){
        Process process = null;
        List<String> processList = new ArrayList<String>();
        try {
            String path = "/Users/dluo/Documents/DataLink/limes_service/test.sh";
            process = Runtime.getRuntime().exec(path);
//            process = Runtime.getRuntime().exec("ps");

//            process.waitFor();
            BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line = "";
            while ((line = input.readLine()) != null) {
                processList.add(line);
            }
            input.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (String line : processList) {
            System.out.println(line);
        }
    }


}
