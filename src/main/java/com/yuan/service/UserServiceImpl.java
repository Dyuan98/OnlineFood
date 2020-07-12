package com.yuan.service;

import com.yuan.dao.UserMapper;
import com.yuan.domain.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class UserServiceImpl implements UserService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private UserMapper userMapper;
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    // 待改进
    public List<User> queryAllUser() {
        return null;
    }

    // 分页查询所有user
//    public Map<String,Object> queryUserByPage(int currPage, int pageSize) {
//
//        //查询总行数
//        int totalCounts = userMapper.queryCounts();
//        // 总页数
//        int totalPages = totalCounts%pageSize==0 ? totalCounts/pageSize : totalCounts/pageSize+1;
//
//        // 处理请求页数大于总页数情况
//        if (currPage>totalPages){
//            currPage=totalPages;
//        }
//
//        // 查询起始点
//        int start = (currPage-1)*pageSize;
//
//        // 查询此页数据
//        List<User> users = userMapper.queryUserByPage(start,pageSize);
//        // 将总页数，总行数，和对象列表放在map中传到controller层
//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("totalPages",totalPages);
//        map.put("totalCounts",totalCounts);
//        map.put("users",users);
//        return map;
//    }

    // 添加User
    public  int addUser(User user){
        return userMapper.addUser(user);
    }


    /**
     * 根据id查找用户个人信息
     * 返回用户详细信息
     * @param id
     * @return
     */
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    // 查询总行数，待改进
    public int queryCounts() {
        return userMapper.queryCounts();
    }

    // 根据id删除用户
    public int delById(int id) {
        return userMapper.delById(id);
    }

    /**
     * 查询用户列表
     * 若传来的user为空时，查询所有
     * 若传来的user有值，则按照user中有值的属性为条件查询出对应的用户列表
     * currPage 用于计算此次查询的初始位置
     * 查询总页数：
     *      先从数据库得到符合条件的行数
     *      根据user中的属性user.getPageSize()，和行数进行数学运算得到总页数
     * @param user
     * @param currPage
     * @return
     */
    public Map<String,Object> queryUserByCondition(User user, int currPage) {
        // 查询到符合条件的总个数
        int totalCounts = userMapper.queryCountsByCondition(user);
        // 总页数
        int totalPages = totalCounts%user.getPageSize()==0 ? totalCounts/user.getPageSize() : totalCounts/user.getPageSize()+1;
        // 处理请求页数大于总页数情况
        if (currPage>totalPages){
            currPage = totalPages;
        }
        if(currPage<1){
            currPage = 1;
        }
        // 查询起始点
        int start = (currPage-1)*user.getPageSize();
        user.setStartRows(start);
        // 查询此页数据
        List<User> users = userMapper.queryUserByCondition(user);
        // 将总页数，总行数，和对象列表放在map中传到controller层
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("totalPages",totalPages);
        map.put("totalCounts",totalCounts);
        map.put("users",users);
        return map;
    }

    /**
     * 判断用户是否存在，
     * 若存在，返回为1
     * @param user
     * @return
     */
    public User judgeUserExit(User user) {
        User UserInfo = userMapper.judgeUserExit(user);
        return UserInfo;
    }

    /**
     * 修改用户信息
     * 根据传来的新user的信息把之前的user信息覆盖
     * @param user
     * @return
     */
    public int modifyUser(User user) {
        return  userMapper.modifyUserById(user);
    }

    /**
     * 用户自己可以修改的信息，移除修改金额
     * @param user
     * @return
     */
    @Override
    public int uModifyUser(User user) {
        return userMapper.uModifyUser(user);
    }

    /**
     * 用户充值
     * user对象只应该含有id 和 充值money 其他属性应为空
     * @param user
     * @return
     */
    @Override
    public int userRecharge(User user) {
        return userMapper.userRecharge(user);
    }

    @Override
    public int userPayMoney(User user) {
        return userMapper.userPayMoney(user);
    }


}
