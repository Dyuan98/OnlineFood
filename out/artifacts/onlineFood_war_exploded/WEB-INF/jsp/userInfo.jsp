<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
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
                <li><a href="${pageContext.request.contextPath}/messages">食客留言</a></li>
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

<%--店铺牌面--%>
<div class="alert " role="alert"></div>
<img src="${pageContext.request.contextPath}/statics/img/title01.png"  class="img-responsive img-rounded" >
<%--分割线--%>
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />

<%--食品详情页主要部分--%>
<div class="row">
    <%-- 左侧边缘   --%>
    <div class="col-sm-6 col-lg-1 col-md-1"></div>

    <%--头像展示--%>
    <div class="col-sm-6 col-lg-4 col-md-4">
        <img src="${pageContext.request.contextPath}/statics/img/avatar01.jpg" class="img-circle" height="475" width="390" >
        <%--        分割线--%>
        <div class="alert " role="alert"></div>
    </div>
    <%--    分隔头像和个人信息--%>
    <div class="col-sm-6 col-lg-1 col-md-1"></div>

    <%--    右侧文字描述--%>
    <div class="jumbotron col-sm-6 col-lg-5 col-md-5">
        <%--    分割线--%>
        <p class="bg-warning" style="font-size: 32px; text-align: center" >个人信息</p>
        <form  action="${pageContext.request.contextPath}/uModifyUser" method="post" class="form-horizontal" >
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">昵称：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name = "name" id="name" value="${user.getName()}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="pwd" class="col-md-2 control-label">密码：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="pwd" name = "pwd" value="${user.getPwd()}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-md-2 control-label">电话：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="phone"  name = "phone" value="${user.getPhone()}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-md-2 control-label">地址：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="address"  name = "address" value="${user.getAddress()}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="money" class="col-md-2 control-label">余额：</label>
                <div class="col-sm-8">
                    <input style="color: crimson" type="text" class="form-control" id="money"  name = "money" value="${user.getMoney()}&nbsp;&nbsp;&nbsp;RMB" disabled>
                    <p class="col-sm-4"><a href="${pageContext.request.contextPath}/toRecharge">前往充值</a></p>
                </div>
            </div>
            <input type="hidden"  id="id"  name = "id" value="${user.getId()}">
            <%--        注册按钮--%>
            <div class="form-group">
                <div class="col-md-offset-5  col-md-3">
                    <input type="submit" class="btn-primary btn-block" value="提交修改">
                </div>

            </div>
        </form>

    <%--    右侧边缘--%>
    <div class="col-sm-6 col-lg-1 col-md-1"></div>
</div>

</div>
    <%--分割线--%>
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
