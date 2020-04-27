package com.xumeng.service.impl;

import com.xumeng.dao.IMemberDao;
import com.xumeng.domain.Member;
import com.xumeng.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements IMemberService {
    @Autowired
    private IMemberDao memberDao;
    // 查找所有会员
    @Override
    public List<Member> findAllMember() throws Exception {
        return memberDao.findAllMember();
    }
}
