package com.yuan.dao;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.yuan.domain.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    // 查询所有订单
    List<Order> queryAllOrder();

    // 添加新的订单
    int addOrder(Order order);

    // 根据useId查询此用户的订单,status为0即为购物车，为1即为已付款
    List<Order> queryOrderByUid(@Param("id") int id, @Param("status") int status);

    // 根据order的oid删除订单
    int delOrder(@Param("oid") int oid);

    // 付款
    int pay(Order order);
}
