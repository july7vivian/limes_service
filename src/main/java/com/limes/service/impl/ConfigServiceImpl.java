package com.limes.service.impl;

import com.limes.dao.entity.*;
import com.limes.service.ConfigService;
import com.limes.util.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by humeng on 2017/5/27.
 */

@Service("configService")
public class ConfigServiceImpl implements ConfigService {
    private static final Logger logger = LoggerFactory.getLogger(ConfigServiceImpl.class);

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
