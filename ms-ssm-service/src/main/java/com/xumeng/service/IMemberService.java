package com.xumeng.service;

import com.xumeng.domain.Member;

import java.util.List;

public interface IMemberService {
    //查找所有会员
    List<Member> findAllMember() throws Exception;
}
