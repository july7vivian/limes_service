package com.limes.service.impl;

import com.limes.service.EmailService;
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
import java.util.*;

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

    public void sentEmail(HttpServletRequest request){

//        String param = request.getQueryString();
//        Map map = request.getParameterMap();
        String email = request.getParameter("email");
//        System.out.println("email: "+email);


        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();


        mailSender.setHost(properties.getProperty("HOST.SERVER_"));

        mailSender.setUsername(properties.getProperty("USERNAME_"));
        mailSender.setPassword(properties.getProperty("PASSWORD_"));

        SimpleMailMessage smm = new SimpleMailMessage();
        smm.setFrom(mailSender.getUsername());
        smm.setTo(email);

        String[] msg = createFTP(email);


        smm.setSubject("Hello world");
        smm.setText("Hello world ! Limes service! Your FTP account is upload1, password is 123456\n This account will expire in three days, please finish your linkage as soon.\n Thanks!");
        mailSender.send(smm);
//        System.out.print("hello world !");
    }


    private String[] createFTP(String email){
        String[] result = new String[2];


        result[0] = "ftp1";
//        result[1]=createPassword();
        result[1] = "123456";

        return result;
    }


    private String createPassword(){
        int length = 6;
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
//        System.out.println("hello");
        for (String line : processList) {
            System.out.println(line);
        }
//        System.out.println("world");
    }


}
