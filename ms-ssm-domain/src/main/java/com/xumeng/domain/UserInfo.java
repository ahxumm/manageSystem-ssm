package com.xumeng.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
public class UserInfo {
    private Integer id;
    private String username;
    private String email;
    private String password;
    private String phoneNum;
    private Integer status;
    private String statusStr;
    private List<Role> roles;

    public String getStatusStr() {
        if(status == 0){
            statusStr = "未开启";
        }else if(status == 1){
            statusStr = "开启";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }
}
