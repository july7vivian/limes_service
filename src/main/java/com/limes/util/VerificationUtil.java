package com.limes.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * 这个工具类用于存入数据库前的非空判断
 * Created by Administrator on 2016/2/1.
 */
public class VerificationUtil {

    //实例所有成员变量的非空判断
    public static boolean Verifynotnull(Object object) throws Exception  {
        boolean notnull=true;
        Class<?> classType = object.getClass();
        // 通过默认构造方法创建一个新的对象
        Object objectCopy = classType.getConstructor(new Class[] {}).newInstance(new Object[] {});
        // 获得对象的所有属性
        Field fields[] = classType.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            // 属性名称
            String fieldName = field.getName();
            // 得到属性名称的第一个字母并转成大小
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            // 获得和属性对应的getXXX()方法的名字：get+属性名称的第一个字母并转成大小+属性名去掉第一个字母，
            String getMethodName = "get" + firstLetter + fieldName.substring(1);
            // 获得和属性对应的getXXX()方法
            Method getMethod = classType.getMethod(getMethodName, new Class[] {});
            // 调用原对象的getXXX()方法
            Object value = getMethod.invoke(object, new Object[] {});
            if(value.equals(""))
            {
                notnull=false;
                System.out.println(fieldName + ":" +  notnull);
            }
        }
        return notnull;
    }

    //实例成员变量的非空判断(id除外)
    public static boolean Verifynotnullwithoutid(Object object) throws Exception  {
        boolean notnull=true;
        Class<?> classType = object.getClass();
        // 通过默认构造方法创建一个新的对象
        Object objectCopy = classType.getConstructor(new Class[] {}).newInstance(new Object[] {});
        // 获得对象的所有属性
        Field fields[] = classType.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            // 属性名称
            String fieldName = field.getName();
            // 得到属性名称的第一个字母并转成大小
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            // 获得和属性对应的getXXX()方法的名字：get+属性名称的第一个字母并转成大小+属性名去掉第一个字母，
            String getMethodName = "get" + firstLetter + fieldName.substring(1);
            // 获得和属性对应的getXXX()方法
            Method getMethod = classType.getMethod(getMethodName, new Class[] {});
            // 调用原对象的getXXX()方法
            Object value = getMethod.invoke(object, new Object[] {});
            if(fieldName!="id") {
                if(value.equals(""))
                {
                    notnull=false;
                    System.out.println(fieldName + ":" +  notnull);
                }
            }
        }
        return notnull;
    }
}
