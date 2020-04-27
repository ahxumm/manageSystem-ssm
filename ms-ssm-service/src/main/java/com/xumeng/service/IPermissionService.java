package com.xumeng.service;

import com.xumeng.domain.Permission;

import java.util.List;

public interface IPermissionService {
    //分页查询权限信息
    List<Permission> findAll(Integer page, Integer size) throws Exception;

    //添加权限
    void save(Permission permission) throws Exception;
}
