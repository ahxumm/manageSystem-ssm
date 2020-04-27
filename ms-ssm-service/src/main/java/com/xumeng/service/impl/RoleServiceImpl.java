package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.IRoleDao;
import com.xumeng.domain.Permission;
import com.xumeng.domain.Role;
import com.xumeng.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    //分页查询角色信息
    @Override
    public List<Role> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return roleDao.findAll();
    }

    //查询角色详细信息
    @Override
    public Role findById(Integer id) throws Exception {
        return roleDao.findById(id);
    }

    //查询角色可添加权限
    @Override
    public List<Permission> findRoleByIdAndAllPermission(Integer id) throws Exception {
        return roleDao.findRoleByIdAndAllPermission(id);
    }

    // 给角色添加权限
    @Override
    public void addPermissionToRole(Integer roleId, Integer ids) throws Exception {
        roleDao.addPermissionToRole(roleId, ids);
    }


    // 添加角色
    @Override
    public void save(Role role) throws Exception {
        roleDao.save(role);
    }
}
