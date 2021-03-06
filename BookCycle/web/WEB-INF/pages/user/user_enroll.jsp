<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <meta charset="utf-8"> 
   <title>注册</title>
    <%@include file="../common/head.jsp"%>
    <script src="${pageContext.request.contextPath}/static/js/myJS/enroll.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#username").blur(function () {
                var username = this.value;
                $.post({
                    url:"${pageContext.request.contextPath}/user/ajaxUsername",
                    data:{"username":username},
                    success:function (data) {
                        if(data){
                            $("span.errorMsg").text("用户名已存在！");
                        }else{
                            $("span.errorMsg").text("用户名可用！");
                        }
                    }
                });
            });

            $("#email").blur(function () {
                var email = this.value;
                $.post({
                    url:"${pageContext.request.contextPath}/user/ajaxEmail",
                    data:{"email":email},
                    success:function (data) {
                        if(data){
                            $("span.errorMsg").text("该邮箱已被注册！");
                        }else{
                            $("span.errorMsg").text("该邮箱可用！");
                        }
                    }
                });
            });

            $("#code_img").click(function () {
                this.src="${pageContext.request.contextPath}/kaptcha.jpg?date="+new Date();
            })

        });
    </script>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                
                <h1>
                    <small><a class="btn btn-primary" href="#">首页</a></small>
                </h1>
                
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-5 column">
                <div class="page-header">
                    
                </div>
            </div>
            <div class="col-md-2 column">
                <h1>
                    <p style="text-align: center;">注册</p>  
                </h1>
            </div>
            <div class="col-md-5 column">
                <div class="page-header">

                </div>
            </div>
        </div>
     
        <div class="row clearfix" style="margin-top: 40px;">

            <div class="col-md-1 column">
                
            </div>

            <div class="col-md-5 column">
               <div style="margin-right: 5%;">
                <img src="${pageContext.request.contextPath }/static/img/img7.png" class="img-rounded" style="height: 350px; width:100%;">
               </div>
            </div>
            
            <div class="col-md-5 column" style="border-left:1px solid #dddddd;">
                <div class="alert alert-warning" style="margin-top: 5%;margin-left: 5%;width: 78%; height: 40px;padding-top:12px;ext-align: center;">
                    <span class="errorMsg">
                        ${empty requestScope.msg?"请输入注册信息！":requestScope.msg}
                    </span>
                </div>
                
                <form action="${pageContext.request.contextPath}/user/enroll" method="post" id="enrollForm" class="form-horizontal" role="form" style="margin-left: 5%;font-size: 16px;">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" name="username" value="${requestScope.user.username}" placeholder="昵称">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" value="${requestScope.user.password}" placeholder="密码（6个到16个字符组成，区分大小写）">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="repwd" name="repwd" value="${requestScope.user.password}" placeholder="确认密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" value="${requestScope.user.email}" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10" style="width: 40%;">
                            <input type="text" class="form-control" style="height:40px" id="code" name="code" placeholder="请输入验证码">
                        </div>
                        <div class="col-sm-10" style="width: 40%;border: 1px solid #dddddd;height: 40px;padding: 0px;">
                           <img id="code_img" title="点击刷新验证码" src="${pageContext.request.contextPath}/kaptcha.jpg" style="float: left; margin-left: 0px; width: 100%;height: 100%">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="button" id="sub_btn" class="btn btn-primary" value="注册" style="width: 100%;">
                        </div>
                    </div>
                </form>
                <div class="col-sm-10" style="text-align: right;">
                    <a href="${pageContext.request.contextPath}/user/getLogin">已有账号？直接登录</a>
                </div>
            </div>

            <div class="col-md-1 column">
               
            </div>

        </div>

    </div>
    <!-- <div class="container" style="margin-top: 20px;">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <p style="text-align: center;">登录即代表你同意用户协议和隐私政策</p>
            </div>
        </div>
    </div> -->
    

</body>
</html>