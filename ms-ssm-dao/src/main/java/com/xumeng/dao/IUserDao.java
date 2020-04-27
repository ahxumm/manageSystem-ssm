package com.xumeng.dao;

import com.xumeng.domain.Role;
import com.xumeng.domain.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public interface IUserDao {
    // 根据用户名查询用户信息
    UserInfo findByUsername(String username) throws UsernameNotFoundException;

    // 分页查询用户信息
    List<UserInfo> findAll() throws Exception;

    // 添加用户
    void save(UserInfo userInfo) throws Exception;

    // 根据id查询用户信息
    UserInfo findById(Integer id) throws Exception;

    //查询用户可以添加的角色
    List<Role> findUserByIdAndAllRole(Integer id) throws Exception;

    //给用户添加角色
    void addRoleToUser(@Param("userId") Integer userId, @Param("roleId") Integer roleId) throws Exception;
}
