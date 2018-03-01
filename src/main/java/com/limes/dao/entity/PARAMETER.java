package com.limes.dao.entity;

/**
 * Created by dluo on 18/2/21.
 */
public class PARAMETER {

    private String NAME;
    private String VALUE;

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }


    public String getVALUE() {
        return VALUE;
    }

    public void setVALUE(String VALUE) {
        this.VALUE = VALUE;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<PARAMETER>\n");
        sb.append("<NAME>").append(NAME).append("</NAME>\n");
        sb.append("<VALUE>").append(VALUE).append("</VALUE>\n");
        sb.append("</PARAMETER>\n");
        return sb.toString();
    }
}
