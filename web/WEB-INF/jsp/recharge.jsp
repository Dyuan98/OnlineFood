<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加食品页面</title>
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
<body background = "${pageContext.request.contextPath}/statics/img/food03.jpg" style="background-size: cover">


<%--标题--%>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header" style="text-align: center">
            <h1>用户充值</h1>
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
    <form  action="${pageContext.request.contextPath}/recharge" method="post" class="form-horizontal" >
        <div class="form-group">
            <label for="money" class="col-md-3 control-label">充值金额:</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="money" name = "money" placeholder="请在此输入充值金额" required>
            </div>
        </div>
    <input type="hidden" name = "id" value="${id}" >

    <div class="alert " role="alert"></div>
        <%--        按钮--%>
        <div class="form-group">
            <div class="col-md-offset-3 col-md-6">
                <input type="submit" class="btn-primary btn-block" value="确认充值">
            </div>

        </div>
    </form>
</div>

<%--页面右侧部分--%>
<div class="col-xs-6 col-sm-3 col-md-4"></div>
</body>
</html>