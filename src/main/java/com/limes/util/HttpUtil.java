package com.limes.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Strings;
import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Iterator;
import java.util.Map;


public class HttpUtil {
    private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);

    public static String getMethod(Map<String,String> header,String requestUrl,String charset, String pvidStr) {
        if (Strings.isNullOrEmpty(requestUrl))
            return null;
        HttpClient httpclient = new HttpClient();
        GetMethod getMethod = new GetMethod(requestUrl);
        if (header != null ) {
            for (Map.Entry<String, String> map : header.entrySet()) {
                getMethod.setRequestHeader(map.getKey(), map.getValue());
            }
        }
        StringBuilder httpResult = new StringBuilder();
        try {
            int statusCode = httpclient.executeMethod(getMethod);
            if (statusCode != HttpStatus.SC_OK) {
                throw new RuntimeException("runtime");
            }
            InputStream responseBody = getMethod.getResponseBodyAsStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(responseBody, charset == null ? "utf-8" : charset));
            String line = reader.readLine();
            while (line != null) {
                httpResult.append(line);
                line = reader.readLine();
            }
        } catch (HttpException e) {

        } catch (IOException e) {

        } finally {
            getMethod.releaseConnection();
        }
        return httpResult.toString();
    }



    /**
     * 发起http请求并获取结果(POST)
     *
     * @param url 请求地址
     * @param Params 提交的json字符串
     * @param  pvidStr uuid
     * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
     */
    public static JSONObject httpPostJson(String url,String Params, String pvidStr,  String errorCode){
        OutputStreamWriter out = null;
        BufferedReader reader = null;
        String response="";
        try {
            URL httpUrl = null; //HTTP URL类 用这个类来创建连接
            //创建URL
            httpUrl = new URL(url);
            //建立连接
            HttpURLConnection conn = (HttpURLConnection) httpUrl.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("connection", "keep-alive");
            conn.setUseCaches(false);//设置不要缓存
            conn.setInstanceFollowRedirects(true);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.connect();
            //POST请求
            out = new OutputStreamWriter(
                    conn.getOutputStream());
            out.write(Params);
            out.flush();
            //读取响应
            reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream()));
            String lines;
            StringBuffer buffer = new StringBuffer();
            while ((lines = reader.readLine()) != null) {
                buffer.append(lines);
            }
            response = buffer.toString();
            reader.close();
            // 断开连接
            conn.disconnect();
        } catch (Exception e) {
            logger.warn("\t" + pvidStr + "\t" + url + "?" + Params + "\trequest error\t" + ExceptionDealUtil.eToStringWithLog(e));
            throw new RuntimeException(e.getMessage() + ":" + "|Code|" + errorCode + "|Code|" + "|pvidStr|" + pvidStr + "|pvidStr|"  + url+ " request错误: jsonStr - " + Params);
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(reader!=null){
                    reader.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        //将URL响应转化为JSON类型
        JSONObject json = JSONArray.parseObject(response);
        return json;
    }

    /**
     *
     * @param urlStr 接口地址
     * @param textMap 请求文本
     * @param filename 文件名
     * @param file 文件
     * @param contentType 文件类型
     * @return String url的响应信息返回值
     * @param  pvidStr uuid
     */
    public static String httpPostFile(String urlStr, Map<String, String> textMap, String filename, byte[] file, String contentType, String pvidStr,  String errorCode) {
        String res = "";
        HttpURLConnection conn = null;
        // boundary就是request头和上传文件内容的分隔符
        String BOUNDARY = "---------------------------123821742118716";
        try {
            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(3000);
            conn.setReadTimeout(3000);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("User-Agent",
                    "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
            conn.setRequestProperty("Content-Type",
                    "multipart/form-data; boundary=" + BOUNDARY);
            // OutputStream 用于向服务器发送数据
            OutputStream out = new DataOutputStream(conn.getOutputStream());
            // text
            if (textMap != null) {
                StringBuffer strBuf = new StringBuffer();
                Iterator iter = textMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    strBuf.append("\r\n").append("--").append(BOUNDARY)
                            .append("\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\""
                            + inputName + "\"\r\n\r\n");
                    strBuf.append(inputValue);
                }
                out.write(strBuf.toString().getBytes());
            }
            // file
            if (contentType == null || "".equals(contentType)) {
                contentType = "application/octet-stream";
            }
            StringBuffer strBuf = new StringBuffer();
            strBuf.append("\r\n").append("--").append(BOUNDARY)
                    .append("\r\n");
            strBuf.append("Content-Disposition: form-data; name=\""
                    + "file" + "\"; filename=\"" + filename
                    + "\"\r\n");
            strBuf.append("Content-Type:" + contentType + "\r\n\r\n");
            out.write(strBuf.toString().getBytes());
            DataInputStream in = new DataInputStream(
                    new ByteArrayInputStream(file));
            int bytes = 0;
            byte[] bufferOut = new byte[1024];
            while ((bytes = in.read(bufferOut)) != -1) {
                out.write(bufferOut, 0, bytes);
            }
            in.close();
            byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes();

            out.write(endData);
            out.flush();
            out.close();
            // 读取返回数据  InputStreamReader用于从服务器接收数据
            strBuf = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                strBuf.append(line).append("\n");
            }
            res = strBuf.toString();
            reader.close();
            reader = null;
        } catch (Exception e) {
            logger.warn("\t" + pvidStr + "\t" + urlStr +"发送Post请求出现异常\t" + ExceptionDealUtil.eToStringWithLog(e));
            throw new RuntimeException(e.getMessage() + "|Code|" + errorCode + "|Code||pvidStr|" + pvidStr + "|pvidStr|" + urlStr +"发送pic Post请求出现异常");
        } finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }
        //JSONObject jsonObject = JSON.parseObject(res);
        return res;
    }

    /**
     * 发起http请求并获取结果(POST)
     *
     * @param url 请求地址
     * @param param 提交的数据
     * @param  pvidStr uuid
     * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
     */
    public static JSONObject httpRequest(String url,NameValuePair[] param, String pvidStr,  String errorCode){
        HttpClient client = new HttpClient();
        HttpMethod method = new PostMethod(url);
        JSONObject result = null;
        try{
            method.setQueryString(param);
            client.executeMethod(method);
            result = JSON.parseObject(method.getResponseBodyAsString());
        }catch(Exception e){
            logger.warn("\t" + pvidStr + "\t" + "server connection timed out.(Http,POST)\t" + ExceptionDealUtil.eToStringWithLog(e));
            throw new RuntimeException(e.getMessage() + "|Code|" + errorCode + "|Code||pvidStr|" + pvidStr + "|pvidStr|" + "server connection timed out.(Http,POST)");
        }finally {
            //释放连接
            method.releaseConnection();
        }
        return result;
    }

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url 发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @param  pvidStr uuid
     * @return URL 所代表远程资源的响应结果
     */
    public static JSONObject sendGet(String url, String param, String pvidStr,  String errorCode) {
        JSONObject jsonObject = null;
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            logger.warn("\t" + pvidStr + "\t" + url + "?" + param +"发送GET请求出现异常" + ExceptionDealUtil.eToStringWithLog(e));
            throw new RuntimeException(e.getMessage() + "|Code|" + errorCode + "|Code||pvidStr|" + pvidStr + "|pvidStr|" + url + "?" + param + "发送GET请求出现异常");
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        jsonObject = JSON.parseObject(result);
        return jsonObject;
    }



    public static String queryStatus(String url, String param, String pvidStr,  String errorCode) {
        JSONObject jsonObject = null;
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            logger.warn("\t" + pvidStr + "\t" + url + "?" + param +"发送GET请求出现异常" + ExceptionDealUtil.eToStringWithLog(e));
            throw new RuntimeException(e.getMessage() + "|Code|" + errorCode + "|Code||pvidStr|" + pvidStr + "|pvidStr|" + url + "?" + param + "发送GET请求出现异常");
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

}
