package com.yuan.service;

import com.yuan.domain.Order;

import java.util.List;

public interface OrderService {
    // 添加新的订单
    int addOrder(Order order);

    // 根据useId查询此用户的订单
    List<Order> queryOrderByUid(int id, int status);

    // 根据order的oid删除订单，status为0即为购物车，为1即为已付款
    int delOrder(int oid);

    // 付款，将商品状态改为已付款状态即为1，修改加入购物车时间为下单时间
    int pay(Order order);

    // 查询所有订单
    List<Order> queryAllOrder();
}
