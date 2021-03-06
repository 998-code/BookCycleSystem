<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/bookimg1.jpg" type="image/x-icon"/>
    <%@include file="../common/head.jsp" %>
    <script>
        let href = location.href;//获取或设置整个URL
        let index = href.indexOf("manager");
        let newHref = href.substr(0, index);
        $(function () {
            let pathname = window.location.pathname;
            $("#getBook").click(function () {
                window.open(newHref + "manager/getBook?pageNo=1");
                return false;
            });

            $("#getBookList").click(function () {
                window.open(newHref + "manager/getBookList?pageNo=1");
                return false;
            });

            $("#search").click(function () {
                let info = $.trim($("#info").val());
                //let regExp = /^[^0][0-9]{3,16}$/;
                if (info != "" || info.length != 0) {
                    location.href = newHref + "manager/searchUser/" + info + "?pageNo=1";
                    return false;
                } else {
                    $(".book-alert").html("输入数据格式不匹配！").addClass("book-alert-danger").show().delay(5000).fadeOut();
                    return false;
                }

            });

            $(".updateAuthority").each(function () {
                let that = $(this);
                let authority = that.data("authority");
                let userId = that.data("user-id");
                let userAuthority = that.data("user-authority");
                that.click(function () {
                    if(authority==userAuthority){
                        $(".book-alert").html("用户权限与修改后的权限相同！").addClass("book-alert-warning").show().delay(2500).fadeOut();
                        return false;
                    }
                    $.post({
                        url:newHref+"manager/updateUserAuthority",
                        data:{"userId":userId,"authority":authority},
                        success:function (data) {
                            switch (data) {
                                case 200:
                                    $(".book-alert").html("用户[" + userId + "]权限修改成功！").addClass("book-alert-success").show().delay(2500).fadeOut();
                                    break;
                                case 404:
                                    $(".book-alert").html("用户[" + userId + "]权限修改失败，您的权限不足！").addClass("book-alert-warning").show().delay(2500).fadeOut();
                                    break;
                                case 500:
                                    $(".book-alert").html("用户[" + userId + "]权限修改成功，发生某种未知错误！").addClass("book-alert-danger").show().delay(2500).fadeOut();
                                    break;
                                case 501:
                                    $(".book-alert").html("不允许修改本身的权限").addClass("book-alert-danger").show().delay(2500).fadeOut();
                                    break;
                            }
                        }
                    });
                });
            });

            $("#refresh").click(function () {
                window.location.reload();
            });

            $(".previousPage").click(function () {
                let No = $(this).data("page-no");
                let pageNo = No - 1;
                location.href = pathname + "?pageNo=" + pageNo;
                return false;
            });

            $(".nextPage").click(function () {
                let No = $(this).data("page-no");
                let pageNo = No + 1;
                location.href = pathname + "?pageNo=" + pageNo;
                return false;
            });

            $(".pageBook").click(function () {
                let pageNo = $.trim($(this).text());
                location.href = pathname + "?pageNo=" + pageNo;
                return false;
            });

            $("#goFirst").click(function () {
                location.href = pathname + "?pageNo=1";
                return false;
            });

            $("#goLast").click(function () {
                let last = $(this).data("last");
                location.href = pathname + "?pageNo=" + last;
                return false;
            });

            $("#pageSizeSubmit").click(function () {
                let totalPage = $(this).data("page");
                let pageSize = $("#pageSize").val();
                if (pageSize > totalPage || pageSize <= 0) {
                    alert("该页码不存在?");
                    return false;
                }
                location.href = pathname + "?pageNo=" + pageSize;
                return false;
            });

        });

        window.addEventListener("load", function () {
            let as = document.querySelectorAll(".byAuthority");
            for (let i = 0; i < as.length; i++) {
                as[i].addEventListener("click", function () {
                    let authority = this.dataset.authority;
                    location.href = newHref + "manager/userByAuthority/" + authority + "?pageNo=1";
                });
            }
        });

    </script>
    <style>
        .book-alert {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 200px;
            margin-left: -100px;
            z-index: 99999;
            padding: 15px;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .book-alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }

        .book-alert-info {
            color: #31708f;
            background-color: #d9edf7;
            border-color: #bce8f1;
        }

        .book-alert-warning {
            color: #8a6d3b;
            background-color: #fcf8e3;
            border-color: #faebcc;
        }

        .book-alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
    </style>
</head>
<body>
<div class="book-alert"></div>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small style="margin-top:15px;"><a href="javascript:void(0)" id="getBook">书籍管理</a></small>
                    <small style="margin-top:15px;"><a href="javascript:void(0)" id="getBookList">书单管理&nbsp;</a></small>
                    <small style="margin-top:15px;"><a href="javascript:void(0)">文章管理&nbsp;</a></small>
                    <small style="margin-top:15px;">用户管理&nbsp;</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-4 column">
            <div class="btn-group">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        权限查询
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);" class="byAuthority" data-authority="1">普通会员</a></li>
                        <li><a href="javascript:void(0);" class="byAuthority" data-authority="2">超级会员</a></li>
                        <li><a href="javascript:void(0);" class="byAuthority" data-authority="3">管理员</a></li>
                        <li><a href="javascript:void(0);" class="byAuthority" data-authority="4">超级管理员</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-8 column">
            <a class="btn btn-primary" style="float: right;" href="javascript:void(0);" id="refresh">刷新</a>
            <form class="form-inline" style="float: right;margin-right: 20px;">
                <span style="color: red;font-weight: bold;">ERROR</span>
                <input type="text" id="info" class="form-control" placeholder="请输入用户名或ID：" value="${requestScope.info}">
                <input type="submit" value="查询" id="search" class="btn btn-primary">
            </form>
        </div>
    </div>


    <div class="row clearfix" style="margin-top: 10px;">
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <p class="label label-warning" style="font-size: 14px;">管理员只能修改权限1，2；超级管理员可以修改权限1，2，3，4</p>
        </div>
        <div class="col-md-4 column"></div>
    </div>

    <div class="row clearfix" style="margin-top: 10px;">
        <div class="col-md-12 column">
            <table class="table table-bordered table-striped" style="font-size: 16px;">
                <thead>
                <tr>
                    <th>用户ID</th>
                    <th>用户名</th>
                    <th>用户密码</th>
                    <th>用户邮箱</th>
                    <th>权限</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${requestScope.userPage.pageItems}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>******</td>
                        <td>${user.email}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.authority==1}">
                                    普通会员
                                </c:when>
                                <c:when test="${user.authority==2}">
                                    超级会员
                                </c:when>
                                <c:when test="${user.authority==3}">
                                    管理员
                                </c:when>
                                <c:when test="${user.authority==4}">
                                    超级管理员
                                </c:when>
                            </c:choose>
                        </td>
                        <td style="padding: 3px;">
                            <div class="btn-group" style="margin:0;padding: 0;">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                    修改权限
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0);" class="updateAuthority"
                                           data-user-id="${user.id}" data-user-authority="${user.authority}" data-authority="1">
                                        普通用户
                                    </a></li>
                                    <li><a href="javascript:void(0);" class="updateAuthority"
                                           data-user-id="${user.id}" data-user-authority="${user.authority}" data-authority="2">
                                        会员用户
                                    </a></li>
                                    <li><a href="javascript:void(0);" class="updateAuthority"
                                           data-user-id="${user.id}" data-user-authority="${user.authority}" data-authority="3">
                                        管理员
                                    </a></li>
                                    <li><a href="javascript:void(0);" class="updateAuthority"
                                           data-user-id="${user.id}" data-user-authority="${user.authority}" data-authority="4">
                                        超级管理员
                                    </a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row clearfix">

        <div class="col-md-12 colum">
            <nav aria-label="Page navigation" style="text-align: center;">
                <ul class="pagination" style="display: inline-block;float: none;margin: 0em;">
                    <c:if test="${requestScope.userPage.pageNo>1}">
                        <li><a href="javascript:void(0);" id="goFirst">首页</a></li>
                        <li><a href="javascript:void(0);" class="previousPage"
                               data-page-no="${requestScope.userPage.pageNo}">&laquo;</a></li>
                    </c:if>

                    <c:choose>
                        <c:when test="${requestScope.userPage.pageTotal<=5}">
                            <c:set var="begin" value="1"></c:set>
                            <c:set var="end" value="${requestScope.userPage.pageTotal}"></c:set>
                        </c:when>
                        <c:when test="${requestScope.userPage.pageTotal>5}">
                            <c:choose>
                                <c:when test="${requestScope.userPage.pageNo<=3}">
                                    <c:set var="begin" value="1"></c:set>
                                    <c:set var="end" value="5"></c:set>
                                </c:when>
                                <c:when test="${requestScope.userPage.pageNo>=requestScope.userPage.pageTotal-3}">
                                    <c:set var="begin" value="${requestScope.userPage.pageTotal-4}"></c:set>
                                    <c:set var="end" value="${requestScope.userPage.pageTotal}"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="begin" value="${requestScope.userPage.pageNo-2}"></c:set>
                                    <c:set var="end" value="${requestScope.userPage.pageNo+2}"></c:set>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                    </c:choose>

                    <c:forEach begin="${begin}" end="${end}" var="i">
                        <c:if test="${requestScope.userPage.pageNo==i}">
                            <li class="active"><a href="javascript:void(0);" class="pageBook">${i}</a></li>
                        </c:if>
                        <c:if test="${requestScope.userPage.pageNo!=i}">
                            <li><a href="javascript:void(0);" class="pageBook">${i}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${requestScope.userPage.pageNo<requestScope.userPage.pageTotal}">
                        <li><a href="javascript:void(0);" class="nextPage"
                               data-page-no="${requestScope.userPage.pageNo}">&raquo;</a>
                        </li>
                        <li><a href="javascript:void(0);" id="goLast"
                               data-last="${requestScope.userPage.pageTotal}">末页</a>
                        </li>
                    </c:if>
                    <li><span>共有${requestScope.userPage.pageTotal}页</span></li>
                    <li>
                        <form class="form-inline" style="white-space: nowrap;display:inline-block;">
                            <input class="form-control" style="width: 100px;" type="number" id="pageSize"
                                   value="${requestScope.userPage.pageNo}"
                                   placeholder="查询页码">
                            <input class="btn btn-primary" type="submit" id="pageSizeSubmit" value="查询"
                                   data-page="${requestScope.userPage.pageTotal}">
                        </form>
                    </li>
                </ul>
            </nav>
        </div>


    </div>

</div>

</body>
</html>