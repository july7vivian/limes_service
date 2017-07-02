package com.limes.service;


import com.limes.dao.entity.Config;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dluo on 2017/5/26.
 */
public interface ConfigService {

    public String uploadFile(HttpServletRequest request);

    public String getIDFromConfig(Config config);
}
