package com.xumeng.service;

import com.xumeng.domain.OrderTravller;
import com.xumeng.domain.Traveller;

import java.util.List;

public interface ITravellerService {
    // 查找所有游客
    List<Traveller> findAll(Integer page, Integer size) throws Exception;

    // 添加订单号
    void addOrderId(OrderTravller orderTravller) throws Exception;
}
