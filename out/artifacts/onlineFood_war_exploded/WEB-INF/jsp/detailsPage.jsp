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

    <%--    /**--%>
    <%--    * 功能：post方式提交，用于前往个人信息页面--%>
    <%--    * 参数列表：url：提交的地址；params：参数列表--%>
    <%--    */--%>
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
                <li><a href="#">我的购物车</a></li>
                <li><a href="#">我的订单</a></li>
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

<%--左侧轮播图与价格展示--%>
    <div class="col-sm-6 col-lg-4 col-md-4">
<%--        分割线--%>
<%--        <div class="alert " role="alert"></div>--%>
        <%--    轮播图--%>
        <div id="carousel-example-generic" class="carousel slide  " data-ride="carousel">
            <!-- 指示器-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- 幻灯片包装,图片路径 -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/statics/img/food03.jpg"  class="img-rounded">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/statics/img/food07.jpg" class="img-rounded">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/statics/img/food10.jpg" class="img-rounded">
                </div>
            </div>

            <!-- 控制左右滑动 -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
    </div>
    <%--        分割线--%>
        <div class="alert " role="alert"></div>
        <%--    价格展示--%>
        <div  class="alert alert-warning" style="line-height: 38px" >
            <del>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原价：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;999RMB</del>
            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                现价只要：&nbsp;&nbsp;&nbsp;
                <mark style="font-size: 25px;color: #dc1f00">${food.getPrice()}RMB</mark>&nbsp;&nbsp;&nbsp;
            </strong>
            <div><mark style="color: #dc1f00 ">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="">领取优惠卷，更多优惠等你来拿！</a></mark></div>
        </div>
    </div>
    <%--    分隔轮播图和文字--%>
    <div class="col-sm-6 col-lg-1 col-md-1"></div>

    <%--    右侧文字描述--%>
    <div class="jumbotron col-sm-6 col-lg-5 col-md-5">

        <%--     食品名称--%>
        <h2 style="text-align: center" class="text-danger">${food.getFname()}</h2>
        <%--    分割线--%>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
        <%--    食品简介--%>
        <p class="text-warning">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${food.getIntroduce()}</p>
        <%--    分割线--%>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />

            <%--    模态框，当用户点击加入购物车或立即购买时，出现提示 --%>
            <button type="button" class="btn btn-primary btn-lg col-md-offset-1" data-toggle="modal" data-target=".bs-example-modal-lg1"
                    onclick="doPost('${pageContext.request.contextPath}/addOrder',{uid:'${user.getId()}',fid:'${food.getFid()}'})">加入购物车</button>
            <button type="button" class="btn btn-danger btn-lg col-md-offset-1" data-toggle="modal" data-target=".bs-example-modal-lg2">立即购买</button>
        <%--    点击加入购物车，展示内容--%>
        <div class="modal fade bs-example-modal-lg1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document" >
                <div class="modal-content" style="color: #faebcc">
                    <div class="alert " role="alert"></div>
                          <p style="line-height: 30px; text-align: center; color: #ff0800" >已加入购物车，请前往购物车查看！</p>
                    <div class="alert " role="alert"></div>
                </div>
            </div>
        </div>
        <%--    点击立即购买，展示内容--%>
        <div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="alert " role="alert"></div>
                    <p style="line-height: 30px; text-align: center; color: #2f37ff" >付款成功！</p>
                    <div class="alert " role="alert"></div>
                </div>
            </div>
        </div>
        </div>

    <%--    右侧边缘--%>
    <div class="col-sm-6 col-lg-1 col-md-1"></div>
</div>

<%--分割线--%>
<div class="alert " role="alert"></div>


</body>
</html>
