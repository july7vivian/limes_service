package com.limes.dao.entity;

/**
 * Created by dluo on 17/9/12.
 */
public class ROLE {
    private int id;
    private String roleName;

    public ROLE(){

    }

    public ROLE(int id, String roleName) {
        this.id = id;
        this.roleName = roleName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getId(){return id;}
}
