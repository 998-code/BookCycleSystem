<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <meta charset="utf-8"> 
   <title>个人中心</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/userImg/img${sessionScope.user.id}${sessionScope.user.headImgPath}" type="image/x-icon" />
    <%@include file="../common/head.jsp"%>
    <script src="${pageContext.request.contextPath }/static/js/myJS/homepage.js"></script>
   <script>
       $(function () {
           $(".receive").click(function () {
               let ul = $(this).parent().parent();
               let status = $.trim(ul.children("td").eq(3).text());
               let bookListId = ul.find("td:first").text();
               if(status!="已出库"){
                   alert("书单["+bookListId+"]"+status+"，不能接收！");
               }else{
                   if(confirm("你确定接收书单["+bookListId+"]吗？")){
                       $.post({
                           url:"${pageContext.request.contextPath}/bookList/receive",
                           data:{"bookListId":bookListId},
                           success:function (data) {
                               if(data){
                                   ul.children("td").eq(3).text("借阅中");
                               }else{
                                   alert("书单["+bookListId+"]接收失败！");
                               }
                           }
                       });
                   }
               }
           });

           $(".cancel").click(function () {
               let ul = $(this).parent().parent();
               let status = $.trim(ul.children("td").eq(3).text());
               let bookListId = ul.find("td:first").text();
               if(status!="准备中"){
                   alert("书单["+bookListId+"]"+status+"，不能取消！");
               }else{
                   if(confirm("你确定取消书单["+bookListId+"]吗？")){
                       $.post({
                           url:"${pageContext.request.contextPath}/bookList/cancel",
                           data:{"bookListId":bookListId},
                           success:function (data) {
                               if(data){
                                   ul.children("td").eq(3).text("已取消");
                               }else{
                                   alert("书单["+bookListId+"]取消失败！");
                               }
                           }
                       });
                   }
               }

           });
       });

       function myHead() {
           location.href="head";
       }

   </script>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-1 column">
                
            </div>
            <div class="col-md-10 column">                
                <h1>
                    <small><a class="btn btn-primary" href="#">首页</a></small>
                </h1>               
            </div>
            <div class="col-md-1 column">
                
            </div>
        </div>

        
        <div class="row clearfix" style="margin-top: 20px;">
            <div class="col-md-1 column">
                
            </div>
            <div class="col-md-10 column">
                <div style="float: left; width: 20%">
                    <ul class="list-group" id="homepageUl" style="border: 1px solid #dddddd;">
                        <span href="#" class="list-group-item ulSpan">个人中心</span>
                        <a href="javascript:void(0);" onclick="myHome()" class="list-group-item active"><span class="glyphicon glyphicon-home">&nbsp;首&nbsp;&nbsp;页</span></a>
                        <a href="javascript:void(0);" onclick="myInformation()" class="list-group-item"><span class="glyphicon glyphicon-user">&nbsp;我的信息</span></a>
                        <a href="javascript:void(0);" onclick="myHead()" class="list-group-item"><span class="glyphicon glyphicon-picture">&nbsp;我的头像</span></a>
                        <a href="javascript:void(0);" onclick="myBookList()" class="list-group-item"><span class="glyphicon glyphicon-book">&nbsp;我的书单</span></a>
                        <a href="javascript:void(0);" onclick="myPoints()" class="list-group-item"><span class="glyphicon glyphicon-usd">&nbsp;我的积分</span></a>
                        <a href="javascript:void(0);" onclick="myBespeak()" class="list-group-item"><span class="glyphicon glyphicon-time">&nbsp;我的预约</span></a>
                    </ul>
                </div>
                
                <div id="homepage" style="float: right; width: 80%;height: 620px; border: 1px solid #dddddd;">
                    <!-- 首页 -->
                    <div style="border-bottom: 1px solid #dddddd;height: 160px;">
                        <div style="width: 100px;height: 100px;float: left;margin-left: 30px;margin-top: 30px;">
                            <img src="${pageContext.request.contextPath}/static/img/userImg/img${sessionScope.user.id}${sessionScope.user.headImgPath}" class="img-thumbnail">
                        </div>

                        <div style="width: 40%; height: 100px;margin-left: 30px; margin-top: 30px;float: left;">
                            <span style="font-size: 16px;font-weight: bolder;margin-top: 10px;">
                                ${sessionScope.user.username}
                            </span>

                            <div style="display: inline-block; margin-top: 10px;">
                                <span style="border:1px solid #d43f3a;padding: 2px;color: #d43f3a;border-radius: 4px;">
                                    <c:choose>
                                        <c:when test="${sessionScope.user.authority==1}">
                                            普通会员
                                        </c:when>
                                        <c:when test="${sessionScope.user.authority==2}">
                                            超级会员
                                        </c:when>
                                    </c:choose>
                                </span>
                            </div>

                            <div style="margin-top: 10px;">
                                <div style="width: 20px; height: 20px; border-radius: 10px; background-color: skyblue;display: inline-block;">
                                    <a href="#"><span class="glyphicon glyphicon-usd" style="margin-left: 2px;margin-top: 2px;color: snow;"></span></a>
                                </div>
                                <div style="display: inline-block;">
                                    <span>
                                        ${sessionScope.user.points}
                                    </span>
                                </div> 
                            </div>
                        </div>
                        <div style="border:1px solid #dddddd;float: right;margin-right: 20%; margin-top:70px ;border-radius: 5px;padding-left:15px ;padding-right: 15px;">
                            <a href="javascript:void(0);" onclick="myInformation()"><span style="color: #837d7d;">修改资料</span></a>
                        </div>

                    </div>
                    <!-- 书单 -->
                    <div style="border-bottom: 1px solid #dddddd;">
                        <p class="btn-lg" style="display: inline-block; margin-bottom: 0px; font-size: 30px;color: rgb(20, 233, 180);"><span class="glyphicon glyphicon-book"></span></p>
                        
                        <div style="display: inline-block;">
                            <span style="font-size: 20px;margin: 0 auto;">近期书单</span>
                        </div>

                        <div style="border:1px solid #dddddd;float: right;margin-right: 20%; margin-top:15px ;border-radius: 5px;padding-left:15px ;padding-right: 15px;">
                            <a href="javascript:void(0);" onclick="myBookList()"><span style="color: #837d7d;">全部书单</span></a>
                        </div>
                        
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <table class="table table-condensed" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">书单编号</th>
                                            <th style="text-align: center;">借书时间</th>
                                            <th style="text-align: center;">积分</th>
                                            <th style="text-align: center;" >状态</th>
                                            <th style="text-align: center;">备注</th>
                                            <th style="text-align: center;">操作</th>
                                        </tr>
                                    </thead>
                         
                                    <tbody>
                                        <c:forEach items="${sessionScope.bookLists}" var="bookList">
                                            <tr>
                                                <td>${bookList.bookListId}</td>
                                                <td class="time">${bookList.createTime}</td>
                                                <td>${bookList.points}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${bookList.status==0}">
                                                            准备中
                                                        </c:when>
                                                        <c:when test="${bookList.status==1}">
                                                            已出库
                                                        </c:when>
                                                        <c:when test="${bookList.status==2}">
                                                            借阅中
                                                        </c:when>
                                                        <c:when test="${bookList.status==3}">
                                                            已归还
                                                        </c:when>
                                                        <c:when test="${bookList.status==4}">
                                                            已取消
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>借书单</td>
                                                <td>
                                                    <a href="javascript:void(0);" class="receive">接收</a> |
                                                    <a href="javascript:void(0);" class="cancel">取消</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 预约 -->
                    <div>
                        <p class="btn-lg" style="display: inline-block; margin-bottom: 0px; font-size: 30px;color: rgb(233, 148, 20);"><span class="glyphicon glyphicon-time"></span></p>
                        
                        <div style="display: inline-block;">
                            <span style="font-size: 20px;margin: 0 auto;">预约</span>
                        </div>

                        <div style="border:1px solid #dddddd;float: right;margin-right: 20%; margin-top:15px ;border-radius: 5px;padding-left:15px ;padding-right: 15px;">
                            <a href="#"><span style="color: #837d7d;">全部预约</span></a>
                        </div>

                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <table class="table table-condensed" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">书籍编号</th>
                                            <th style="text-align: center;">书籍名称</th>
                                            <th style="text-align: center;">书籍状态</th>
                                            <th style="text-align: center;">积分</th> 
                                            <th style="text-align: center;">操作</th>
                                        </tr>
                                    </thead>
                         
                                    <tbody>
                                        <c:forEach items="${sessionScope.reservations}" var="reseration">
                                            <tr>
                                                <td>${reseration.bookId}</td>
                                                <td>${reseration.bookName}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${reseration.status==0}">
                                                            借阅中
                                                        </c:when>
                                                        <c:when test="${reseration.status==1}">
                                                            可借阅
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${reseration.points}</td>
                                                <td style="padding: 2px;">
                                                    <button type="button" class="btn btn-primary">
                                                        借阅
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--  -->
                    <!-- <div style="margin-top: 10px; height: 20px;">

                    </div> -->
                </div>
            </div>
            
            <div class="col-md-1 column">
                
            </div>
            
        </div>

        <div class="row clearfix" style="margin-top: 20px;">
            
            <div class="col-md-12 column" style="height: 100px;background-color: #dddddd;">                
                        
            </div>
            
        </div>

    </div>
    
</body>
</html>