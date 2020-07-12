package com.yuan.service;


import com.yuan.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    // 查询所有用户
    List<User> queryAllUser();

    // 分页查询
//     Map<String,Object> queryUserByPage(int currPage, int pageSize);

    // 添加用户
     int addUser(User user);

     // 根据id查询具体用户信息
    User queryUserById(int id);

     // 查询总行数
    int queryCounts();

    // 根据id删除用户
    int delById(int id);

    // 查询符合条件的所有用户
    Map<String,Object> queryUserByCondition(User user, int currPage);

    // 判断用户是否存在，用于用户登陆检测，若存在，返回值为User对象
    User judgeUserExit(User user);

    // 修改用户信息
    int modifyUser(User user);

    // 用户修改信息
    int uModifyUser(User user);

    // 用户充值
    int userRecharge(User user);

    // 用户下单，扣除金额
    int userPayMoney(User user);

}
