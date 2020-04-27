package com.xumeng.dao;

import com.xumeng.domain.Member;

import java.util.List;

public interface IMemberDao {
    //根据id查找会员
    Member findById(Integer id) throws Exception;

    //查找所有会员
    List<Member> findAllMember() throws Exception;
}
