package com.xumeng.test;

import com.xumeng.dao.IOrderDao;
import com.xumeng.dao.IPermissionDao;
import com.xumeng.dao.IRoleDao;
import com.xumeng.dao.IUserDao;
import com.xumeng.domain.Orders;
import com.xumeng.service.IOrderService;
import com.xumeng.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestIOderDao {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IRoleDao roleDao;

    @Autowired
    private IUserDao userDao;

    @Autowired
    private IPermissionDao permissionDao;

    @Autowired
    private IUserService userService;

    @Test
    public void findById() throws Exception{
        System.out.println(orderService.findById(1));
    }

    @Test
    public void testRoleDao() throws Exception{
        System.out.println(roleDao.findRoleByUserId(1));
    }

    @Test
    public void testUserDao(){
        System.out.println(userDao.findByUsername("tom"));
    }

    @Test
    public void testFindAllUserByPage() throws Exception{
        System.out.println(userService.findAll(1, 10));
    }

    @Test
    public void findByRoleId() throws Exception{
        System.out.println(permissionDao.findByRoleId(2));
    }

    @Test
    public void findRoleByUserId() throws Exception{
        System.out.println(roleDao.findRoleByUserId(1));
    }

    @Test
    public void userFindById() throws Exception{
        System.out.println(userDao.findById(1));
    }
}
