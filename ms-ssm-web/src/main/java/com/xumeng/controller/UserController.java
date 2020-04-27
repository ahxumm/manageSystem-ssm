package com.xumeng.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xumeng.domain.Role;
import com.xumeng.domain.UserInfo;
import com.xumeng.service.IUserService;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    /**
     * 分页查找用户
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> users = userService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(users);
        mv.addObject(pageInfo);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * 添加用户
     * @param userInfo
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception{
        userService.save(userInfo);
        return "redirect:findAll.do";
    }

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user", userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 查询用户可以添加的角色
     * @param id
     * @return
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = userService.findUserByIdAndAllRole(id);
        UserInfo user = userService.findById(id);
        mv.addObject("roleList", roleList);
        mv.addObject("user", user);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 给用户添加角色
     * @param userId
     * @param ids
     * @return
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId", required = true)Integer userId,
                                @RequestParam(name = "ids", required = true)Integer[] ids) throws Exception{
        //System.out.println(userId+"---"+ids);
        userService.addRoleToUser(userId, ids);
        return "redirect:findAll.do";
    }

}
