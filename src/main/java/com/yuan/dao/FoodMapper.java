package com.yuan.dao;

import com.yuan.domain.Food;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface FoodMapper {

    // 添加新食品
    int addFood(Food food);

    // 查询符合条件的食品总个数
    int queryCountsByCondition(Food food);

    // 查询符合条件的食品列表
    List<Food> queryFoodByCondition(Food food);

    // 根据fid删除指定商品
    int delFoodByFid( @Param("fid") int fid);

    // 根据fid查询指定食品信息
    Food queryFoodById(@Param("fid") int fid);

    // 修改食品信息，新传来的食品信息根据id把之前的覆盖
    int modifyFoodById(Food food);

    // 无条件查询食品
    List<Food> queryFood();

    // 无条件查询食品个数
    int queryCounts();

}
