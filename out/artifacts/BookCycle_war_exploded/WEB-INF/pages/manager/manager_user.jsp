<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <meta charset="utf-8"> 
   <title>用户管理</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/bookimg1.jpg" type="image/x-icon"/>
    <%@include file="../common/head.jsp" %>
   
</head>
<body>
    <div class="container">

        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small><a class="btn btn-primary" href="#">返回首页</a></small>
                        <small style="float: right;margin-top:15px;"><a href="#">书籍管理</a></small>
                        <small style="float: right;margin-top:15px;"><a href="#">书单管理&nbsp;</a></small>
                        <small style="float: right;margin-top:15px;"><a href="#">文章管理&nbsp;</a></small>
                        <small style="float: right;margin-top:15px;"><a href="#">用户管理&nbsp;</a></small>   
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
                        <li><a href="#">普通用户</a></li>
                        <li><a href="#">会员用户</a></li>
                        <li><a href="#">管理员</a></li>
                        <li><a href="#">超级管理员</a></li>
                    </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-8 column">
                <a class="btn btn-primary" style="float: right;" href="#">刷新</a>
                <form class="form-inline" action="" method="POST" style="float: right;margin-right: 20px;">
                    <span style="color: red;font-weight: bold;">ERROR</span>
                    <input type="text" name="" class="form-control" placeholder="请输入用户名或ID：">
                    <input type="submit" value="查询" class="btn btn-primary">
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
                        
                        <tr>
                            <td>1901</td>
                            <td>许世烽</td>
                            <td>123456</td>
                            <td>xushifeng@qq.com</td>
                            <td>普通用户</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改权限
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">普通用户</a></li>
                                        <li><a href="#">会员用户</a></li>
                                        <li><a href="#">管理员</a></li>
                                        <li><a href="#">超级管理员</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>    
                        <tr>
                            <td>1902</td>
                            <td>李九军</td>
                            <td>123456</td>
                            <td>lijiujun@qq.com</td>
                            <td>会员用户</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改权限
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">普通用户</a></li>
                                        <li><a href="#">会员用户</a></li>
                                        <li><a href="#">管理员</a></li>
                                        <li><a href="#">超级管理员</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>1903</td>
                            <td>张桦</td>
                            <td>123456</td>
                            <td>zhanghua@qq.com</td>
                            <td>会员用户</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改权限
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">普通用户</a></li>
                                        <li><a href="#">会员用户</a></li>
                                        <li><a href="#">管理员</a></li>
                                        <li><a href="#">超级管理员</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>1904</td>
                            <td>周泽清</td>
                            <td>123456</td>
                            <td>zhouzheqing@qq.com</td>
                            <td>会员用户</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改权限
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">普通用户</a></li>
                                        <li><a href="#">会员用户</a></li>
                                        <li><a href="#">管理员</a></li>
                                        <li><a href="#">超级管理员</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>

                            
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row clearfix">
           
            <div class="col-md-12 colum">
                <nav aria-label="Page navigation" style="text-align: center;">
                    <ul class="pagination" style="display: inline-block;float: none;margin: 0em;">
                       <li><a href="#">首页</a></li>
                       <li>
                        <a href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li>
                        <a href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                      <li><a href="#">末页</a></li>
                      <li><span>共有10页</span></li>
                      <li> 
                        <form class="form-inline" style="white-space: nowrap;display:inline-block;">
                            <input class="form-control" style="width: 100px;" type="number" name="pageSize" placeholder="查询页码">
                            <input class="btn btn-primary" type="submit" value="查询">
                        </form>
                                                                               
                      </li>
                    </ul>
                  </nav>
            </div>
            
            
        </div>
     
    </div>

</body>
</html>