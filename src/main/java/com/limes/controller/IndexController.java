package com.limes.controller;


import com.limes.dao.entity.*;
import com.limes.service.ConfigService;
import com.limes.service.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private ConfigService configService;

    @Resource
    private EmailService emailService;

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
    public ModelAndView submitConfig(Config config){
//        System.out.println(config);
        String jobId = configService.getIDFromConfig(config);
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


    @RequestMapping(value = "/tutorial/example")
    public ModelAndView tutorialMetricExample(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_example");
        return mav;
    }




    @RequestMapping(value = "/uploadEmail")
    public ModelAndView uploadEmail(HttpServletRequest request)
    {
        emailService.sentEmail(request);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tutorial/tutorial_example");
        return mav;

    }

}
