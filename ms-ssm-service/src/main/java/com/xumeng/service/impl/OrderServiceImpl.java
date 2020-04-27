package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.IOrderDao;
import com.xumeng.dao.IProductDao;
import com.xumeng.domain.Orders;
import com.xumeng.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private IOrderDao orderDao;

    // 分页查询所有订单
    @Override
    public List<Orders> findAll(Integer page, Integer size, String orderNum) throws Exception{
        PageHelper.startPage(page, size);
        return orderDao.findAll(orderNum);
    }

    // 根据id查询
    @Override
    public Orders findById(Integer id) throws Exception {
        return orderDao.findbyId(id);
    }

    // 完成添加新订单
    @Override
    public void orderAddFinish(Orders order) throws Exception {
        orderDao.orderAddFinish(order);
    }

    // 查询所有订单
    @Override
    public List<Orders> findAllOrders() throws Exception {
        return orderDao.findAllOrders();
    }

    //删除订单
    @Override
    public void delete(List<Integer> checkboxList) throws Exception {
        for(int i=0; i<checkboxList.size(); i++){
            orderDao.deleteTravellerByOrderId(checkboxList.get(i));
            orderDao.delete(checkboxList.get(i));
        }
    }
}
