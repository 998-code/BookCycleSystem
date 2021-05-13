<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <meta charset="utf-8"> 
   <title>书单管理</title>
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
                            借书单
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">未出库</a></li>
                            <li><a href="#">已出库</a></li>
                            <li><a href="#">待确认</a></li>
                            <li><a href="#">已接收</a></li>
                        </ul>
                        </div>
                    <div class="btn-group">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        捐书单
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">未入库</a></li>
                        <li><a href="#">已接收</a></li>
                        <li><a href="#">已确认</a></li>
                        <li><a href="#">已入库</a></li>
                    </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 column">
                <a class="btn btn-primary" style="float: right;" href="#">刷新</a>
                <form class="form-inline" action="" method="POST" style="float: right;margin-right: 20px;">
                    <span style="color: red;font-weight: bold;">ERROR</span>
                    <input type="text" name="" class="form-control" placeholder="请输入书单ID或用户ID：">
                    <input type="submit" value="查询" class="btn btn-primary">
                </form>
            </div>
        </div>
            
      
        <div class="row clearfix" style="margin-top: 10px;">
            <div class="col-md-12 column">
                <table class="table table-bordered table-striped" style="font-size: 16px;text-align: center;">
                    <thead>
                    <tr>
                        <th style="text-align: center;">书单编号</th>
                        <th style="text-align: center;">积分</th>
                        <th style="text-align: center;" >状态</th>
                        <th style="text-align: center;">用户ID</th>
                        <th style="text-align: center;">备注</th>
                        <th style="text-align: center;">详情</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
     
                    <tbody>
                        
                        <tr>
                            <td>16176247950501914</td>
                            <td>38</td>
                            <td>0</td>
                            <td>1914</td>
                            <td>借书单</td>
                            <td>
                                <a href="#">详情</a>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改状态
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">未出库</a></li>
                                        <li><a href="#">已出库</a></li>
                                        <li><a href="#">待确认</a></li>
                                        <li><a href="#">已接收</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>    
                        <tr>
                            <td>16176247950501914</td>
                            <td>38</td>
                            <td>0</td>
                            <td>1914</td>
                            <td>借书单</td>
                            <td>
                                <a href="#">详情</a>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改状态
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">未出库</a></li>
                                        <li><a href="#">已出库</a></li>
                                        <li><a href="#">待确认</a></li>
                                        <li><a href="#">已接收</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>    
                        <tr>
                            <td>16176247950501914</td>
                            <td>38</td>
                            <td>0</td>
                            <td>1914</td>
                            <td>借书单</td>
                            <td>
                                <a href="#">详情</a>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改状态
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">未出库</a></li>
                                        <li><a href="#">已出库</a></li>
                                        <li><a href="#">待确认</a></li>
                                        <li><a href="#">已接收</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>    
                        <tr>
                            <td>16176247950501914</td>
                            <td>38</td>
                            <td>0</td>
                            <td>1914</td>
                            <td>借书单</td>
                            <td>
                                <a href="#">详情</a>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        修改状态
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">未出库</a></li>
                                        <li><a href="#">已出库</a></li>
                                        <li><a href="#">待确认</a></li>
                                        <li><a href="#">已接收</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>    

                            
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 分页条 -->
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