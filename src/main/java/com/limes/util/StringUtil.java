package com.limes.util;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;

/**
 * Created by hongyang.gao on 2015/10/20.
 */
public class StringUtil {
    /**
     * 将传入的字符串进行MD5加密
     * @param str
     * @return
     */
    public static String toMd5(String str) {
        return Hashing.md5().hashString(str, Charsets.UTF_8).toString();
    }
}
