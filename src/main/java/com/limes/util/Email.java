package com.limes.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.io.IOException;
import java.util.Properties;

public class Email {
    private static final Logger logger = LoggerFactory.getLogger(Email.class);
    private static Properties properties = null;
    private static String[] warnAddresses = null;

    static {
        Resource resource = new ClassPathResource("properties/email.properties");
        EncodedResource encodedResource = new EncodedResource(resource, "UTF-8");

        try {
            properties = PropertiesLoaderUtils.loadProperties(encodedResource.getResource());
        } catch (IOException e) {
            logger.warn("\t配置文件读取失败 " + e.getMessage() + "\t" + ExceptionDealUtil.eToStringWithLog(e));
        }
        String warns = properties.getProperty("WARN.ADDRESS");
        if (warns != null && warns.length() > 10) {
            warnAddresses = warns.split(",");
        }
    }

    public static boolean sendWarnEmail(String subject,String text){
        return sendEmail(warnAddresses,subject,text);
    }

    public static boolean sendEmail(String[] address, String subject, String text) {
        try {
            JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
            // 设定mail server
            senderImpl.setHost(properties.getProperty("HOST.SERVER"));

            // 建立邮件消息
            SimpleMailMessage mailMessage = new SimpleMailMessage();

            // 设置收件人，寄件人 用数组发送多个邮件
            mailMessage.setTo(address);
            mailMessage.setFrom(properties.getProperty("FROM.ADDRESS"));
            mailMessage.setSubject(subject);
            mailMessage.setText(text);

            senderImpl.setUsername(properties.getProperty("USERNAME")); // 根据自己的情况,设置username
            senderImpl.setPassword(properties.getProperty("PASSWORD")); // 根据自己的情况, 设置password

            Properties prop = new Properties();
            prop.put("MAIL_SMTP_AUTH", properties.getProperty("MAIL.SMTP.AUTH")); // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
            prop.put("MAIL_SMTP_TIMEOUT", properties.getProperty("MAIL.SMTP.TIMEOUT"));
            senderImpl.setJavaMailProperties(prop);
            // 发送邮件
            senderImpl.send(mailMessage);
            logger.info("邮件发送成功#sendEmail | address:{}", address);
            return true;
        } catch (Exception e) {
            logger.warn("邮件发送失败#sendEmail | address:{} | email exception：{}", address, e);
            return false;
        }
    }
}
