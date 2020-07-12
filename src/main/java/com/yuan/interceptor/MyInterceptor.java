package com.yuan.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 拦截器，拦截未登录的用户
 */
public class MyInterceptor implements HandlerInterceptor {

    /**
     * 拦截器处理
     * return true 为放行
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 登陆页面放行
        if(request.getRequestURI().contains("in")){
            return true;
        }
        Cookie[] cookies = request.getCookies();
        int id = 0;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")){
                id = Integer.valueOf(cookie.getValue());
            }
        }
        //        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
