package com.xumeng.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

@Data
@ToString
@NoArgsConstructor
public class Member implements Serializable {
    private Integer id;
    private String name;
    private String nickname;
    private String phoneNum;
    private String email;
}
