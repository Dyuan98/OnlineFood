package com.yuan.domain;

public class Food {
    private int fid;
    private String fname;
    private String ftype;
    private int faccount;
    private double price;
    private String introduce;
    private String imgUrl;

    // 做模糊查询时，新加的两个属性，用于分页按条件查询
    private int startRows;
    private int pageSize;
    // 用于辨别是否为主页用户条件查询还是管理控制台管理员查询，
    private boolean temp;

    public Food(int fid, String fname, String ftype, int faccount, double price, String introduce, String imgUrl, int startRows, int pageSize, boolean temp) {
        this.fid = fid;
        this.fname = fname;
        this.ftype = ftype;
        this.faccount = faccount;
        this.price = price;
        this.introduce = introduce;
        this.imgUrl = imgUrl;
        this.startRows = startRows;
        this.pageSize = pageSize;
        this.temp = temp;
    }

    public Food() {
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype;
    }

    public int getFaccount() {
        return faccount;
    }

    public void setFaccount(int faccount) {
        this.faccount = faccount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getStartRows() {
        return startRows;
    }

    public void setStartRows(int startRows) {
        this.startRows = startRows;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public boolean isTemp() {
        return temp;
    }

    public void setTemp(boolean temp) {
        this.temp = temp;
    }

    @Override
    public String toString() {
        return "Food{" +
                "fid=" + fid +
                ", fname='" + fname + '\'' +
                ", ftype='" + ftype + '\'' +
                ", faccount=" + faccount +
                ", price=" + price +
                ", introduce='" + introduce + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", startRows=" + startRows +
                ", pageSize=" + pageSize +
                ", temp=" + temp +
                '}';
    }
}
