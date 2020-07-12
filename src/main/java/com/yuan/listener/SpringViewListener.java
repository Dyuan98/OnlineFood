package com.yuan.listener;


import com.yuan.domain.Food;
import com.yuan.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

/**
 * 实现预加载数据库
 * 在首页框弹出前，获取首页展示食品的信息
 * 具体待研究
 */
@Controller
@RequestMapping("/")
public class SpringViewListener  implements ServletContextAware {

    /**
     * 注入FoodServiceImpl对象
     */
    @Autowired
    @Qualifier("FoodServiceImpl")
    private FoodService foodService;

    @Override
    public void setServletContext(ServletContext servletContext) {
//        System.out.println("开始");
        try {
            // 查询食品列表
            List<Food> foods = foodService.queryFoodForIndex();

            // 查询食品总个数
            int totalCounts = foodService.queryCounts();
            int totalPages = (totalCounts%15==0)?totalCounts/15 : totalCounts/15+1;

            List<Food> foods1 = new ArrayList<Food>();
            List<Food> foods2 = new ArrayList<Food>();
            List<Food> foods3 = new ArrayList<Food>();
            int numFood = 0;
            for (Food f : foods) {
                if(numFood<=4){
                    foods1.add(f);
                }else if(numFood<=9){
                    foods2.add(f);
                }else if(numFood<=14){
                    foods3.add(f);
                }else{
                    break;
                }
                numFood++;
            }

            servletContext.setAttribute("foods1",foods1);
            servletContext.setAttribute("foods2",foods2);
            servletContext.setAttribute("foods3",foods3);
            servletContext.setAttribute("totalPages",totalPages);
            servletContext.setAttribute("currPage",1);
        }catch (Exception e) {
            System.out.println("错误");
        }
    }
}