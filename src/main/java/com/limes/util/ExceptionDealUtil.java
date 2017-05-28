package com.limes.util;



public class ExceptionDealUtil {
    
    public static String eToString(Exception e)
    {
        String text = "";
        StringBuilder stringBuilder = new StringBuilder();
        for (StackTraceElement one : e.getStackTrace()){
            stringBuilder.append("at  " + one.toString() + "\n");
        }
        text = e.toString() + "\n" + stringBuilder.toString();
        return text;
    }

    public static String eToStringWithLog(Exception e)
    {
        String text = "";
        StringBuilder stringBuilder = new StringBuilder();
        for (StackTraceElement one : e.getStackTrace()){
            stringBuilder.append("at  " + one.toString() + "\t");
        }
        text = e.toString() + "\t" + stringBuilder.toString();
        return text;
    }
}
