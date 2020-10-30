package com.suyi.controller;

import com.suyi.domain.Book;
import com.suyi.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/UI")
public class UIController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/indexUI")
    public String indexUI(){
        return "redirect:/book/index";
    }

    @RequestMapping("/registUI")
    public String registUI(){
        return "pages/user/regist";
    }

    @RequestMapping("/regist_successUI")
    public String regist_successUI(){
        return "pages/user/regist_success";
    }

    @RequestMapping("/loginUI")
    public String loginUI(){
        return "pages/user/login";
    }

    @RequestMapping("/login_successUI")
    public String login_successUI(){
        return "pages/user/login_success";
    }

    @RequestMapping("/managerUI")
    public String managerUI(){
        return "pages/manager/manager";
    }

    @RequestMapping("/book_managerUI")
    public String book_managerUI(){
        return "redirect:/book/list";
    }

    @RequestMapping("/book_addUI")
    public String book_addUI(){
        return "pages/manager/book_add";
    }

    @RequestMapping("/book_updateUI")
    public String book_updateUI(Integer bid, ModelMap modelMap){
        Book book = bookService.selectByPrimaryKey(bid);
        modelMap.addAttribute("book",book);
        return "pages/manager/book_update";
    }

    @RequestMapping("/errorUI")
    public String errorUI(){
        return "error";
    }
}
