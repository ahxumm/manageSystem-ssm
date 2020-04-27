package com.xumeng.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
public class Role {
    private Integer id;
    private String roleName;
    private String roleDesc;
    private List<Permission> permissions;
    private List<User> users;
}
