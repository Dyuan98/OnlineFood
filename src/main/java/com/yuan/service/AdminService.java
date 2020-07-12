package com.yuan.service;

import com.yuan.domain.Admin;

public interface AdminService {

    // 判断用户是否存在，用于用户登陆检测
    int judgeAdminExit(Admin admin);
}
