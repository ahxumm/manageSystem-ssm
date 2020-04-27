package com.xumeng.dao;

import com.xumeng.domain.Member;
import com.xumeng.domain.OrderTravller;
import com.xumeng.domain.Traveller;

import java.util.List;

public interface ITravellerDao {
    // 根据id列表查询
    public List<Traveller> findByIds(Integer orderId) throws Exception;

    //查找所有用户
    List<Traveller> findAll() throws Exception;

    // 添加订单号
    void addOrderId(OrderTravller orderTravller) throws Exception;
}
