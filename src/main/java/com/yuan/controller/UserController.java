package com.yuan.controller;

import com.yuan.domain.Food;
import com.yuan.domain.Order;
import com.yuan.domain.User;
import com.yuan.service.FoodService;
import com.yuan.service.OrderService;
import com.yuan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 控制器
 */
@Controller
public class UserController {

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
     * 注入OrderServiceImpl对象
     */
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    /**
     * 管理员删除用户控制
     * @param id
     * @param pageSize
     * @param currPage
     * @param model
     * @return
     */
    @RequestMapping("/del/{id}/{pageSize}/{currPage}")
    public String delete(@PathVariable("id") int id ,@PathVariable("pageSize")int pageSize,
                         @PathVariable("currPage") int currPage,Model model){

        userService.delById(id);
        model.addAttribute("currPage",1);
        model.addAttribute("pageSize",pageSize);
        User user = new User();
        return list(user,model,currPage,pageSize);
    }

    /**
     * 分页展示用户列表界面
     * @param model
     * @param currPage
     * @param pageSize
     * @return
     */
    @RequestMapping("/user/{currPage}/{pageSize}")
    public String list( User user,Model model, @PathVariable("currPage") int currPage,
                       @PathVariable("pageSize") int pageSize){
        // 排除异常情况
        if( currPage<=0){
            currPage = 1;
        }
        if (pageSize<=0){
            pageSize = 5;
        }
        user.setPageSize(pageSize);
        Map<String,Object> map = userService.queryUserByCondition(user,currPage);
        model.addAttribute("users",(List<User>) map.get("users"));
        model.addAttribute("totalPages",Integer.parseInt(map.get("totalPages").toString()));
        model.addAttribute("currPage",currPage);
        User userCache = user;
        model.addAttribute("userCache",userCache);

        return "allUser";
    }

    /**
     * 去注册页面
     * @param user
     * @return
     */
    @RequestMapping("login")
    public String login(User user){
        return "login";
    }

    /**
     * 用户注册完成后
     * 返回到登陆界面
     * @param user
     * @return
     */
    @RequestMapping("/toSignIn")
    public String toLogin(User user){
        userService.addUser(user);
        return "signIn";
    }

    /**
     * 登录界面
     * @return
     */
    @RequestMapping("/signIn")
    public String singIn(){
        return "signIn";
    }

    /**
     * 去修改用户信息页面，
     * 需要的参数为原user对象
     * 用于显示在修改页面上，作为提示信息
     * @param model
     * @return
     */
    @PostMapping("/toModifyUser")
    public String toModifyUser(User user,Model model){
        User newUser = userService.queryUserById(user.getId());
        model.addAttribute("user",newUser);
        return "/modifyUser";
    }

    /**
     * 管理员将修改后的user信息传递给数据库
     * aModifyUser，代表此次操作为管理员执行，
     * 在所有用户信息页面执行的
     * 将返回到所有用户信息页面
     * @param user
     * @return
     */
    @PostMapping("/aModifyUser")
    public  String aModifyUser(User user ,Model model){
        userService.modifyUser(user);

        model.addAttribute("currPage",1);
        model.addAttribute("pageSize",5);
        User user1 = new User();
        return list(user1,model,1,5);
    }

    /**
     * 用户将修改后的user信息传递给数据库
     * uModifyUser，代表此次为用户执行的
     * 在用户个人信息页面执行
     * 将返回到个人信息页面
     * 且用户不能修改余额
     * @param user
     * @return
     */
    @PostMapping("/uModifyUser")
    public  String uModifyUser(User user, Model model){
        userService.uModifyUser(user);
        User newUser = userService.queryUserById(user.getId());
        model.addAttribute("user",newUser);
        return "userInfo";
    }

    /**
     * 根据user的id查询个人信息展示在个人信息详情页上
     * @param model
     * @return
     */
    @RequestMapping("/userInfo")
    public String userInfo( Model model, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        int id = 0;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.valueOf(cookie.getValue());
            }
        }
        User user = userService.queryUserById(id);
        model.addAttribute("user",user);
        return "userInfo";
    }

    /**
     * 用户点击主页某个食品时，前往该食品详情页
     *
     * @param fid
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/detailsPage/{fid}/{id}")
    public String toDetailsPage(@PathVariable("fid") int fid,@PathVariable("id") int id,Model model){
        // 根据fid查询此食品所有信息
        if (id==-1){
            model.addAttribute("tourist", true);
            return "signIn";
        }
        Food food = foodService.queryFoodById(fid);
        User user = userService.queryUserById(id);
        model.addAttribute("user",user);
        model.addAttribute("food",food);
        return "detailsPage";
    }

    /**
     * 用户点击注销后回到主页，清除User信息
     * @return
     */
    @RequestMapping("logOff")
    public String logOff(HttpSession session, HttpServletResponse response
    ){

        // 向客户端的cookie放入用户数据
        //设置cookie的userId为0，注销用户
        Cookie cookie = new Cookie("userId",String.valueOf(0));
        // 设置过期时间
        cookie.setMaxAge(60*60*3);  // 以秒为单位，这里设为3小时
        // 设置cookie存放目录
        cookie.setPath("/");
        response.addCookie(cookie);
//        return "redirect:/";
        return "signIn";
    }

    /**
     * 前往充值界面，
     * 带有id属性，
     * @param model
     * @return
     */
    @RequestMapping("/toRecharge")
    public String recharge(Model model, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        int id = 0;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.parseInt(cookie.getValue());
            }
        }
        model.addAttribute("id",id);
        return "recharge";
    }

    /**
     * 获取用户充值信息，并传入数据库
     * 充值成功后，携带用户信息返回main页面
     * @param user
     * @return
     */
    @PostMapping("/recharge")
    public String afterRecharge(User user){
        userService.userRecharge(user);
        return "redirect:/main/1";
    }

    /**
     * 将商品添加购物车
     * @param order
     * @return
     */
    @RequestMapping("addOrder")
    public String addCar(Order order){
        //将数据进行格式化，按照一定的格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setoTime(sdf.format(new Date()));
        order.setoStatus(0);
        orderService.addOrder(order);
        return "redirect:/orderCart/0";
    }

    /**
     * 查询用户的购物车或订单信息
     * 复用代码，按status区分是查看购物车和历史订单
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/orderCart/{status}")
    public String orderCart(Model model, HttpServletRequest request ,@PathVariable("status") int status ){
        int id = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.parseInt(cookie.getValue());
            }
        }
        User user = userService.queryUserById(id);
        List<Order> orders = orderService.queryOrderByUid(id,status);
        model.addAttribute("user",user);
        model.addAttribute("orders",orders);

        if(status == 0){
            model.addAttribute("pageName","orderCart");
            return "orderCart";
        }
        if(status == 2){
            return "historyOrder";
        }
        model.addAttribute("pageName","order");
        return "order";
    }

    /**
     * 根据oid移除购物车的对应记录
     * @param oid
     * @return
     */
    @RequestMapping("delOrder/{oid}")
    public String delOrder(@PathVariable("oid") int oid ){
        orderService.delOrder(oid);
        return "redirect:/orderCart/0";
    }


    /**
     * 付款，即设置status为1,减用户余额
     * @param oid
     * @param request
     * @param user
     * @param order
     * @param food
     * @return
     */
    @PostMapping("pay")
    public String pay(int oid, HttpServletRequest request,User user,Order order,Food food,Model model){
        int id = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.parseInt(cookie.getValue());
            }
        }
        double price = food.getPrice();
        User user1 = userService.queryUserById(id);
        Double money = user1.getMoney();
        if(money < price){
            model.addAttribute("id",id);
            return "recharge";
        }
        user.setMoney(price);
        user.setId(id);
        userService.userPayMoney(user);
        //将日期进行格式化，按照一定的格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setoTime(sdf.format(new Date()));
        order.setOid(oid);
        order.setoStatus(1);
        orderService.pay(order);
        return "redirect:/orderCart/1";
    }

    /**
     * 确认收货，更改status为2
     * @param order
     * @return
     */
    @PostMapping("/confirm")
    public String confirmReceipt(Order order){
        //将数据进行格式化，按照一定的格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setoTime(sdf.format(new Date()));
        order.setoStatus(2);
        orderService.pay(order);   // 当时实现付款时，定义方法名为pay，这里流程一样，就复用一下
        return "redirect:/orderCart/1";
    }

    /**
     * 视频界面
     * @return
     */
    @RequestMapping("/video")
    public String video(Model model){
        model.addAttribute("pageName","video");
        return "video";
    }








//    /**
//     * 用户点击个人信息时，
//     * 接收用户user信息
//     * 跳转到个人信息详情页
//     * @param user
//     * @param model
//     * @return
//     */
//    @RequestMapping("/userInfo")
//    public String userInfo(User user,Model model ){
//        model.addAttribute(user);
//        return "userInfo";
//    }


    //    /**
//     * 用户提交登录信息后
//     * 以post方式接受信息
//     * 判断信息与数据库中是否一致
//     * 若一致返回到index界面
//     * 若不一致，返回signIn页面和报错信息，继续登录
//     * @return
//     */
//    @PostMapping("/index")
//    public String toIndex(User user, Model model){
////        查询数据库中是否有对应用户信息
//        int num = userService.judgeUserExit(user);
//        if (num!=1){
//            model.addAttribute("exit", true);
//            return "signIn";
//        }
//        model.addAttribute("user",user);
//
//        return "main";
//    }
//
//
//    /**
//     * 当用户点击index页面具体商品时，
//     * 会前往商品详情页面
//     *
//     * @return
//     */
//    @RequestMapping("/detail")
//    public String showDetails(){
//        return "detailsPage";
//    }

    // 废弃代码，以后处理
//    @PostMapping("/likeQuery")袁
//    public String queryByCondition(User user, int pageSize, int currPage,Model model){
//        System.out.println("pageSize====="+pageSize);
//        System.out.println("currPage====="+currPage);
//        // 排除异常情况
//        if( currPage<=0){
//            currPage = 1;
//        }
//        if (pageSize<=0){
//            pageSize = 5;
//        }
//        user.setPageSize(pageSize);
//        Map<String,Object> map = userService.queryCountsByCondition(user,currPage);
//
//
//        model.addAttribute("users",(List<User>) map.get("users"));
//        model.addAttribute("totalPages",Integer.parseInt(map.get("totalPages").toString()));
//        model.addAttribute("currPage",currPage);
//        model.addAttribute("pageSize",pageSize);
//        return "queryUser";
//    }
}
