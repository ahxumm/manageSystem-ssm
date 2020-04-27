package com.xumeng.controller;

import com.github.pagehelper.PageInfo;
import com.xumeng.domain.Permission;
import com.xumeng.domain.Role;
import com.xumeng.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.ls.LSException;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 分页查询角色信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1", required = true) Integer page,
                                @RequestParam(name = "size", defaultValue = "10", required = true) Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(roleList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("role-list");
        return mv;
    }

    /**
     * 查询角色详细信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById")
    public ModelAndView findById(Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        mv.addObject("role", role);
        mv.setViewName("role-show");
        return mv;
    }

    /**
     * 查询角色可添加权限
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRoleByIdAndAllPermission")
    public ModelAndView findRoleByIdAndAllPermission(Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Permission> permissions = roleService.findRoleByIdAndAllPermission(id);
        Role role = roleService.findById(id);
        mv.addObject("permissionList", permissions);
        mv.addObject("role", role);
        mv.setViewName("role-permission-add");
        return mv;
    }

    /**
     * 给角色添加权限
     * @param roleId
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermissionToRole")
    public String addPermissionToRole(Integer roleId, Integer ids) throws Exception{
        //System.out.println(roleId+"---"+ids);
        roleService.addPermissionToRole(roleId, ids);

        return "redirect:findAll.do";
    }

    /**
     * 添加角色
     * @param role
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(Role role) throws  Exception{
        roleService.save(role);
        return "redirect:findAll.do";
    }
}
