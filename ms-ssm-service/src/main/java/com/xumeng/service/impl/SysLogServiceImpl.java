package com.xumeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.xumeng.dao.ISysLogDao;
import com.xumeng.domain.SysLog;
import com.xumeng.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return sysLogDao.findAll();
    }
}
