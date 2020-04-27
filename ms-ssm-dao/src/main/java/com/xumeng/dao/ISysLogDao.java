package com.xumeng.dao;

import com.xumeng.domain.SysLog;

import java.util.List;

public interface ISysLogDao {
    void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll() throws Exception;
}
