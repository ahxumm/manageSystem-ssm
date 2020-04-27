package com.xumeng.dao;

import com.xumeng.domain.Orders;

import java.util.List;

public interface IOrderDao {
    // 分页查询所有订单
    List<Orders> findAll(String orderNum) throws Exception;

    //根据Id查询
    Orders findbyId(Integer id) throws Exception;

    // 完成添加新订单
    void orderAddFinish(Orders order) throws Exception;

    // 查询所有订单
    List<Orders> findAllOrders() throws Exception;

    // 订单人数加一
    void addOneToTotal(Integer id) throws Exception;

    //删除订单
    void delete(Integer orderId) throws Exception;

    // 删除与订单关联的游客
    void deleteTravellerByOrderId(Integer orderId) throws Exception;
}
