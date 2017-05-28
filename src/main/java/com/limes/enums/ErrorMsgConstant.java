package com.limes.enums;

/**
 * Created by hongyang.gao on 2015/10/23.
 */
public class ErrorMsgConstant {
    /**
     * 错误信息
     */
    public static final String NON_ERROR = "未知错误，请稍后重试";
    public static final String SYS_ERROR_MSG = "网络错误，请稍后重试";
    public static final String PARAM_ERROR_MSG = "参数非法";
    public static final String DATA_ERROR_MSG = "数据错误";
    public static final String DATA_INSERT_ERROR = "数据存入数据库失败";
    public static final String NETWORK_ERROR_MSG = "网络异常";
    public static final String EMAIL_SEND_FAIL = "邮件发送失败";
    public static final String PASSWORD_WRONG = "密码错误";

    /**
     * 响应
     */
    public static final String RESPONSE_SUCCESS = "200";
    public static final String RESPONSE_EXCEPTION = "400";
    public static final String RESPONSE_ERROR = "500";
    /**
     * 网络
     */
    public static final String HTTP_REQUEST_FAIL = "网络请求失败";
    public static final String HTTP_RESPONSE_FAIL = "网络返回结果为失败";
    public static final String HTTP_RESPONSE_NOT_WANGTED = "网络返回结果不是预期的";
    public static final String HTTP_REQUEST_EXCEPTION = "网络请求异常";
    /**
     * IO
     */
    public static final String READ_EXCEPTION = "读输入流异常";
    /**
     * 密钥错误
     */
    public static final String SECCODE_WRONG = "501";
}
