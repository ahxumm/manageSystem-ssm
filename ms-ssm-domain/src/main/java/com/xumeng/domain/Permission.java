package com.xumeng.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
public class Permission {
    private Integer id;
    private String permissionName;
    private String url;
    private List<Role> roles;
}
