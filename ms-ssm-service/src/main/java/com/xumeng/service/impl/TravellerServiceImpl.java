package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.IOrderDao;
import com.xumeng.dao.ITravellerDao;
import com.xumeng.domain.OrderTravller;
import com.xumeng.domain.Traveller;
import com.xumeng.service.ITravellerService;
import jdk.nashorn.internal.objects.annotations.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TravellerServiceImpl implements ITravellerService {

    @Autowired
    private ITravellerDao travellerDao;

    @Autowired
    private IOrderDao orderDao;

    // 查找所有游客
    @Override
    public List<Traveller> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return travellerDao.findAll();
    }

    // 添加订单号
    @Override
    public void addOrderId(OrderTravller orderTravller) throws Exception {
        travellerDao.addOrderId(orderTravller);
        orderDao.addOneToTotal(orderTravller.getOrderId());
    }


}
