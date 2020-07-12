<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户留言页面</title>
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
<body background = "${pageContext.request.contextPath}/statics/img/food09.jpg" style="background-size: cover">


<%--标题--%>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header" style="text-align: center">
            <h1>添加留言信息</h1>
        </div>
    </div>
</div>
<%--分隔线--%>
<div class="alert " role="alert"></div>
<%--分隔线--%>
<div class="alert " role="alert"></div>

<%--页面左侧部分--%>
<div class="col-xs-6 col-sm-3 col-md-4"></div>

<%--主界面--%>
<div class="col-xs-6 col-sm-6 col-md-4">
    <form  action="${pageContext.request.contextPath}/addMessage" method="post" class="form-horizontal" >
        <div class="form-group">
            <div for="evaluate" class="col-md-2 control-label">请填写对这次购餐服务的评价</div>
            <div class="col-sm-8">
                <textarea class="form-control" name="evaluate" id="evaluate" rows="3"></textarea>
            </div>
        </div>
        <input type="hidden" class="btn-primary btn-block" name="fid" id="fid" value="${food.getFid()}">
        <%--        注册按钮--%>
        <div class="form-group">
            <div class=" col-md-3">
                <input type="submit" class="btn-primary btn-block" value="提交">
            </div>
        </div>
    </form>
</div>

<%--页面右侧部分--%>
<div class="col-xs-6 col-sm-3 col-md-4"></div>
</body>
</html>