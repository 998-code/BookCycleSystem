package com.wcm533.service;

import com.wcm533.pojo.Reservation;
import com.wcm533.pojo.ReservationDetails;

import java.util.List;

/**
 * @ClassName ReservationService
 * @Descripyion TODO
 * @Author 吴超民
 * @Date 2021/04/20 20:33
 **/
public interface ReservationService {

    boolean addReservation(int userId ,int bookId);

    boolean deleteReservation(int id);

    Reservation queryReservation(int id);

    List<ReservationDetails> queryReservationByUserId(int userId, int begin, int pageSize);
}
