package com.yuan.domain;

public class Admin {
    private int aid;
    private String aName;
    private String password;

    public Admin(int aid, String aName, String password) {
        this.aid = aid;
        this.aName = aName;
        this.password = password;
    }

    public Admin() {
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", aName='" + aName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
