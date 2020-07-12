package com.yuan.dao;

import com.yuan.domain.Admin;

public interface AdminMapper {

    // 判断用户是否存在，用于用户登陆检测
    int judgeAdminExit(Admin admin);
}
