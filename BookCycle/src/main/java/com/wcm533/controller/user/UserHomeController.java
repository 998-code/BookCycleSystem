package com.wcm533.controller.user;

import com.wcm533.pojo.*;
import com.wcm533.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @ClassName UserHome
 * @Descripyion TODO
 * @Author 吴超民
 * @Date 2021/04/19 16:17
 **/

@Controller
@RequestMapping("/user")
public class UserHomeController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserServiceImpl userService;

    @Autowired
    @Qualifier("bookListServiceImpl")
    private BookListServiceImpl bookListService;

    @Autowired
    @Qualifier("endowBookListServiceImpl")
    private EndowBookListServiceImpl endowBookListService;

    @Autowired
    @Qualifier("pointsServiceImpl")
    private PointsServiceImpl pointsService;

    @Autowired
    @Qualifier("reservationServiceImpl")
    private ReservationServiceImpl reservationService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/home")
    public String home(){
        User user = (User) request.getSession().getAttribute("user");
        if(user==null){
            return "user/user_login";
        }
        if(user.getAuthority()>2){
            return "manager/manager_home";
        }
        User userById = userService.getUserById(user.getId());
        List<BookList> bookLists = bookListService.queryBookListsByUserId(user.getId(), 0, BookList.USER_PAGE_SIZE);
        List<ReservationDetails> reservations = reservationService.queryReservationByUserId(user.getId(), 0, ReservationDetails.USER_HOMEPAGE_PAGE_SIZE);
        request.getSession().setAttribute("user",userById);
        request.getSession().setAttribute("bookLists",bookLists);
        request.getSession().setAttribute("reservations",reservations);
        return "user/user_homepage";
    }

    @RequestMapping("/information")
    public String information(){

        return "user/information";
    }

    @RequestMapping("/head")
    public String head(){

        return "user/head";
    }

    @RequestMapping("/bookList")
    public String bookList(){
        User user = (User) request.getSession().getAttribute("user");
        List<BookList> bookLists = bookListService.queryBookListsByUserId(user.getId(), 0, BookList.USER_PAGE_SIZE);
        List<EndowBookList> endowBookLists = endowBookListService.queryBookListsByUserId(user.getId(), 0, EndowBookList.USER_PAGE_SIZE);
        request.getSession().setAttribute("bookLists",bookLists);
        request.getSession().setAttribute("endowBookLists",endowBookLists);
        return "user/bookList";
    }

    @RequestMapping("/points")
    public String points(){
        User user = (User) request.getSession().getAttribute("user");
        List<Points> points = pointsService.queryPointsByUserId(user.getId());
        request.getSession().setAttribute("points",points);
        return "user/points";
    }

    @RequestMapping("/bespeak")
    public String bespeak(Model model){
        User user = (User) request.getSession().getAttribute("user");
        List<ReservationDetails> reservations = reservationService.queryReservationByUserId(user.getId(), 0, ReservationDetails.USER_RESERVATION_PAGE_SIZE);
        model.addAttribute("reservations",reservations);
        return "user/bespeak";
    }

    @GetMapping("/reservationBook")
    @ResponseBody
    public boolean reservation(int userId,int bookId){
        boolean reservation = reservationService.addReservation(userId, bookId);
        List<ReservationDetails> reservations = reservationService.queryReservationByUserId(userId, 0, ReservationDetails.USER_HOMEPAGE_PAGE_SIZE);
        request.getSession().setAttribute("reservations",reservations);
        return reservation;
    }

    @PostMapping("/cancelReservation")
    @ResponseBody
    public boolean cancelReservation(String id,Model model){
        if(id!=null&&id.length()!=0){
            int reservationId = Integer.parseInt(id);
            boolean reservation = reservationService.deleteReservation(reservationId);
            User user = (User) request.getSession().getAttribute("user");
            List<ReservationDetails> userHomeReservations = reservationService.queryReservationByUserId(user.getId(), 0, ReservationDetails.USER_HOMEPAGE_PAGE_SIZE);
            List<ReservationDetails> reservations = reservationService.queryReservationByUserId(user.getId(), 0, ReservationDetails.USER_RESERVATION_PAGE_SIZE);
            request.getSession().setAttribute("reservations",userHomeReservations);
            model.addAttribute("reservations",reservations);
            return reservation;
        }
        return false;
    }

}
