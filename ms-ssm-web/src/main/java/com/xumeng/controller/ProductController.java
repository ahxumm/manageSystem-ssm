package com.xumeng.controller;

import com.github.pagehelper.PageInfo;
import com.xumeng.domain.Product;
import com.xumeng.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;

    /**
     * 查询所有商品
     * @return
     */
    @RequestMapping("/findAll.do")
    @RolesAllowed("ADMIN")
    public ModelAndView findAll(@RequestParam(name="page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name="size", required = true, defaultValue = "10") Integer size,
                                @RequestParam(name="probuctName", required = true, defaultValue = "") String productName) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Product> products = productService.findAll(page, size, productName);
        PageInfo pageInfo = new PageInfo(products);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("product-list");
        return mv;
    }

    /**
     * 保存新的商品
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(Product product) throws Exception{
        productService.save(product);
        return "redirect:findAll.do";
    }

    /**
     * 删除商品
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public ModelAndView  delete(@RequestBody List<Integer>  chekboxList) throws Exception{
        ModelAndView mv = new ModelAndView();
        Integer delCount = productService.delete(chekboxList);
        if(delCount > 0){
            mv.addObject("delCount", delCount);
            mv.setView(new MappingJackson2JsonView());
            return mv;
        }else {
            mv.addObject("delCount", 0);
            mv.setView(new MappingJackson2JsonView());
            return mv;
        }
    }

    /**
     * 改变商品状态
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeProductStatus.do")
    public ModelAndView changeProductStatus(@RequestBody String id) throws Exception{
        System.out.println(id);
        Product product = productService.findById(Integer.parseInt(id));
        System.out.println(product);
        productService.changeProductStatus(product);
        return null;
    }

    /**
     * 编辑商品
     * @param id
     * @return
     */
    @RequestMapping("/productEdit.do")
    public ModelAndView productEdit(@RequestParam(name = "id", required = true) Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Product product = productService.findById(id);
        mv.addObject("product", product);
        mv.setViewName("product-edit");
        return mv;
    }

    /**
     * 完成编辑商品保存
     * @param product
     * @return
     * @throws Exception
     * 问题：表单提交，id总是为空所以使用restful参数
     */
    @RequestMapping("/productEditFinsh.do")
    public String productEditFinsh(@RequestParam(value = "id", required = true) Integer id, Product product) throws Exception{
        product.setId(id);
        productService.productEditFinsh(product);
        return "redirect:findAll.do";
    }
}
