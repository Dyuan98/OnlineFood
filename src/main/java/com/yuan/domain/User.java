package com.yuan.domain;

public class User {
    private  int id;
    private String name;
    private String pwd;
    private String phone;
    private String address;
    private Double money;
    
    // 做模糊查询时，新加的两个属性，用于分页按条件查询
    private int startRows;
    private int pageSize;

    public User(int id, String name, String pwd, String phone, String address, Double money, int startRows, int pageSize) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.phone = phone;
        this.address = address;
        this.money = money;
        this.startRows = startRows;
        this.pageSize = pageSize;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", money=" + money +
                ", startRows=" + startRows +
                ", pageSize=" + pageSize +
                '}';
    }
}
