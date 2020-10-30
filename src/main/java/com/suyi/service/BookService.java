package com.suyi.service;

import com.suyi.domain.Book;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface BookService {
    Boolean findByBookName(String bookname);

    Boolean insert(Book book, MultipartFile picture) throws IOException;

    Book selectByPrimaryKey(Integer bid);

    Boolean updateByPrimaryKeySelective(Book book);

    Boolean deleteByPrimaryKey(Integer bid);

    List<Book> findAll();

    List<Book> findByBookNameAndPrice(int page,int size,String bookname, String min, String max);
}
