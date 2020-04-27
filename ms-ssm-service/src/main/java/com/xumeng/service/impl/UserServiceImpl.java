package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.IUserDao;
import com.xumeng.domain.Role;
import com.xumeng.domain.UserInfo;
import com.xumeng.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.security.util.Password;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = userDao.findByUsername(username);
        List<Role> roles = userInfo.getRoles();
        List<SimpleGrantedAuthority> authorities = getAuthority(roles);
        User user = new User(userInfo.getUsername(),userInfo.getPassword(),userInfo.getStatus() == 0 ? false : true, true, true, true, authorities);

        return user;
    }

    private List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> authorities = new ArrayList();
        for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority("ROLE_" +role.getRoleName()));
        }
        return authorities;
    }

    // 分页查找所有用户
    @Override
    public List<UserInfo> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return userDao.findAll();
    }

    // 添加用户
    @Override
    public void save(UserInfo userInfo) throws Exception {
        userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    // 根据id查询信息
    @Override
    public UserInfo findById(Integer id) throws Exception {
        return userDao.findById(id);
    }

    //查询用户可以添加的角色
    @Override
    public List<Role> findUserByIdAndAllRole(Integer id) throws Exception {
        return userDao.findUserByIdAndAllRole(id);
    }

    //给用户添加角色
    @Override
    public void addRoleToUser(Integer userId, Integer[] ids) throws Exception {
        for(int i=0; i<ids.length; i++){

            userDao.addRoleToUser(userId, ids[i]);
        }
    }

}
