package com.limes.dao.entity;

/**
 * Created by dluo on 2017/5/26.
 */
public class EXECUTION {
    private String REWRITER;
    private String PLANNER;
    private String ENGINE;
    public String getREWRITER() {
        return REWRITER;
    }

    public void setREWRITER(String REWRITER) {
        this.REWRITER = REWRITER;
    }

    public String getPLANNER() {
        return PLANNER;
    }

    public void setPLANNER(String PLANNER) {
        this.PLANNER = PLANNER;
    }

    public String getENGINE() {
        return ENGINE;
    }

    public void setENGINE(String ENGINE) {
        this.ENGINE = ENGINE;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<EXECUTION>\n");
        sb.append("<REWRITER>").append(REWRITER).append("</REWRITER>\n");
        sb.append("<PLANNER>").append(PLANNER).append("</PLANNER>\n");
        sb.append("<ENGINE>").append(ENGINE).append("</ENGINE>\n");
        sb.append("</EXECUTION>\n");
        return sb.toString();
    }

}
