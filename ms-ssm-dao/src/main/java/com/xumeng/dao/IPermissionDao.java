package com.xumeng.dao;

import com.xumeng.domain.Permission;

import java.util.List;

public interface IPermissionDao {
    // 根据roleId列表查询权限
    List<Permission> findByRoleId(Integer roleId);

    //分页查询权限信息
    List<Permission> findAll() throws Exception;

    // 添加权限
    void save(Permission permission) throws Exception;
}
