package com.suyi.controller;

import com.github.pagehelper.PageInfo;
import com.suyi.domain.Book;
import com.suyi.service.impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookServiceImpl bookService;

    @RequestMapping("/checkBookName")
    @ResponseBody
    public Map<String,Object> checkBookName(String bookname){
        Boolean byBookName = bookService.findByBookName(bookname);
        Map<String,Object> map=new HashMap<>();
        map.put("obj",byBookName);
        return map;
    }

    @RequestMapping("/add")
    public String add(Book book,MultipartFile file) throws IOException {
        Boolean insert = bookService.insert(book,file);
        if (insert){
            return "redirect:/UI/book_managerUI";
        }
        return "redirect:/UI/book_addUI";
    }

    @RequestMapping("/list")
    public ModelAndView list(){
        List<Book> bookList = bookService.findAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("book",bookList);
        modelAndView.setViewName("pages/manager/book_manager");
        return modelAndView;
    }

    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "4") int size,String bookname,String min,String max){
        List<Book> bookList = bookService.findByBookNameAndPrice(page, size,bookname,min,max);
        PageInfo<Book> pageInfo = new PageInfo<>(bookList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("bookname",bookname);
        modelAndView.addObject("min",min);
        modelAndView.addObject("max",max);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/update")
    public String update(Book book){
        bookService.updateByPrimaryKeySelective(book);
        return "redirect:/UI/book_managerUI";
    }

    @RequestMapping("/delete")
    public String delete(Integer bid){
        bookService.deleteByPrimaryKey(bid);
        return "redirect:/UI/book_managerUI";
    }
}
