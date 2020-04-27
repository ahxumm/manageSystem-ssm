package com.xumeng.dao;

import com.xumeng.domain.Permission;
import com.xumeng.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IRoleDao {
    // 根据用户Id查询角色
    List<Role> findRoleByUserId(Integer userId) throws Exception;

    //分页查询角色信息
    List<Role> findAll() throws Exception;

    //查询角色详细信息
    Role findById(Integer id) throws Exception;

    //查询角色可添加权限
    List<Permission> findRoleByIdAndAllPermission(Integer id) throws Exception;

    // 给角色添加权限
    void addPermissionToRole(@Param("roleId") Integer roleId, @Param("permissionId") Integer ids) throws Exception;

    // 添加角色
    void save(Role role) throws Exception;
}
