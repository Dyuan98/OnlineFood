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
<body>
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

<%--分割线--%>
<div class="alert " role="alert"></div>
<%--分割线--%>
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />

<%--购物车详情--%>
<div class="row clearfix">
    <div class="col-md-2 "></div>
    <div class="col-md-8 column">
        <table class="table table-hover table-striped table table-bordered">
            <%--                表单头部--%>
            <thead>
            <tr>
                <th>用户昵称</th>
                <th>食品名称</th>
                <th>食品价格</th>
                <th>下单时间</th>
                <th>订单状态</th>
                <th>处理订单</th>
            </tr>
            </thead>
            <tbody>
            <%--   根据controller传来的user对象列表，将所有信息显式地展现在页面上             --%>
            <c:forEach var="order" items="${requestScope.get('orders')}">
                <tr>
                    <td class="warning">${order.getUser().getName()}</td>
                    <td class="danger">${order.getFood().getFname()}</td>
                    <td class="success">${order.getFood().getPrice()}</td>
                    <td class="info">${order.getoTime()}</td>
                <c:if test="${order.getoStatus()==1}">
                    <td width="100px" class="active" style="text-align: center">
                        <button type="button" class="btn btn-Info" style="font-size: 3px">已付款</button>
                    </td>
                    <td width="100px" class="active" style="text-align: center">
                        <button type="button" class="btn btn-Info" style="font-size: 3px">通知送餐</button>
                    </td>
                </c:if>
                <c:if test="${order.getoStatus()==0}">
                    <td width="100px" class="active" style="text-align: center">
                            <button type="button" class="btn btn-danger" style="font-size: 3px">未付款</button>
                    </td>
                    <td width="100px" class="active" style="text-align: center">
                        <button type="button" class="btn btn-danger" style="font-size: 3px">通知用户下单</button>
                    </td>
                </c:if>
                <c:if test="${order.getoStatus()==2}">
                    <td width="100px" class="active" style="text-align: center">
                        <button type="button" class="btn btn-success" style="font-size: 3px">订单已完成</button>
                    </td>
                    <td width="100px" class="active" style="text-align: center">
                        <button type="button" class="btn btn-success" style="font-size: 3px">提醒用户留言</button>
                    </td>
                </c:if>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-md-2 "></div>
</div>
</body>
</html>
