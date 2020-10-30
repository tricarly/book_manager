package com.suyi.service.impl;

import com.github.pagehelper.PageHelper;
import com.suyi.domain.Book;
import com.suyi.mapper.BookMapper;
import com.suyi.service.BookService;
import com.suyi.utils.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public Boolean findByBookName(String bookname) {
        Book book = bookMapper.findByBookName(bookname);
        if (book!=null){
            return false;
        }
        return true;
    }

    @Override
    public Boolean insert(Book book, MultipartFile file) throws IOException {
        book.setCreatetime(new Date());
        String picture = new UploadFileUtils().uploadFile(file);
        book.setPicture(picture);
        int i = bookMapper.insert(book);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Book> findAll() {
        return bookMapper.findAll();
    }

    @Override
    public List<Book> findByBookNameAndPrice(int page,int size,String bookname, String min, String max) {
        PageHelper.startPage(page,size);
        return bookMapper.findByBookNameAndPrice(bookname,min,max);
    }

    @Override
    public Book selectByPrimaryKey(Integer bid) {
        return bookMapper.selectByPrimaryKey(bid);
    }

    @Override
    public Boolean updateByPrimaryKeySelective(Book book){
        int i = bookMapper.updateByPrimaryKeySelective(book);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public Boolean deleteByPrimaryKey(Integer bid){
        int i = bookMapper.deleteByPrimaryKey(bid);
        if (i>0){
            return true;
        }
        return false;
    }
}
