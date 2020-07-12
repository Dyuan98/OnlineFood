package com.yuan.service;

import com.yuan.dao.FoodMapper;
import com.yuan.domain.Food;
import com.yuan.domain.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * foodService实现类
 * 主要实现业务层逻辑
 */
public class FoodServiceImpl implements FoodService{

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private FoodMapper foodMapper;
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    /**
     * 添加新食品
     * 需要新食品对象的参数
     * 返回int值
     * @param food
     * @return
     */
    public int addFood(Food food) {
        return foodMapper.addFood(food);
    }

    /**
     * 条件查询食品列表
     * 根据传来的food对象中的条件，查询对应的food
     * 若查询条件为空，返回所有食品
     * currPage 用于计算此次查询的初始位置
     * 查询总页数：
     *      先从数据库得到符合条件的行数
     *      根据user中的属性food.getPageSize()，和行数进行数学运算得到总页数
     * @param food
     * @param currPage
     * @return
     */
    public Map<String, Object> queryFoodByCondition(Food food, int currPage) {
        // 查询到符合条件的总个数
        int totalCounts = foodMapper.queryCountsByCondition(food);
        // 总页数
        int totalPages = totalCounts%food.getPageSize()==0 ? totalCounts/food.getPageSize() : totalCounts/food.getPageSize()+1;
        // 处理请求页数大于总页数情况
        if (currPage>totalPages){
            currPage = totalPages;
        }
        if(currPage<1){
            currPage = 1;
        }
        // 查询起始点
        int start = (currPage-1)*food.getPageSize();
        food.setStartRows(start);
        // 查询此页数据
        List<Food> foods = foodMapper.queryFoodByCondition(food);
        // 将总页数，总行数，和对象列表放在map中传到controller层
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("totalPages",totalPages);
        map.put("totalCounts",totalCounts);
        map.put("foods",foods);
        return map;
    }

    /**
     * 根据fid删除指定食品
     * @param fid
     * @return
     */
    public int delFoodByFid(int fid) {
        return foodMapper.delFoodByFid(fid);
    }

    /**
     * 根据fid查询该食品具体信息
     * 返回food对象
     * @param fid
     * @return
     */
    public Food queryFoodById(int fid) {
        return foodMapper.queryFoodById(fid);
    }

    /**
     * 修改食品信息
     * 根据fid使用新传来的food对象中的信息
     * 把原有的信息覆盖，达到修改效果
     * @param food
     * @return
     */
    public int modifyFoodById(Food food) {
        return foodMapper.modifyFoodById(food);
    }

    /**
     * 为首页查询前15条用来展示的食品
     * 用于tomcat启动后弹出的首页，index.jsp文件
     * @return
     */
    @Override
    public List<Food> queryFoodForIndex() {
        List<Food> foods = foodMapper.queryFood();
        return foods;
    }

    /**
     * 无条件查询食品个数
     * @return
     */
    @Override
    public int queryCounts() {
        return foodMapper.queryCounts();
    }


}
