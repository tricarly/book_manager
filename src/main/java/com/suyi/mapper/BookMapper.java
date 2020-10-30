package com.suyi.mapper;

import com.suyi.domain.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer bid);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    Book findByBookName(String bookname);

    List<Book> findAll();

    List<Book> findByBookNameAndPrice(@Param("bookname") String bookname,@Param("min") String min,@Param("max") String max);
}