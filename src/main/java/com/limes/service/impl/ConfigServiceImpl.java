package com.limes.service.impl;

import com.limes.dao.entity.*;
import com.limes.service.ConfigService;
import com.limes.service.FtpAccountService;
import com.limes.service.JobService;
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
import java.util.*;

/**
 * Created by dluo on 2017/5/27.
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

    @javax.annotation.Resource
    private FtpAccountService ftpAccountService;
    @javax.annotation.Resource
    private JobService jobService;


    public String uploadFile(HttpServletRequest request){

        CommonsMultipartResolver mutilpartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //request如果是Multipart类型
        String newfileName = "";
        //检查form中是否有enctype="multipart/form-data"
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
                    System.out.println("Path: "+path);
                    File localFile = new File(path);
                    //将上传文件写入到指定文件处、核心！
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



        String example = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n" +
                "<!DOCTYPE LIMES SYSTEM \"limes.dtd\">\n" +
                "<LIMES>\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://geovocab.org/geometry#</NAMESPACE>\n" +
                "        <LABEL>geom</LABEL>\n" +
                "    </PREFIX>\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://www.opengis.net/ont/geosparql#</NAMESPACE>\n" +
                "        <LABEL>geos</LABEL>\n" +
                "    </PREFIX>\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://linkedgeodata.org/ontology/</NAMESPACE>\n" +
                "        <LABEL>lgdo</LABEL>\n" +
                "    </PREFIX>\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://zhishi.me/ontology/</NAMESPACE>\n" +
                "        <LABEL>zhishi</LABEL>\n" +
                "    </PREFIX>\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://cndbpedia/resource/</NAMESPACE>\n" +
                "        <LABEL>cndb</LABEL>\n" +
                "    </PREFIX>\n" +
                "\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://cndbpedia/ontology/</NAMESPACE>\n" +
                "        <LABEL>cndbo</LABEL>\n" +
                "    </PREFIX>\n" +
                "\n" +
                "    <PREFIX>\n" +
                "        <NAMESPACE>http://www.w3.org/2000/01/rdf-schema#</NAMESPACE>\n" +
                "        <LABEL>w3</LABEL>\n" +
                "    </PREFIX>\n" +
                "\n" +
                "\n" +
                "    <SOURCE>\n" +
                "        <ID>linkedgeodata2</ID>\n" +
                "        <ENDPOINT>/Users/dluo/Documents/DataLink/TestData/cndbpediaOnlyLabel2/cndbpediaDump_02.nt</ENDPOINT>\n" +
                "        <VAR>?x</VAR>\n" +
                "        <PAGESIZE>-1</PAGESIZE>\n" +
                "        <RESTRICTION>?x cndbo:实体名称 ?z1</RESTRICTION>\n" +
                "        <PROPERTY>cndbo:实体名称 RENAME label</PROPERTY>\n" +
                "        <TYPE>NT</TYPE>\n" +
                "    </SOURCE>\n" +
                "    <TARGET>\n" +
                "        <ID>linkedgeodata_zh</ID>\n" +
                "        <ENDPOINT>/Users/dluo/Documents/DataLink/TestData/zhwikilabels/zhwiki_labels_zh.nt</ENDPOINT>\n" +
                "        <VAR>?y</VAR>\n" +
                "        <PAGESIZE>-1</PAGESIZE>\n" +
                "        <RESTRICTION>?y w3:label ?z2</RESTRICTION>\n" +
                "        <PROPERTY>w3:label AS nolang</PROPERTY>        \n" +
                "        <TYPE>NT</TYPE>\n" +
                "    </TARGET>\n" +
                "    <METRIC>Cosine(x.label, y.w3:label) | 0.8</METRIC>\n" +
                "    <ACCEPTANCE>\n" +
                "        <THRESHOLD>0.9</THRESHOLD>\n" +
                "        <FILE>lgd_relaybox_verynear.nt</FILE>\n" +
                "        <RELATION>lgdo:near</RELATION>\n" +
                "    </ACCEPTANCE>\n" +
                "    <REVIEW>\n" +
                "        <THRESHOLD>0.5</THRESHOLD>\n" +
                "        <FILE>lgd_relaybox_near.nt</FILE>\n" +
                "        <RELATION>lgdo:near</RELATION>\n" +
                "    </REVIEW>\n" +
                "\n" +
                "    <EXECUTION>\n" +
                "        <REWRITER>default</REWRITER>\n" +
                "        <PLANNER>default</PLANNER>\n" +
                "        <ENGINE>default</ENGINE>\n" +
                "    </EXECUTION>\n" +
                "\n" +
                "    <OUTPUT>TAB</OUTPUT>\n" +
                "</LIMES>";


        String example1 = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n" +
                "<!DOCTYPE LIMES SYSTEM \"limes.dtd\">\n" +
                "<LIMES>\n" +
                "<PREFIX>\n" +
                "<NAMESPACE>http://www.w3.org/2000/01/rdf-schema#</NAMESPACE>\n" +
                "<LABEL>w3</LABEL>\n" +
                "</PREFIX>\n" +
                "<PREFIX>\n" +
                "<NAMESPACE>http://cndbpedia/ontology/</NAMESPACE>\n" +
                "<LABEL>cndbo</LABEL>\n" +
                "</PREFIX>\n"+
                "<SOURCE>\n" +
                "<ID>data1</ID>\n" +
                "<ENDPOINT>/Users/dluo/Desktop/linkage_data/Expression/cndbpedia.nt</ENDPOINT>\n" +
                "<VAR>?x</VAR>\n" +
                "<PAGESIZE>-1</PAGESIZE>\n" +
                "<RESTRICTION>?x cndbo:实体名称 ?z1</RESTRICTION>\n" +
                "<PROPERTY>cndbo:实体名称 RENAME label</PROPERTY>\n" +
                "<TYPE>NT</TYPE>\n"+
                "</SOURCE>\n" +
                "<TARGET>\n" +
                "<ID>data2</ID>\n" +
                "<ENDPOINT>/Users/dluo/Desktop/linkage_data/Expression/zhwiki.nt</ENDPOINT>\n" +
                "<VAR>?y</VAR>\n" +
                "<PAGESIZE>-1</PAGESIZE>\n" +
                "<RESTRICTION>?y w3:label ?z2</RESTRICTION>\n" +
                "<PROPERTY>w3:label AS nolang</PROPERTY>\n" +
                "<TYPE>NT</TYPE>\n"+
                "</TARGET>\n" +
                "<METRIC>ExactMatch(x.label, y.w3:label) | 0.9</METRIC>\n" +
                "<ACCEPTANCE>\n" +
                "<THRESHOLD>1.0</THRESHOLD>\n" +
                "<FILE>verynear.nt</FILE>\n" +
                "<RELATION>w3:sameAs</RELATION>\n" +
                "</ACCEPTANCE>\n" +
                "<REVIEW>\n" +
                "<THRESHOLD>0.9</THRESHOLD>\n" +
                "<FILE>near.nt</FILE>\n" +
                "<RELATION>w3:near</RELATION>\n" +
                "</REVIEW>\n" +
                "<EXECUTION>\n" +
                "<REWRITER>default</REWRITER>\n" +
                "<PLANNER>default</PLANNER>\n" +
                "<ENGINE>default</ENGINE>\n" +
                "</EXECUTION>\n" +
                "<OUTPUT>TAB</OUTPUT>\n" +
                "</LIMES>";



        String jobId = "";
        FileOutputStream fop = null;
        File file;
        String content = config.toString();
        SOURCE source = config.getSource();
        TARGET target = config.getTarget();
        String s_endpoint = source.getENDPOINT();
//        String t_endpont = target.getENDPOINT();
        System.out.println(content);
//        String userName = s_endpoint.trim().split("/")[0].trim();// linux系统
//        String userName = s_endpoint.trim().split("/")[2].trim(); // mac系统
        String userName = "ftp1"; // 默认
        String resultFolder ="/Users/"+ userName + "/result/";// mac系统

        String email = ftpAccountService.getEmail(userName);


        try {

            // get the content in bytes
            byte[] contentInBytes = content.getBytes();
//            byte[] contentInBytes = example.getBytes();
//            byte[] contentInBytes = example1.getBytes();
            Map<String, String> textMap = new HashMap<String, String>();
            //邮箱地址从数据库中查询
            textMap.put("email", email);
            textMap.put("resultFolder", resultFolder);
            jobId = HttpUtil.httpPostFile("http://localhost:8080/execute", textMap, "config.xml", contentInBytes, "text/xml", "2", "3");
            jobService.insertData(jobId, email);

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
