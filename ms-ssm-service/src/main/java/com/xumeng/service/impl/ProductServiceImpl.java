package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.IProductDao;
import com.xumeng.domain.Product;
import com.xumeng.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;

    // 分页查找所有商品
    @Override
    public List<Product> findAll(Integer page, Integer size, String productName) throws Exception {
        PageHelper.startPage(page, size);
        return productDao.findAll(productName);
    }

    // 添加新的商品
    @Override
    public void save(Product product) throws Exception {
        productDao.save(product);
    }

    // 删除商品
    @Override
    public Integer delete(List<Integer> data) throws Exception {
        int count = 0;
        for(int i=0; i<data.size(); i++){
            Integer result = productDao.delete(data.get(i));
            if(result>0)
                count++;
        }
        return count;
    }

    //改变商品状态
    public void changeProductStatus(Product product) throws Exception{
        productDao.changeProductStatus(product);
    }

    // 根据id查询商品
    @Override
    public Product findById(Integer id) throws Exception {
        return productDao.findById(id);
    }

    //完成编辑商品保存
    @Override
    public void productEditFinsh(Product product) throws Exception {
        productDao.productEditFinsh(product);
    }

    // 查找所有商品
    @Override
    public List<Product> findAllProduct() throws Exception {
        return productDao.findAllProduct();
    }
}
