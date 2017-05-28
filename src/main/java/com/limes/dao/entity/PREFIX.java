package com.limes.dao.entity;

public class PREFIX {
    private String NAMESPACE;
    private String LABEL;

    public String getNAMESPACE() {
        return NAMESPACE;
    }

    public void setNAMESPACE(String NAMESPACE) {
        this.NAMESPACE = NAMESPACE;
    }

    public String getLABEL() {
        return LABEL;
    }

    public void setLABEL(String LABEL) {
        this.LABEL = LABEL;
    }



    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<PREFIX>\n");
        sb.append("<NAMESPACE>").append(NAMESPACE).append("</NAMESPACE>\n");
        sb.append("<LABEL>").append(LABEL).append("</LABEL>\n");
        sb.append("</PREFIX>\n");
        return sb.toString();
    }

}
