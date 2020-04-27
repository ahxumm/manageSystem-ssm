package com.xumeng.service;

import com.xumeng.domain.Orders;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IOrderService {
    // 分页查询所有订单
    List<Orders> findAll(Integer page, Integer size, String orderNum) throws Exception;

    // 根据id查询
    Orders findById(Integer id) throws Exception;

    // 完成添加新订单
    void orderAddFinish(Orders order) throws Exception;

    // 查询所有订单
    List<Orders> findAllOrders() throws Exception;

    //删除订单
    void delete(List<Integer> checkboxList) throws Exception;
}
