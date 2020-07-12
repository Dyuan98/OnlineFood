package com.yuan.domain;

public class Message {
    private int mid;
    private int uid;
    private int fid;
    private String mTime;
    private String evaluate;

    private Food food;
    private User user;

    public Message() {
    }

    public Message(int mid, int uid, int fid, String mTime, String evaluate, Food food, User user) {
        this.mid = mid;
        this.uid = uid;
        this.fid = fid;
        this.mTime = mTime;
        this.evaluate = evaluate;
        this.food = food;
        this.user = user;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
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

    public String getmTime() {
        return mTime;
    }

    public void setmTime(String mTime) {
        this.mTime = mTime;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
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
        return "Message{" +
                "mid=" + mid +
                ", uid=" + uid +
                ", fid=" + fid +
                ", mTime='" + mTime + '\'' +
                ", evaluate='" + evaluate + '\'' +
                ", food=" + food +
                ", user=" + user +
                '}';
    }
}
