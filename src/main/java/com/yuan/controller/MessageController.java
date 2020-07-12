package com.yuan.controller;

import com.yuan.domain.Food;
import com.yuan.domain.Message;
import com.yuan.domain.User;
import com.yuan.service.MessageService;
import com.yuan.service.MessageServiceImpl;
import com.yuan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class MessageController {

    @Autowired
    @Qualifier("MessageServiceImpl")
    private MessageService messageService;

    /**
     * 注入UserServiceImpl对象
     */
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;


    /**
     * 去留言
     * @param food
     * @param model
     * @return
     */
    @PostMapping("/evaluate")
    public String toEvaluate(Food food, Model model){
        model.addAttribute("food", food);  // 将食品的id传过去
        return "addMessage";
    }

    /**
     * 添加新留言
     * @param message
     * @return
     */
    @RequestMapping("/addMessage")
    public String addMessage(Message message,Food food, HttpServletRequest request){
        int id = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.parseInt(cookie.getValue());
            }
        }
        message.setFid(food.getFid());
        message.setUid(id);
        System.out.println(message);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        message.setmTime(sdf.format(new Date()));
        messageService.addMessage(message);
        return "redirect:/main/1";
    }

    /**
     * 查找所有留言信息
     * 前往留言界面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/messages")
    public String messages(HttpServletRequest request,Model model){
        int id = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.parseInt(cookie.getValue());
            }
        }
        User user = userService.queryUserById(id);

        List<Message> messages = messageService.queryMessages();
        model.addAttribute("user",user);
        model.addAttribute("messages",messages);
        model.addAttribute("pageName","messages");
//        System.out.println(messages);
        return "message";
    }
}
