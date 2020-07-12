package com.yuan.service;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.yuan.dao.OrderMapper;
import com.yuan.domain.Order;

import java.util.List;

public class OrderServiceImpl implements OrderService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private OrderMapper orderMapper;
    public void setOrderMapper(OrderMapper orderMapper){
        this.orderMapper = orderMapper;
    }

    /**
     * 用户将商品加入购物车
     * @param order
     * @return
     */
    @Override
    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    /**
     * status为0，查询用户的购物车信息
     * status为1，查询用户的历史订单信息
     * @param id
     * @return
     */
    @Override
    public List<Order> queryOrderByUid(int id,int status) {
        return orderMapper.queryOrderByUid(id,status);
    }

    /**
     * 根据oid移除购物车中的记录
     * @param oid
     * @return
     */
    @Override
    public int delOrder(int oid) {
        return orderMapper.delOrder(oid);
    }

    @Override
    public int pay(Order order) {
        return orderMapper.pay(order);
    }

    /**
     * 查询所有订单
     * @return
     */
    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }
}
