package com.xumeng.service;

import com.xumeng.domain.Permission;
import com.xumeng.domain.Role;
import com.xumeng.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {

    // 分页查找所有用户
    List<UserInfo> findAll(Integer page, Integer size) throws Exception;

    // 添加用户
    void save(UserInfo userInfo) throws Exception;

    // 根据id查询信息
    UserInfo findById(Integer id) throws Exception;

    //查询用户可以添加的角色
    List<Role> findUserByIdAndAllRole(Integer id) throws Exception;

    //给用户添加角色
    void addRoleToUser(Integer userId, Integer[] ids) throws Exception;

}
