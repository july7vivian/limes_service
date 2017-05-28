package com.limes.controller;


import com.limes.dao.entity.*;
import com.limes.service.ConfigService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

/**
 * Created by hongyang.gao on 2015/12/21.
 */
@Controller
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private ConfigService configService;

    @RequestMapping(value = "/")
    public String index(HttpServletRequest request){
        return "/index";
    }


    @RequestMapping(value = "/generateConfig")
    public ModelAndView generateConfig(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("generateConfig");
        return mav;
    }


    @RequestMapping(value = "/upload")
    public ModelAndView upload(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("upload");
        return mav;
    }

    @RequestMapping(value = "/download")
    public ModelAndView download(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("download");
        return mav;
    }

    @RequestMapping(value = "/submitConfig")
    public ModelAndView submitConfig(Config config){
        String jobId = configService.getIDFromConfig(config);
        ModelAndView mav = new ModelAndView();
        mav.addObject("jobId", jobId);
        mav.setViewName("resultone");
        return mav;
    }


    @RequestMapping(value = "/uploadLile")
    public String uploadLile(HttpServletRequest request){
        String ajaxUpdateResult = "";
        try {
            List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    ajaxUpdateResult += "Field " + item.getFieldName() +
                            " with value: " + item.getString() + " is successfully read\n\r";
                } else {
                    String fileName = item.getName();
                    InputStream content = item.getInputStream();
                    // Do whatever with the content InputStream.
                    System.out.println(Streams.asString(content));
                    ajaxUpdateResult += "File " + fileName + " is successfully uploaded\n\r";
                }
            }
        } catch (Exception e) {
            logger.error("接收文件失败，e:{}", e);
        }
        return "/index";
    }
}
