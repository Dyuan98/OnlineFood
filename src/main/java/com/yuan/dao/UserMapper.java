package com.yuan.dao;

import com.yuan.domain.User;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface UserMapper {

    // 添加用户
    int addUser(User user);

    // 根据用户id查找用户信息
    User queryUserById(int id);

    // 根据id删除用户信息
    int delById(@Param("id")int id);

    // 查询符合条件的用户总个数
    int queryCountsByCondition(User user);

    // 查询符合条件的用户列表
    List<User> queryUserByCondition(User user);

    // 判断用户是否存在，用于用户登陆检测
    User judgeUserExit(User user);

    // 修改用户信息
    int modifyUserById(User user);

    // 用户修改信息
    int uModifyUser(User user);

    // 充值金额
    int userRecharge(User user);

    // 用户下单，扣除金额
    int userPayMoney(User user);



    // 查询总行数,可被queryCountsByCondition取代，留到后面处理
    int queryCounts();

    // 查看所有用户， 已废弃
//    List<User> queryAllUser();

    // 分页查询所有用户， 以被queryUserByCondition完全取代，已废弃
    List<User> queryUserByPage(@Param("start") int start, @Param("pageSize") int pageSize);
}
