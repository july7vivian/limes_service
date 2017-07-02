package com.limes.service;


import javax.servlet.http.HttpServletRequest;

/**
 * Created by dluo on 17/6/24.
 */

public interface EmailService {

    public void sentEmail(HttpServletRequest request);

}
