package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.IPermissionDao;
import com.xumeng.domain.Permission;
import com.xumeng.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private IPermissionDao permissionDao;

    //分页查询权限信息
    @Override
    public List<Permission> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return permissionDao.findAll();
    }

    //添加权限
    @Override
    public void save(Permission permission) throws Exception {
        permissionDao.save(permission);
    }
}
