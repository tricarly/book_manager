package com.suyi.interceptor;

import com.suyi.controller.UIController;
import com.suyi.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PrivilegeInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object username = session.getAttribute("username");
        if(username==null){
            new UIController().errorUI();
//            response.sendRedirect(request.getContextPath()+"/WEB-INF/error.jsp");
            return false;
        }
        return true;
    }
}
