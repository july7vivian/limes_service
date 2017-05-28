package com.limes.dao.entity;

import java.util.List;

public class Config {
    private List<PREFIX> PREFIXs;
    private SOURCE source;
    private TARGET target;
    private String METRIC;
    private ACCEPTANCE acceptance;
    private REVIEW review;
    private EXECUTION execution;
    private String OUTPUT;

    public List<PREFIX> getPREFIXs() {
        return PREFIXs;
    }

    public void setPREFIXs(List<PREFIX> PREFIXs) {
        this.PREFIXs = PREFIXs;
    }

    public SOURCE getSource() {
        return source;
    }

    public void setSource(SOURCE source) {
        this.source = source;
    }

    public TARGET getTarget() {
        return target;
    }

    public void setTarget(TARGET target) {
        this.target = target;
    }

    public String getMETRIC() {
        return METRIC;
    }

    public void setMETRIC(String METRIC) {
        this.METRIC = METRIC;
    }

    public ACCEPTANCE getAcceptance() {
        return acceptance;
    }

    public void setAcceptance(ACCEPTANCE acceptance) {
        this.acceptance = acceptance;
    }

    public REVIEW getReview() {
        return review;
    }

    public void setReview(REVIEW review) {
        this.review = review;
    }

    public EXECUTION getExecution() {
        return execution;
    }

    public void setExecution(EXECUTION execution) {
        this.execution = execution;
    }

    public String getOUTPUT() {
        return OUTPUT;
    }

    public void setOUTPUT(String OUTPUT) {
        this.OUTPUT = OUTPUT;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<!DOCTYPE LIMES SYSTEM \"limes.dtd\">\n<LIMES>\n");
        for(PREFIX prefix : PREFIXs){
            sb.append(prefix.toString());
        }
        sb.append(source.toString());
        sb.append(target.toString());
        sb.append("<METRIC>").append(METRIC).append("</METRIC>\n");
        sb.append(acceptance.toString());
        sb.append(review.toString());
        sb.append(execution.toString());
        sb.append("<OUTPUT>").append(OUTPUT).append("</OUTPUT>\n");
        sb.append("</LIMES>\n");
        return sb.toString();
    }

}
