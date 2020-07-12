package com.yuan.controller;

import com.yuan.domain.Admin;
import com.yuan.domain.Order;
import com.yuan.service.AdminService;
import com.yuan.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    /**
     * 登录界面
     *
     * @return
     */
    @RequestMapping("/adminSignIn")
    public String singIn() {
        return "adminSignIn";
    }

    /**
     * 登录到主界面
     * @param admin     携带管理员登录时提交的用户名和密码，用于判断是否为真实账户
     * @param model     用于向前端传参
     * @param response  响应浏览器，携带配置好的cookie传到前端
     * @param session   好像没有用这里
     * @param request   判断请求中的cookie是否含有管理员身份信息，若有允许通过，若没有返回登陆界面
     * @return
     */
    @RequestMapping("/admin")
    public String toAdmin(Admin admin, Model model, HttpServletResponse response, HttpSession session,
                          HttpServletRequest request) {


        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("adminName")){
                    if (cookie.getValue().equals("admin")){
                        return "admin";
                    }
                }
            }
        }

            //关于用户登录验证
            //        查询数据库中是否有对应用户信息
            int num = adminService.judgeAdminExit(admin);
            if (num != 1) {
                model.addAttribute("exit", true);
                return "adminSignIn";
            }

            session.setAttribute("admin",admin);
        // 向客户端的cookie放入用户数据
        //设置cookie
        Cookie cookie = new Cookie("adminName", admin.getaName());
        // 设置过期时间
        cookie.setMaxAge(60*60*3);  // 以秒为单位，这里设为3小时
        // 设置cookie存放目录
        cookie.setPath("/");
        response.addCookie(cookie);

        model.addAttribute(admin);
        return "admin";
    }

    @RequestMapping("/allOrder")
    public String manageOrder(Model model){
        List<Order> orders = orderService.queryAllOrder();
        model.addAttribute("orders",orders);
        return "allOrder";
    }
}
