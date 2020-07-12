package com.yuan.service;


import com.yuan.domain.Food;

import java.util.List;
import java.util.Map;

public interface FoodService {

    // 添加新食品
    int addFood(Food food);

    // 查询符合条件的所有食品
    Map<String,Object> queryFoodByCondition(Food food, int currPage);

    // 根据fid删除指定食品
    int delFoodByFid(int fid);

    // 根据fid查询该食品详细信息
    Food queryFoodById(int fid);

    // 修改食品信息，新传来的食品信息根据id把之前的覆盖
    int modifyFoodById(Food food);

    // 查询首页食品信息
    List<Food> queryFoodForIndex();

    // 无条件条件查个数
    int queryCounts();

}
