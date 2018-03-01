package com.limes.dao.entity;
import java.util.*;

/**
 * Created by dluo on 18/2/21.
 */
public class MLALGORITHM {

    private String NAME;
    private String TYPE;
    private String TRAINING;
//    private List<PARAMETER> PARAMETERs;


    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }



    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE;
    }



    public String getTRAINING() {
        return TRAINING;
    }

    public void setTRAINING(String TRAINING) {
        this.TRAINING = TRAINING;
    }


//    public List<PARAMETER> getPARAMETERs() {
//        return PARAMETERs;
//    }
//
//    public void setPARAMETERs(List<PARAMETER> PARAMETERs) {
//        this.PARAMETERs = PARAMETERs;
//    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("<MLALGORITHM>\n");
        sb.append("<NAME>").append(NAME).append("</NAME>\n");
        sb.append("<TYPE>").append(TYPE).append("</TYPE>\n");
        sb.append("<TRAINING>").append(TRAINING).append("</TRAINING>\n");

//        for (PARAMETER p: PARAMETERs){
//            sb.append(p.toString());
//        }

        sb.append("</MLALGORITHM>\n");
        return sb.toString();
    }


}



