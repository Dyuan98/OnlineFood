<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改食品信息页面</title>
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
            <h1>修改食品信息页面</h1>
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
    <form  action="${pageContext.request.contextPath}/modifyFood/${pageSize}/${currPage}" method="post" class="form-horizontal" >
        <div class="form-group">
            <label for="fname" class="col-md-3 control-label">食品名称</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name = "fname" id="fname" placeholder="食品名称" value="${food.getFname()}"  required>
            </div>
        </div>
        <div class="form-group">
            <label for="ftype" class="col-md-3 control-label">食品类型</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="ftype" name = "ftype" placeholder="食品类型" value="${food.getFtype()}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="faccount" class="col-md-3 control-label">食品数量</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="faccount"  name = "faccount" placeholder="视频数量" value="${food.getFaccount()}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="price" class="col-md-3 control-label">食品价格</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="price"  name = "price" placeholder="食品价格" value="${food.getPrice()}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="introduce" class="col-md-3 control-label">食品简介</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="introduce"  name = "introduce" placeholder="食品简介" value="${food.getIntroduce()}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="imgUrl" class="col-md-3 control-label">食品图片</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="imgUrl"  name = "imgUrl" placeholder="食品图片" value="${food.getImgUrl()}" required>
            </div>
        </div>

        <%-- 用于提交fid，不便于展示页面上，使用隐藏域     --%>
        <input type="hidden" id="fid"  name = "fid"  value="${food.getFid()}">

        <%--        提交按钮--%>
        <div class="form-group">
            <div class="col-md-offset-3 col-md-6">
                <input type="submit" class="btn-primary btn-block" value="修改食品">
            </div>

        </div>
    </form>
</div>

<%--页面右侧部分--%>
<div class="col-xs-6 col-sm-3 col-md-4"></div>
</body>
</html>