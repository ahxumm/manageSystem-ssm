package com.xumeng.service;

import com.xumeng.domain.Permission;
import com.xumeng.domain.Role;

import java.util.List;

public interface IRoleService {

    //分页查询角色信息
    List<Role> findAll(Integer page, Integer size) throws Exception;

    //查询角色详细信息
    Role findById(Integer id) throws Exception;

    //查询角色可添加权限
    List<Permission> findRoleByIdAndAllPermission(Integer id) throws Exception;

    // 给角色添加权限
    void addPermissionToRole(Integer roleId, Integer ids) throws Exception;

    // 添加角色
    void save(Role role) throws Exception;
}
