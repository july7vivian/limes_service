package com.limes.service.impl;

import com.limes.dao.entity.*;
import com.limes.service.ConfigService;
import com.limes.util.ExceptionDealUtil;
import com.limes.util.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Properties;
import java.util.UUID;

/**
 * Created by humeng on 2017/5/27.
 */

@Service("configService")
public class ConfigServiceImpl implements ConfigService {
    private static final Logger logger = LoggerFactory.getLogger(ConfigServiceImpl.class);
    private static Properties properties = null;
    static {
        Resource resource = new ClassPathResource("properties/path.properties");
        EncodedResource encodedResource = new EncodedResource(resource, "UTF-8");

        try {
            properties = PropertiesLoaderUtils.loadProperties(encodedResource.getResource());
        } catch (IOException e) {
            logger.warn("\t配置文件读取失败 " + e.getMessage() + "\t" + ExceptionDealUtil.eToStringWithLog(e));
        }
    }

    public String uploadFile(HttpServletRequest request){
        CommonsMultipartResolver mutilpartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //request如果是Multipart类型、
        String newfileName = "";
        if (mutilpartResolver.isMultipart(request)) {
            //强转成 MultipartHttpServletRequest
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取文件名
            Iterator<String> it = multiRequest.getFileNames();
            while (it.hasNext()) {
                //获取MultipartFile类型文件
                MultipartFile fileDetail = multiRequest.getFile(it.next());
                if (fileDetail != null) {
                    String fileName = fileDetail.getOriginalFilename();
                    String[] fileNameArr = fileName.split("[.]");
                    newfileName = UUID.randomUUID().toString() + "." + fileNameArr[fileNameArr.length - 1];
                    String path = properties.getProperty("UploadPath") + newfileName;
                    File localFile = new File(path);
                    //将上传文件写入到指定文件出、核心！
                    try {
                        fileDetail.transferTo(localFile);
                    } catch (IOException e) {
                        logger.error("\t保存文件失败 " + "\t" + ExceptionDealUtil.eToStringWithLog(e));
                    }
                    //非常重要、有了这个想做什么处理都可以
                    //fileDetail.getInputStream();
                }
            }
        }
        return newfileName;
    }


    public String getIDFromConfig(Config config){
        String jobId = "";
        FileOutputStream fop = null;
        File file;
        String content = config.toString();
        try {

            file = new File("/Users/humeng/Downloads/outwork/LIMES_resouce/test.xml");
            //fop = new FileOutputStream(file);

            // get the content in bytes
            byte[] contentInBytes = content.getBytes();
            jobId = HttpUtil.httpPostFile("http://localhost:8080/execute", null, "test.xml", contentInBytes, "text/xml", "2", "3");
            //fop.write(contentInBytes);
            //fop.flush();
            //fop.close();

        } catch (Exception e) {
            logger.error("保存配置文件失败，e:{}", e);
        } finally {
            try {
                if (fop != null) {
                    fop.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return jobId;
    }
}
