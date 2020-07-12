package com.yuan.service;

import com.yuan.dao.AdminMapper;
import com.yuan.domain.Admin;

public class AdminServiceImpl implements AdminService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public int judgeAdminExit(Admin admin) {
        return adminMapper.judgeAdminExit(admin);
    }
}
