package com.wcm533.service;

import com.wcm533.pojo.*;

import java.util.List;

/**
 * @ClassName BookListService
 * @Descripyion TODO
 * @Author 吴超民
 * @Date 2021/04/20 14:05
 **/
public interface BookListService {

    String createBookList(int userId,String[] bookIdArr,String[] bookCountArr);

    boolean deleteBookList(String bookListId);

    boolean readyBookList(String bookListId);

    boolean sendBookList(String bookListId);

    boolean borrowBookList(String bookListId);

    boolean returnBookList(String bookListId);

    boolean cancelBookList(String bookListId);

    boolean aboutOfTimeOutBookList(String bookListId);

    boolean overTimeBookList(String bookListId);

    List<ItemsDetails> queryBookListItems(String bookListId);

    Page<BookList> queryBookLists(int pageNo,int pageSize);

    List<BookList> queryBookListsByUserId(int userId,int begin,int pageSize);

    Page<BookList> queryBookListsByInfo(int pageNo, int pageSize, String info);

    Page<BookList> queryBookListsByStatus(int pageNo, int pageSize, String status);

    BookList queryBookListsByBookListId(String bookListId);

    List<BookList> queryAllBookLists();
}
