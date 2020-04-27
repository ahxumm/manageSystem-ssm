package com.xumeng.dao;

import com.xumeng.domain.Product;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface IProductDao {
    // 分页查找所有商品
    List<Product> findAll(String productName) throws Exception;

    // 保存新的商品
    void save(Product product) throws Exception;

    //删除商品
    Integer delete(int id) throws Exception;

    //改变商品状态
    void changeProductStatus(Product product) throws Exception;

    //根据id查询商品
    Product findById(Integer id) throws Exception;

    //完成编辑商品保存
    void productEditFinsh(Product product) throws Exception;

    // 查找所有商品
    List<Product> findAllProduct() throws Exception;
}
