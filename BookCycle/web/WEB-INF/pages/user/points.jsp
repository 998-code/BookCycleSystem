<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <meta charset="utf-8"> 
   <title>个人中心</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/userImg/img${sessionScope.user.id}${sessionScope.user.headImgPath}" type="image/x-icon" />
    <%@include file="../common/head.jsp"%>
    <script src="${pageContext.request.contextPath }/static/js/myJS/homepage.js"></script>
   <script>
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
                        <span href="#" class="list-group-item ulSpan" >个人中心</span>
                        <a href="javascript:void(0);" onclick="myHome()" class="list-group-item"><span class="glyphicon glyphicon-home">&nbsp;首&nbsp;&nbsp;页</span></a>
                        <a href="javascript:void(0);" onclick="myInformation()" class="list-group-item"><span class="glyphicon glyphicon-user">&nbsp;我的信息</span></a>
                        <a href="javascript:void(0);" onclick="myHead()" class="list-group-item"><span class="glyphicon glyphicon-picture">&nbsp;我的头像</span></a>
                        <a href="javascript:void(0);" onclick="myBookList()" class="list-group-item"><span class="glyphicon glyphicon-book">&nbsp;我的书单</span></a>
                        <a href="javascript:void(0);" onclick="myBookList()" class="list-group-item active"><span class="glyphicon glyphicon-usd">&nbsp;我的积分</span></a>
                        <a href="javascript:void(0);" onclick="myBespeak()" class="list-group-item"><span class="glyphicon glyphicon-time">&nbsp;我的预约</span></a>
                    </ul>
                </div>
                
                <div style="float: right; width: 80%;height: 620px; border: 1px solid #dddddd;">
                    <div style="width: 100%; height: 49px;padding-top:0px; border-bottom: 1px solid #dddddd;">
                        <div style="width: 5px;height: 20px;float: left; margin-left: 30px; margin-top: 15px; border-radius: 2px;background-color: rgb(63, 164, 247);"></div>
                        <span style="float: left; color: rgb(63, 164, 247);margin-top: 15px;margin-left: 5px;">我的积分</span>
                    </div>
                    
                    <div >
                        <div style="height: 50px;padding-top:0px;">
                            <span style="float: left;margin-top: 15px;margin-left: 30px;font-size: 20px;font-weight: bolder;">
                                积分余额：<p style="float: right;color:rgb(63, 164, 247) ;">139</p>
                            </span>
                        </div>

                        <span style="width: 100%;float: left;margin-left: 30px;font-weight: bolder;">
                            积分记录
                        </span>
                        <div style="width: 50%;float: left;margin-left: 10px;">
                            <table class="table table-bordered" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">时间</th>
                                        <th style="text-align: center;">变化</th>
                                        <th style="text-align: center;">原因</th>
                                        <th style="text-align: center;">操作</th>
                                    </tr>
                                </thead>
                     
                                <tbody>
                                    <tr>
                                        <td>2021-04-05 12:13:15</td>
                                        <td>-38</td>
                                        <td>借书</td>
                                        <td>
                                            <a href="#"data-toggle="modal" data-target="#pointsDetails">详情</a>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>2021-04-05 12:13:15</td>
                                        <td>-26</td>
                                        <td>借书</td>
                                        <td>
                                            <a href="#">详情</a>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>2021-04-05 12:13:15</td>
                                        <td>+28</td>
                                        <td>捐书</td>
                                        <td>
                                            <a href="#">详情</a>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>2021-04-05 12:13:15</td>
                                        <td>-38</td>
                                        <td>借书</td>
                                        <td>
                                            <a href="#">详情</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2021-04-05 12:13:15</td>
                                        <td>+28</td>
                                        <td>捐书</td>
                                        <td>
                                            <a href="#">详情</a>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>2021-04-05 12:13:15</td>
                                        <td>-38</td>
                                        <td>借书</td>
                                        <td>
                                            <a href="#">详情</a>
                                        </td>
                                    </tr>              
                                </tbody>
                            </table>

                            <!-- 模态框（Modal） -->
                            <div class="modal fade" id="pointsDetails" tabindex="-1" role="dialog" aria-labelledby="pointsDetailsLabel" aria-hidden="true" >
                                <div class="modal-dialog" style="width: 60%;">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="pointsDetailsLabel">书单详情</h4>
                                        </div>
                                        <div class="modal-body">

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button"  class="btn btn-primary" data-dismiss="modal">确定</button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal -->
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12 colum">
                                    <nav aria-label="Page navigation" style="text-align: center;">
                                        <ul class="pagination pagination-sm" style="display: inline-block;float: none;margin: 0em;">
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
                                        </ul>
                                      </nav>
                                </div>  
                            </div> 
                        </div>

                        <div style="width: 42%; height: 400px; float: left;margin-left: 30px;">
                            <span style="width: 100%;float: left;font-weight: bolder;margin-bottom: 20px;">
                                积分有什么用？
                            </span>
                            <p>
                                1、积分用于借书时的信用抵扣
                            </p>
                            <p>
                                2、积分还可用于修改昵称等活动
                            </p>
                            <span style="width: 100%;float: left;font-weight: bolder;margin-bottom: 20px;">
                                如何获取积分？
                            </span>
                            <p>
                                1、目前只有通过向系统捐赠书籍可获得积分
                            </p>
                            <p>
                                2、当你所借阅的书籍确认归还时，系统会归还一定比例的积分
                            </p>
                        </div>

                    </div>
                    
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