package com.yuan.controller;

import com.yuan.domain.Food;
import com.yuan.domain.User;
import com.yuan.service.FoodService;
import com.yuan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
public class FoodController {

    /**
     * 注入UserServiceImpl对象
     */
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     * 注入FoodServiceImpl对象
     */
    @Autowired
    @Qualifier("FoodServiceImpl")
    private FoodService foodService;

    /**
     * 前往添加食品界面
     * @return
     */
    @RequestMapping("/addFood")
    public String addFoodPage(){
        return "addFood";
    }

    /**
     * 添加新食品
     * 接受页面传来的food对象信息
     * 调用service层将food存入数据库
     * 返回界面待定
     * @param food
     * @return
     */
    @PostMapping("/toAddFood")
    public String addFood(Food food){
        foodService.addFood(food);
        return "addFood";
    }

    /**
     * 分页展示食品列表界面
     * @param model
     * @param currPage
     * @param pageSize
     * @return
     */
    @RequestMapping("/food/{currPage}/{pageSize}")
    public String list(Food food, Model model, @PathVariable("currPage") int currPage,
                       @PathVariable("pageSize") int pageSize){
        // 排除异常情况
        if( currPage<=0){
            currPage = 1;
        }
        if (pageSize<=0){
            pageSize = 5;
        }
        food.setPageSize(pageSize);
        Map<String,Object> map = foodService.queryFoodByCondition(food,currPage);

        model.addAttribute("foods",(List<Food>) map.get("foods"));
        model.addAttribute("totalPages",Integer.parseInt(map.get("totalPages").toString()));
        model.addAttribute("currPage",currPage);
        Food foodCache = food;
        model.addAttribute("foodCache",foodCache);
        return "allFood";
    }

    /**
     * 根据allFood页面传来的fid删除指定食品
     * 也获取再allFood页面的当前页和页大小
     * 用于删除后还展示之前的页面
     * @param fid
     * @param pageSize
     * @param currPage
     * @param model
     * @return
     */
    @RequestMapping("/delFood/{fid}/{pageSize}/{currPage}")
    public String delete(@PathVariable("fid") int fid ,@PathVariable("pageSize")int pageSize,
                         @PathVariable("currPage") int currPage,Model model){

        foodService.delFoodByFid(fid);
        model.addAttribute("currPage",currPage);
        model.addAttribute("pageSize",pageSize);
        Food food = new Food();
        return list(food,model,currPage,pageSize);
    }

    /**
     * 根据allFood页面传来的fid，去查询此fid对应的原有食品信息
     * 返回进入修改食品信息页面，把原有的食品信息显示在对应的输入框中，
     * 获取在allFood页面当前的页面和页面大小，便于修改之后返回原来位置
     * @param fid
     * @param pageSize
     * @param currPage
     * @param model
     * @return
     */
    @RequestMapping("/toModifyFood/{fid}/{pageSize}/{currPage}")
    public String toModifyFood(@PathVariable("fid") int fid ,@PathVariable("pageSize")int pageSize,
                         @PathVariable("currPage") int currPage,Model model){
        Food food = foodService.queryFoodById(fid);
        model.addAttribute("food",food);
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("currPage",currPage);
        return "modifyFood";
    }

    /**
     * 修改食品信息
     * 使用用户新输入的food信息把原有的覆盖掉
     * 返回allFood页面
     * @param pageSize
     * @param currPage
     * @param food
     * @param model
     * @return
     */
    @PostMapping("/modifyFood/{pageSize}/{currPage}")
    public String ModifyFood(@PathVariable("pageSize")int pageSize,@PathVariable("currPage")int currPage,
                             Food food,Model model){
        foodService.modifyFoodById(food);

        model.addAttribute("pageSize",pageSize);
        model.addAttribute("currPage",currPage);
        Food food1 = new Food();
        return list(food1,model,currPage,pageSize);
    }


    /**
     * 用户登录后，或者未登录且在index页面点击跳转页面时，调用
     * @param user  用于记录用户信息，通过用户登陆时的昵称和密码条件查询到user的完整信息，
     *              存到main页面上，用于展示用户的个人信息页面
     * @param food  条件分页查询，用于展示main页面的视频
     * @param model  携带数据传送给前端页面
     * @param currPage  用于分页查询食品，跳转页面时使用，初始为1
     * @return
     */
    @RequestMapping("/main/{currPage}")
    public String index(HttpServletResponse response, HttpSession session,
            User user, Food food, Model model, @PathVariable("currPage") int currPage,
                        HttpServletRequest request ){
        // 1、获取cookies,判断cookie是不是为空，不为空则遍历，获取cookie中的userId
        // 2、判断id是否为0，若为0，则说明用户未登录，或cookie已销毁，或正在登录
        //      根据用户登录提交的信息，判断此用户是否存在，若存在则根据提交信息查询出用户完整信息
        //      将完整信息存入model和session。创建新的cookie，将用户id存入cookie中，用于判断用户是否登录
        //      若id不为0，则说明用户为已登录状态，查询user所有信息，存入model，再查询食品信息，返回主页面
        int id = 0;
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")){
                    id = Integer.parseInt(cookie.getValue());
                }
            }
        }else{
            model.addAttribute("tourist", true);
            return "signIn";
        }
        if (id == 0){
            //关于用户登录验证
            //        查询数据库中是否有对应用户信息
            User newUser = userService.judgeUserExit(user);
            if (newUser==null){
                model.addAttribute("noExit", true);
                return "signIn";
            }
            model.addAttribute("user",newUser);

            session.setAttribute("user",newUser);
            // 向客户端的cookie放入用户数据
            //设置cookie
            Cookie cookie = new Cookie("userId",String.valueOf(newUser.getId()));
            // 设置过期时间
            cookie.setMaxAge(60*60*3);  // 以秒为单位，这里设为3小时
            // 设置cookie存放目录
            cookie.setPath("/");
            response.addCookie(cookie);
        }else{
            User userInfo = userService.queryUserById(id);
            model.addAttribute("user",userInfo);
        }

        // 关于食品获取
        // 排除异常情况
        if( currPage<=0){
            currPage = 1;
        }
        food.setPageSize(15);

        Map<String,Object>map = foodService.queryFoodByCondition(food,currPage);

        List<Food> foods = (List<Food>) map.get("foods");

        List<Food> foods1 = new ArrayList<Food>();
        List<Food> foods2 = new ArrayList<Food>();
        List<Food> foods3 = new ArrayList<Food>();
        int numFood = 0;
        for (Food f : foods) {
            if(numFood<=4){
                foods1.add(f);
            }else if(numFood<=9){
                foods2.add(f);
            }else{
                foods3.add(f);
            }
            numFood++;
        }
        model.addAttribute("foods1",foods1);
        model.addAttribute("foods2",foods2);
        model.addAttribute("foods3",foods3);
        model.addAttribute("totalPages",Integer.parseInt(map.get("totalPages").toString()));
        model.addAttribute("currPage",currPage);
        Food foodCache = food;
        model.addAttribute("foodCache",foodCache);
        return "main";
    }

    /**
     * 首页用户查询食品
     * @param response
     * @param session
     * @param user
     * @param food
     * @param model
     * @param currPage
     * @param request
     * @return
     */
    @RequestMapping("/query/{currPage}")
    public String userQueryFood(HttpServletResponse response, HttpSession session,
                        User user, Food food, Model model, @PathVariable("currPage") int currPage,
                        HttpServletRequest request
    ){
        currPage = 1;
        return index(response,session,user,food,model,currPage,request);
    }

}


