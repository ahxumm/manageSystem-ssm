package com.xumeng.controller;

import com.github.pagehelper.PageInfo;
import com.xumeng.domain.Member;
import com.xumeng.domain.Orders;
import com.xumeng.domain.Product;
import com.xumeng.service.IMemberService;
import com.xumeng.service.IOrderService;
import com.xumeng.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IMemberService memberService;

    /**
     * 分页查询所有订单
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer size,
                                @RequestParam(name = "orderId", required = true, defaultValue = "") String orderId) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Orders> orders = orderService.findAll(page, size, orderId);
        PageInfo pageInfo = new PageInfo(orders);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("orders-list");

        return mv;
    }

    /**
     * 根据id查看订单
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id") Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Orders order = orderService.findById(id);
        mv.addObject("orders", order);
        mv.setViewName("orders-show");
        return mv;
    }

    /**
     * 添加新订单
     * @return
     * @throws Exception
     */
    @RequestMapping("/orderAdd.do")
    public ModelAndView orderAdd() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Product> products = productService.findAllProduct();
        List<Member> members = memberService.findAllMember();
        mv.addObject("products", products);
        mv.addObject("members", members);
        mv.setViewName("order-add");
        return mv;
    }

    /**
     * 完成添加新订单
     * @param order
     * @return
     * @throws Exception
     */
    @RequestMapping("/orderAddFinish.do")
    public String orderAddFinish(Orders order)throws Exception{
        //System.out.println(order);
        order.setPeopleCount(0);
        orderService.orderAddFinish(order);
        return "redirect:findAll.do";
    }

    /**
     * 删除订单
     * @param chekboxList
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public String delete(@RequestBody List<Integer> chekboxList) throws Exception{
        orderService.delete(chekboxList);
        return "redirect:findAll";
    }
}
