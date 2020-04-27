package com.xumeng.controller;

import com.github.pagehelper.PageInfo;
import com.xumeng.domain.OrderTravller;
import com.xumeng.domain.Orders;
import com.xumeng.domain.Traveller;
import com.xumeng.service.IOrderService;
import com.xumeng.service.ITravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/traveller")
public class TravellerController {

    @Autowired
    private ITravellerService travellerService;
    @Autowired
    private IOrderService orderService;

    /**
     * 分页查找所有
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Traveller> travellers = travellerService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(travellers);
        mv.addObject("pageInfo", pageInfo);
        List<Orders> orders = orderService.findAllOrders();
        mv.addObject("orders", orders);
        mv.setViewName("traveller-list");
        return mv;
    }

    /**
     * 添加订单号
     * @param travellerId
     * @param orderId
     */
    @RequestMapping("addOrderId.do")
    public String addOrderId(@RequestParam("travellerId") Integer travellerId, @RequestParam("orderId") Integer orderId) throws Exception{
        //System.out.println(travellerId+"---"+orderId);
        OrderTravller orderTravller = new OrderTravller();
        orderTravller.setOrderId(orderId);
        orderTravller.setTravellerId(travellerId);
        travellerService.addOrderId(orderTravller);
        return "redirect:findAll.do";
    }
}
