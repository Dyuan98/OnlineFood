package com.yuan.domain;

public class Order {
    private int oid;
    private int uid;
    private int fid;
    private String oTime;
    private int oStatus;

    private Food food;
    private User user;

    public Order(int oid, int uid, int fid, String oTime, int oStatus, Food food, User user) {
        this.oid = oid;
        this.uid = uid;
        this.fid = fid;
        this.oTime = oTime;
        this.oStatus = oStatus;
        this.food = food;
        this.user = user;
    }

    public Order() {
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getoTime() {
        return oTime;
    }

    public void setoTime(String oTime) {
        this.oTime = oTime;
    }

    public int getoStatus() {
        return oStatus;
    }

    public void setoStatus(int oStatus) {
        this.oStatus = oStatus;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", uid=" + uid +
                ", fid=" + fid +
                ", oTime='" + oTime + '\'' +
                ", oStatus=" + oStatus +
                ", food=" + food +
                ", user=" + user +
                '}';
    }
}
