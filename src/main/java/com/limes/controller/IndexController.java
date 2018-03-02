package com.limes.controller;


import com.limes.dao.entity.*;
import com.limes.service.ConfigService;
import com.limes.service.EmailService;
import com.limes.service.JobService;
import com.limes.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.httpclient.HttpClient;
import  com.sun.net.httpserver.HttpExchange;

import java.net.URLDecoder;


@Controller
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private ConfigService configService;

    @Resource
    private EmailService emailService;

    @Resource
    private RoleService roleService;


    @Resource
    private JobService jobService;

    @RequestMapping(value = "/")
    public String index(HttpServletRequest request){
        return "/index";
    }



    @RequestMapping(value = "/generateConfig")
    public ModelAndView generateConfig(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("limes/generateConfig");
        return mav;
    }

    @RequestMapping(value = "/generateConfig2")
    public ModelAndView generateConfig2(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("limes/generateConfig2");
        return mav;
    }


    @RequestMapping(value = "/upload")
    public ModelAndView upload(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("limes/upload");
        return mav;
    }

    @RequestMapping(value = "/download")
    public ModelAndView download(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("limes/download");
        return mav;
    }

    @RequestMapping(value = "/submitConfig")
    public ModelAndView submitConfig(Config config){  //data bind

        System.out.println(config.toString());
        String jobId = configService.getIDFromConfig(config);
        ModelAndView mav = new ModelAndView();
        mav.addObject("jobId", jobId);
        mav.setViewName("resultone");
        return mav;
    }

    @RequestMapping(value = "/submitConfig2")
    public ModelAndView submitConfig2(mlConfig mlconfig){  //data bind

        System.out.println(mlconfig.toString());
        String jobId = configService.getIDFromConfig(mlconfig);
        ModelAndView mav = new ModelAndView();
        mav.addObject("jobId", jobId);
        mav.setViewName("resultone");
        return mav;
    }


//    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
//    public ModelAndView saveFile(HttpServletRequest request)
//    {
//        String fileName = configService.uploadFile(request);
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("fileName", fileName);
//        mav.setViewName("uploadResult");
//        return mav;
//    }



    @RequestMapping(value = "/getStatus")
    public ModelAndView queryStatus(HttpServletRequest request){  //data bind
//        System.out.println(config);
        String jobId = request.getParameter("id");
        String status = jobService.getStatus(jobId);
        ModelAndView mav = new ModelAndView();
        mav.addObject("jobId", jobId);
        mav.addObject("status", status);
        mav.setViewName("resulttwo");

        return mav;
    }




    @RequestMapping(value = "/tutorial/intro")
    public ModelAndView tutorialIntro(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/intro");
        return mav;
    }

    @RequestMapping(value = "/tutorial/config")
    public ModelAndView tutorialConfig(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/config");
        return mav;
    }


    @RequestMapping(value = "/tutorial/meta")
    public ModelAndView tutorialMeta(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_meta");
        return mav;
    }


    @RequestMapping(value = "/tutorial/prefix")
    public ModelAndView tutorialPrefix(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_prefix");
        return mav;
    }


    @RequestMapping(value = "/tutorial/source")
    public ModelAndView tutorialSource(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_source");
        return mav;
    }


    @RequestMapping(value = "/tutorial/metric")
    public ModelAndView tutorialMetric(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_metric");
        return mav;
    }


    @RequestMapping(value = "/tutorial/metric/operation")
    public ModelAndView tutorialMetricOperations(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_metric_op");
        return mav;
    }

    @RequestMapping(value = "/tutorial/metric/bool")
    public ModelAndView tutorialMetricBool(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_metric_bool");
        return mav;
    }

    @RequestMapping(value = "/tutorial/metric/measure")
    public ModelAndView tutorialMetricMeasure(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_metric_measure");
        return mav;
    }

    @RequestMapping(value = "/tutorial/machine_learning")
    public ModelAndView tutorialMetricMachineLearning(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_ml");
        return mav;
    }

    @RequestMapping(value = "/tutorial/accept")
    public ModelAndView tutorialMetricAccept(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_accept");
        return mav;
    }


    @RequestMapping(value = "/tutorial/review")
    public ModelAndView tutorialMetricReview(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_review");
        return mav;
    }

    @RequestMapping(value = "/tutorial/output")
    public ModelAndView tutorialMetricOutput(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_output");
        return mav;
    }


    @RequestMapping(value = "/tutorial/example")
    public ModelAndView tutorialMetricExample(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_example");
        return mav;
    }



//提交邮箱地址，发送账号信息
    @RequestMapping(value = "/uploadEmail")
    public ModelAndView uploadEmail(HttpServletRequest request)
    {
        emailService.sentEmail(request);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("resultzero");
        return mav;

    }

    @RequestMapping(value = "/role")
    public ModelAndView getRole(HttpServletRequest request) {
        String id = request.getParameter("id");
        int Id = Integer.parseInt(id);
        String name = roleService.getRoleName(Id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("name", name);
        mav.setViewName("hello");

        return mav;

    }

}
