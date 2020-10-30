package com.suyi.controller;

import com.suyi.domain.User;
import com.suyi.service.impl.UserServiceImpl;
import com.suyi.utils.VerifyCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/checkUserName")
    @ResponseBody
    public Map<String, Object> checkUserName(String username){
        Boolean byUserName = userService.findByUserName(username);
        Map<String, Object> map = new HashMap<>();
        map.put("obj",byUserName);
        return map;
    }

    @RequestMapping("/checkEmail")
    @ResponseBody
    public Map<String, Object> checkEmail(String email){
        Boolean byEmail = userService.findByEmail(email);
        Map<String, Object> map = new HashMap<>();
        map.put("obj",byEmail);
        return map;
    }

    @RequestMapping("/authImage")
    public void authImage(HttpServletResponse resp, HttpSession session) throws IOException {
        resp.setHeader("Pragma", "No-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires",0);
        resp.setContentType("image/jpeg");
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        session.removeAttribute("verifyCode");
        session.setAttribute("verifyCode", verifyCode);
        int w=100;
        int h=30;
        VerifyCodeUtils.outputImage(w, h, resp.getOutputStream(), verifyCode);
    }

    @RequestMapping("/checkCode")
    @ResponseBody
    public Map<String,Object> checkCode(HttpSession session,String code){
        Boolean b = null;
        Map<String, Object> map = new HashMap<>();
        String verifyCode = (String) session.getAttribute("verifyCode");
        if (code.equalsIgnoreCase(verifyCode)){
            b=true;
        }else {
            b=false;
        }
        map.put("obj",b);
        return map;
    }

    @PostMapping("/regist")
    public String regist(User user){
        Boolean insert = userService.insert(user);
        if (insert){
            return "redirect:/UI/regist_successUI";
        }else {
            return "redirect:/UI/registUI";
        }
    }

    @RequestMapping("/login")
    public String login(String username, String password,String flag, HttpSession session ,HttpServletResponse resp){
        Boolean b = userService.findByUserNameAndPassword(username, password);
        if (b){
            if (flag!=null && flag.equals("123")) {
                /**
                 * 登录成功，将当前登录的账号和密码信息保存到cookie中
                 */
                Cookie usernameCookie=new Cookie("usernameCookie", username);//账号cookie
                Cookie passwordCookie=new Cookie("passwordCookie", password);//密码cookie
                //设置有效时间：10分钟
                usernameCookie.setMaxAge(60*10);
                passwordCookie.setMaxAge(60*10);
                //将cookie保存到客户端浏览器中
                resp.addCookie(usernameCookie);
                resp.addCookie(passwordCookie);
            }
            session.setAttribute("username",username);
            return "redirect:/UI/login_successUI";
        }
        else {
            return "redirect:/UI/loginUI";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session ,HttpServletResponse resp){
        session.removeAttribute("username");
        Cookie usernameCookie=new Cookie("usernameCookie", null);//账号cookie
        Cookie passwordCookie=new Cookie("passwordCookie", null);//密码cookie
        resp.addCookie(usernameCookie);
        resp.addCookie(passwordCookie);
        return "redirect:/UI/indexUI";
    }
}
