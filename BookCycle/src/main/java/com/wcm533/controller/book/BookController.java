package com.wcm533.controller.book;

import com.wcm533.pojo.Book;
import com.wcm533.pojo.BookDetails;
import com.wcm533.pojo.Page;
import com.wcm533.service.impl.BookDetailsServiceImpl;
import com.wcm533.service.impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName BookController
 * @Descripyion TODO
 * @Author 吴超民
 * @Date 2021/04/28 19:43
 **/

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("bookServiceImpl")
    private BookServiceImpl bookService;

    @Autowired
    @Qualifier("bookDetailsServiceImpl")
    private BookDetailsServiceImpl bookDetailsService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/bookDetails/{bookId}")
    public String bookDetails(@PathVariable int bookId,Model model){
        Book book = bookService.queryBookById(bookId);
        BookDetails bookDetails = bookDetailsService.queryBookDetailsByBookId(bookId);
        model.addAttribute("book",book);
        model.addAttribute("bookDetails",bookDetails);
        return "book/book_details";
    }

    @GetMapping("/search/{info}")
    public String search(@PathVariable String info,int pageNo, Model model){
        Page<Book> pageBook = bookService.queryBooksByInfo(pageNo, Page.PAGE_INDEX_SIZE, info);
        model.addAttribute("info",info);
        model.addAttribute("pageBook",pageBook);
        return "client/index";
    }

    @RequestMapping(value = "/bookPoints",produces = "application/json; charset=utf-8")
    @ResponseBody
    public int[] bookPoints(String bookName){
        Book book = bookService.queryBookByName(bookName);
        int[] bookInfo = new int[2];
        if(book!=null){
            bookInfo[0]=book.getId();
            bookInfo[1]=book.getPoints();
            return bookInfo;
        }
        bookInfo[0]=Integer.MAX_VALUE;
        bookInfo[1]=Book.BOOK_DEFAULT_POINTS;
        return bookInfo;
    }
}
