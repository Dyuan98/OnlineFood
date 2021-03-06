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
            <li><a href="#">宣传视频<span class="sr-only">(current)</span></a></li>
            <li><a href="#">食客留言</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: #d49332">餐厅活动<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">会员充值</a></li>
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
          <form class="navbar-form navbar-left">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Search">
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
                <li><a href="${pageContext.request.contextPath}/userInfo">个人信息</a></li>
                <li><a href="#">余额充值</a></li>
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

    <%--轮播图--%>
    <div class="row">
  <div class="col-sm-6 col-md-1"></div>
    <div id="carousel-example-generic" class="carousel slide  col-sm-6 col-md-10" data-ride="carousel">
      <!-- 指示器-->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- 幻灯片包装 -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="${pageContext.request.contextPath}/statics/img/slide01.jpg"  class="img-rounded">
        </div>
        <div class="item">
          <img src="${pageContext.request.contextPath}/statics/img/slide02.jpg" class="img-rounded">
        </div>
        <div class="item">
          <img src="${pageContext.request.contextPath}/statics/img/slide03.jpg" class="img-rounded">
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
  <div class="col-sm-6 col-md-1"></div>
</div>

    <%--分隔--%>
    <div class="alert " role="alert"></div>

    <%--食品展示区域--%>
    <div class="row">
      <div class="col-sm-6 col-md-1"></div>
      <c:forEach var="food" items="${applicationScope.get('foods1')}">
        <div class="col-sm-6 col-md-2">
          <div class="thumbnail">
            <a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1">
              <img src="${pageContext.request.contextPath}/statics/img/food${food.getImgUrl()}.jpg " width="380" height="200">
            </a>
            <div class="caption">
              <h3>${food.getFname()}</h3>
              <p style="color: #ff0800">店长推荐</p>
              <p><a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1" class="btn btn-danger" role="button">${food.getPrice()}</a>
                <a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1" class="btn btn-Info" role="button">查看详情</a></p>
            </div>
          </div>
        </div>
      </c:forEach>
      <div class="col-sm-6 col-md-1"></div>
    </div>
    <div class="row">
      <div class="col-sm-6 col-md-1"></div>
      <c:forEach var="food" items="${applicationScope.get('foods2')}">
        <div class="col-sm-6 col-md-2">
          <div class="thumbnail">
            <a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1">
              <img src="${pageContext.request.contextPath}/statics/img/food${food.getImgUrl()}.jpg " width="380" height="200">
            </a>
            <div class="caption">
              <h3>${food.getFname()}</h3>
              <p style="color: #ff0800">店长推荐</p>
              <p><a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1" class="btn btn-danger" role="button">${food.getPrice()}</a>
                <a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1" class="btn btn-Info" role="button">查看详情</a></p>
            </div>
          </div>
        </div>
      </c:forEach>
      <div class="col-sm-6 col-md-1"></div>
    </div>
    <div class="row">
      <div class="col-sm-6 col-md-1"></div>
      <c:forEach var="food" items="${applicationScope.get('foods3')}">
        <div class="col-sm-6 col-md-2">
          <div class="thumbnail">
            <a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1">
              <img src="${pageContext.request.contextPath}/statics/img/food${food.getImgUrl()}.jpg " width="380" height="200">
            </a>
            <div class="caption">
              <h3>${food.getFname()}</h3>
              <p style="color: #ff0800">店长推荐</p>
              <p><a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1" class="btn btn-danger" role="button">${food.getPrice()}</a>
                <a href="${pageContext.request.contextPath}/detailsPage/${food.getFid()}/-1" class="btn btn-Info" role="button">查看详情</a></p>
            </div>
          </div>
        </div>
      </c:forEach>
      <div class="col-sm-6 col-md-1"></div>
    </div>

    <%--  分页  --%>
    <nav aria-label="Page navigation">
      <div class="col-sm-8"></div>
      <ul class="pagination">
        <c:if test="${currPage <= 1}">
        <li class="disabled">
          </c:if>
          <c:if test="${currPage > 1}">
        <li class="active">
          </c:if>
          <a href="${pageContext.request.contextPath}/signIn" aria-label="Previous" >
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <%--显示页数--%>
        <c:forEach begin="1" end="${totalPages}" var="num">
          <%--                判断是否为当前页，若是则标记为特殊颜色--%>
          <c:if test="${currPage == num}">
            <li class="active"><a href="${pageContext.request.contextPath}/signIn">${num}</a></li>
          </c:if>
          <c:if test="${currPage != num}">
            <li><a href="${pageContext.request.contextPath}/signIn">${num}</a></li>
          </c:if>
        </c:forEach>

        <%--    根据当前页和总页数的比较 判断是否禁用上一页      --%>
        <c:if test="${currPage>=totalPages}">
        <li class="disabled">
          </c:if>
          <c:if test="${currPage<totalPages}">
        <li class="active">
          </c:if>
          <a href="${pageContext.request.contextPath}/signIn" aria-label="Next" >
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>

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
