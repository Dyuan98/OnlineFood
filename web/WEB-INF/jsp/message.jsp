<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>食月革命</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="${pageContext.request.contextPath}/statics/js/jQuery_3.5.1.js"></script>
    <!--  Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--  Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--    隐藏底部滚动条--%>
    <style type="text/css">
        body {
            overflow-x: hidden;
        }
    </style>
</head>
<body style="background-color: #f3f5ee ">

<%--  导航条--%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <%--        商标--%>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/main/1">食月革命</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <%--        餐厅信息--%>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/video">宣传视频<span class="sr-only">(current)</span></a></li>
                <c:if test="${pageName!='messages'}">
                    <li><a href="${pageContext.request.contextPath}/messages">食客留言</a></li>
                </c:if>
                <c:if test="${pageName=='messages'}">
                    <li class="active"><a href="${pageContext.request.contextPath}/messages">食客留言</a></li>
                </c:if>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: #d49332">餐厅活动<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/toRecharge">会员充值</a></li>
                        <li><a href="#">优惠特权</a></li>
                        <li><a href="#">活动专区</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                </li>
            </ul>
            <%--            搜索表单--%>
            <form class="navbar-form navbar-left" action="/query/${currPage}">
                <div class="form-group">
                    <input type="text" class="form-control" name="fname" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-Info" >搜索商品</button>
            </form>
            <%--            个人信息--%>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/orderCart/0">我的购物车</a></li>
                <li><a href="${pageContext.request.contextPath}/orderCart/1">我的订单</a></li>
                <li class="dropdown">
                    <c:if test="${user.getName()==null}">
                        <a href="${pageContext.request.contextPath}/signIn" >
                            未登录，点击登录
                            <span class="caret"></span></a>
                    </c:if>
                    <c:if test="${user.getName()!=null}">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                ${user.getName()}
                            <span class="caret"></span></a>
                    </c:if>
                    <ul class="dropdown-menu">
                        <li><a  href="${pageContext.request.contextPath}/userInfo">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/orderCart/2">历史订单</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/logOff">注销登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<%--分割线--%>
<div class="alert " role="alert"></div>
<%--    店铺牌--%>
<div class="col-sm-12 col-md-12 col-lg-12">
    <img src="${pageContext.request.contextPath}/statics/img/title02.png"  class="img-responsive img-rounded"  style="width: 1800px">
</div>
<%--分割线--%>
<div class="alert " role="alert"></div>
<%--分割线--%>
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />

    <c:forEach var="message" items="${requestScope.get('messages')}">
        <div class="row">
            <div class=" col-md-2"></div>
            <div class=" col-md-2">
                <a href="${pageContext.request.contextPath}/detailsPage/${message.food.getFid()}/${user.getId()}" class="thumbnail">
                    <img src="${pageContext.request.contextPath}/statics/img/food${message.food.getImgUrl()}.jpg " width="220" height="100">
                </a>
            </div>
            <ul class="list-group col-md-6">
                <li class="list-group-item list-group-item-success">餐品名称：${message.food.getFname()}</li>
                <li class="list-group-item list-group-item-info">留言用户：${message.user.getName()}</li>
                <li class="list-group-item list-group-item-warning">评价：${message.getEvaluate()}</li>
            </ul>
            <div class=" col-md-2"></div>
        </div>
    </c:forEach>

<%--分隔--%>
<div class="alert " role="alert"></div>

<%--  页面底部--%>
<div style="text-align: center">
    <span class="lh">©2020&nbsp;食月革命&nbsp;</span><span class="lh">(京)-个人娱乐性-2017-0020</span>
    <a href="#">
        <span class="lh s-bottom-recordcode">京公网安备00000000000001号</span></a>
    <span class="lh">京ICP证0000001号</span>
</div>

</body>
</html>
