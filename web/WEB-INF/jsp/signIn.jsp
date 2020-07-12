<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jQuery_3.5.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--    隐藏底部滚动条--%>
    <style type="text/css">
        body {
            overflow-x: hidden;
        }
    </style>
</head>
<body background = "${pageContext.request.contextPath}/statics/img/food07.jpg" style="background-size: cover">


<%--标题--%>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header" style="text-align: center">
            <h1>用户登录界面</h1>
        </div>
    </div>
</div>
<%--分隔线--%>
<div class="alert " role="alert"></div>
<div class="alert " role="alert"></div>
<%--页面左侧部分--%>
<div class="col-xs-6 col-md-4"></div>
<%--主界面--%>
<div class="col-xs-6 col-sm-4">
    <form  action="${pageContext.request.contextPath}/main/1" method="post" class="form-horizontal" >
        <div class="form-group">
            <label for="name" class="col-md-2 control-label">昵称</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name = "name" id="name" placeholder="name" required>
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-md-2 control-label">密码</label>
            <div class="col-sm-8">
                <input type="password" class="form-control" id="pwd" name = "pwd" placeholder="Password" required>
            </div>
        </div>

        <%--        登录按钮--%>
        <div class="form-group">
            <div class="col-md-4" style="text-align: center; line-height: 26px; ">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/login" style="color: #ff1e00">新用户？去注册</a></div>
            <div class=" col-md-3">
                <input type="submit" class="btn-primary btn-block" value="登录">
            </div>
            <div class=" col-md-3" style="text-align: center; line-height: 26px; ">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="" style="color: #efff00">密码找回</a></div>
        </div>

    </form>
</div>

<%--页面右侧部分--%>
<div class="col-xs-6 col-md-4"></div>

<div class="alert " role="alert"></div>
<div class="alert " role="alert"></div>
<div class="alert " role="alert"></div>

<%--登陆失败，警告部分--%>
<c:if test="${tourist}">
    <div class="col-sm-6 col-md-3"></div>
    <div class="col-sm-6 col-md-6">
        <div class="alert alert-danger" role="alert">请先登录！</div>
    </div>
    <div class="col-sm-6 col-md-3"></div>
</c:if>
<c:if test="${noExit}">
<div class="col-sm-6 col-md-3"></div>
    <div class="col-sm-6 col-md-6">
        <div class="alert alert-danger" role="alert">登陆失败，请检查用户名或密码是否输入错误！</div>
    </div>
<div class="col-sm-6 col-md-3"></div>
</c:if>

</body>
</html>