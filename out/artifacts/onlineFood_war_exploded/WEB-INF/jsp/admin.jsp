<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jQuery_3.5.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body background = "${pageContext.request.contextPath}/statics/img/food03.jpg">

<%--导航条--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="row">
        <%--  返回管理台主界面      --%>
        <div class="navbar-header col-md-2">
            <a class="navbar-brand" href="/admin">管理主界面</a>
        </div>
        <div style="text-align: center; line-height: 30px; font-size: 30px;margin: 10px" class="col-md-8" >
            食月革命后台管理系统
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Admin</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
        </div>
    </div><!-- /.container-fluid -->
</nav>

<%--管理食品和用户信息--%>
<div class="row">
    <%--分割线    --%>
    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
    <div class="col-md-2"></div>
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/user/1/5">
        <button type="button" class="btn btn-primary btn-lg" style="width: 399px; height: 150px;font-size: 50px">管理用户信息</button>
        </a>
    </div>
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/food/1/5">
        <button type="button" class="btn btn-success btn-lg" style="width: 399px; height: 150px;font-size: 50px">管理食品信息</button>
        </a>
    </div>
    <div class="col-md-2"></div>
</div>

<%--添加食品和用户信息--%>
<div class="row">
    <%--分割线    --%>
    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="1" />
    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="1" />
    <div class="col-md-2"></div>
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/allOrder">
            <button type="button" class="btn btn-danger btn-lg" style="width: 399px; height: 150px;font-size: 50px">管理订单信息</button>
        </a>
    </div>
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/addFood">
            <button type="button" class="btn btn-Info btn-lg" style="width: 399px; height: 150px;font-size: 50px">添加食品信息</button>
        </a>
    </div>
    <div class="col-md-2"></div>
</div>

</body>
</html>
