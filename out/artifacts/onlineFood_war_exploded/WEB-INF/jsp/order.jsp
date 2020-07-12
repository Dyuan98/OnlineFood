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

    <script type="text/javascript">
        <%--  1、用于前往个人信息页面，参数为userid      --%>
        function doPost(url, params) {
            let temp = document.createElement("form"); //创建form表单
            temp.action = url;
            temp.method = "post";
            temp.style.display = "none";//表单样式为隐藏
            for (let item in params) {//初始化表单内部的控件
                //根据实际情况创建不同的标签元素
                let opt =document.createElement("input");  //添加input标签
                opt.type="text";   //类型为text
                opt.id = item;      //设置id属性
                opt.name = item;    //设置name属性
                opt.value = params[item];   //设置value属性
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
        }
    </script>

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
                <c:if test="${pageName!='order'}">
                    <li><a href="${pageContext.request.contextPath}/orderCart/1">我的订单</a></li>
                </c:if>
                <c:if test="${pageName =='order'}">
                    <li class="active"><a href="${pageContext.request.contextPath}/orderCart/1">我的订单</a></li>
                </c:if>
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
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />

<%--购物车详情--%>
<div class="row clearfix">
    <div class="col-md-2 "></div>
    <div class="col-md-8 column">
        <table class="table table-hover table-striped table table-bordered">
            <%--                表单头部--%>
            <thead>
            <tr>
                <th>食品名称</th>
                <th>食品价格</th>
                <th>下单时间</th>
                <th>订单状态</th>
                <th>是否送达</th>
            </tr>
            </thead>
            <tbody>
            <%--   根据controller传来的orders对象列表，将所有信息显式地展现在页面上             --%>
            <c:forEach var="order" items="${requestScope.get('orders')}">
                <tr>
                    <td class="danger">${order.getFood().getFname()}</td>
                    <td class="success">${order.getFood().getPrice()}</td>
                    <td class="info">${order.getoTime()}</td>
                    <td width="100px" class="active" style="text-align: center">
                            <button type="button" class="btn btn-danger" style="font-size: 3px">已付款</button>
                    </td>
                    <td width="100px" class="active" style="text-align: center">
                        <button type="button" class="btn btn-success" style="font-size: 3px"
                                onclick="doPost('${pageContext.request.contextPath}/confirm',{oid:'${order.getOid()}'})">确认收货</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-md-2 "></div>
</div>
</body>
</html>
