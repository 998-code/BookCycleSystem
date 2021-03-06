package com.wcm533.pojo;

import java.util.Date;

/**
 * @ClassName EndowBookList
 * @Descripyion TODO
 * @Author 吴超民
 * @Date 2021/04/06 14:53
 **/
public class EndowBookList {

    /**
     * 待处理
     */
    public static final Integer READY=0;
    /**
     * 处理中
     */
    public static final Integer PROCESSING=1;
    /**
     * 已完成
     */
    public static final Integer COMPLETED=2;
    /**
     * 取消
     */
    public static final Integer CANCEL=4;
    public static final Integer USER_PAGE_SIZE=4;
    public static final Integer MANAGER_PAGE_SIZE=4;

    private String bookListId;
    private Date createTime;
    private int points;
    private int status;
    private int userId;

    public EndowBookList(){

    }

    public EndowBookList(String bookListId, Date createTime, int points, int status, int userId) {
        this.bookListId = bookListId;
        this.createTime = createTime;
        this.points = points;
        this.status = status;
        this.userId = userId;
    }

    public EndowBookList(String bookListId, Date createTime, int points, int userId) {
        this.bookListId = bookListId;
        this.createTime = createTime;
        this.points = points;
        this.userId = userId;
    }

    public String getBookListId() {
        return bookListId;
    }

    public void setBookListId(String bookListId) {
        this.bookListId = bookListId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "EndowBookList{" +
                "bookListId='" + bookListId + '\'' +
                ", createTime=" + createTime +
                ", points=" + points +
                ", status=" + status +
                ", userId=" + userId +
                '}';
    }
}
