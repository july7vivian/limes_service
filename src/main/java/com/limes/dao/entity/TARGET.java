package com.limes.dao.entity;

/**
 * Created by dluo on 2017/5/26.
 */
public class TARGET {
    private String ID;
    private String ENDPOINT;
    private String VAR;
    private String PAGESIZE;
    private String RESTRICTION;
    private String PROPERTY;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getENDPOINT() {
        return ENDPOINT;
    }

    public void setENDPOINT(String ENDPOINT) {
        this.ENDPOINT = ENDPOINT;
    }

    public String getVAR() {
        return VAR;
    }

    public void setVAR(String VAR) {
        this.VAR = VAR;
    }

    public String getPAGESIZE() {
        return PAGESIZE;
    }

    public void setPAGESIZE(String PAGESIZE) {
        this.PAGESIZE = PAGESIZE;
    }

    public String getRESTRICTION() {
        return RESTRICTION;
    }

    public void setRESTRICTION(String RESTRICTION) {
        this.RESTRICTION = RESTRICTION;
    }

    public String getPROPERTY() {
        return PROPERTY;
    }

    public void setPROPERTY(String PROPERTY) {
        this.PROPERTY = PROPERTY;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<TARGET>\n");
        sb.append("<ID>").append(ID).append("</ID>\n");
        sb.append("<ENDPOINT>").append(ENDPOINT).append("</ENDPOINT>\n");
        sb.append("<VAR>").append(VAR).append("</VAR>\n");
        sb.append("<PAGESIZE>").append(PAGESIZE).append("</PAGESIZE>\n");
        sb.append("<RESTRICTION>").append(RESTRICTION).append("</RESTRICTION>\n");
        sb.append("<PROPERTY>").append(PROPERTY).append("</PROPERTY>\n");
        sb.append("</TARGET>\n");
        return sb.toString();
    }
}
