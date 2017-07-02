package com.limes.dao.entity;

/**
 * Created by dluo on 2017/5/26.
 */
public class REVIEW {
    private String THRESHOLD;
    private String FILE;
    private String RELATION;

    public String getTHRESHOLD() {
        return THRESHOLD;
    }

    public void setTHRESHOLD(String THRESHOLD) {
        this.THRESHOLD = THRESHOLD;
    }

    public String getFILE() {
        return FILE;
    }

    public void setFILE(String FILE) {
        this.FILE = FILE;
    }

    public String getRELATION() {
        return RELATION;
    }

    public void setRELATION(String RELATION) {
        this.RELATION = RELATION;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<REVIEW>\n");
        sb.append("<THRESHOLD>").append(THRESHOLD).append("</THRESHOLD>\n");
        sb.append("<FILE>").append(FILE).append("</FILE>\n");
        sb.append("<RELATION>").append(RELATION).append("</RELATION>\n");
        sb.append("</REVIEW>\n");
        return sb.toString();
    }
}
