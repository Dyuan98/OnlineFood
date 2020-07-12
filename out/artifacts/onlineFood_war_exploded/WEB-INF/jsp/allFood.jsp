<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表界面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jQuery_3.5.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--    文字居中--%>
    <style>
        td, th{
            text-align: center;
        }
    </style>
    <%--    隐藏底部滚动条--%>
    <style type="text/css">
        body {
            overflow-x: hidden;
        }
    </style>
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

<div class="container">

    <%-- 顶部主题   --%>
    <div class="row clearfix" style="margin: auto">
        <div class="col-md-12 column">
            <div class="page-header" style="text-align: center">
                <h1>
                    <strong>所有食品信息</strong>
                </h1>
            </div>
        </div>
    </div>

    <%--  模糊查询     --%>
    <form  action="/food/1/5" method="get" class="navbar-form navbar-left " role="search"  >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="form-group ">
            <input type="text" class="form-control" name="fname" placeholder="食品名称查询" value="${foodCache.getFname()}">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="ftype" placeholder="食品类型查询" value="${foodCache.getFtype()}">
        </div>
        <div class="form-group">
            <input type="text" class="form-control"  name="introduce" placeholder="简要信息查询" value="${foodCache.getIntroduce()}">
        </div>
        <%--    后续展示由于页面大小不够没有展示的符合条件的对象需要用到，此处隐式提交    --%>
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="currPage" value="${currPage}">
        <button type="submit" class="btn btn-info">查询</button>
    </form>

    <%-- 表单   --%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped table table-bordered">
                <%--                表单头部--%>
                <thead>
                <tr>
                    <th>食品名称</th>
                    <th>食品类型</th>
                    <th>食品数量</th>
                    <th>食品价格</th>
                    <th>食品简介</th>
                    <th>食品图片</th>
                    <th>删除食品</th>
                    <th>修改食品</th>
                </tr>
                </thead>
                <tbody>
                <%--   根据controller传来的user对象列表，将所有信息显式地展现在页面上             --%>
                <c:forEach var="food" items="${requestScope.get('foods')}">
                    <tr>
                        <td width="100" class="active">${food.getFname()}</td>
                        <td width="100" class="success">${food.getFtype()}</td>
                        <td width="100" class="info">${food.getFaccount()}</td>
                        <td width="100" class="warning">${food.getPrice()}</td>
                        <td width="500" class="danger">${food.getIntroduce()}</td>
                        <td width="100" class="active">${food.getImgUrl()}</td>
                        <td width="100" class="info">
                            <a href="${pageContext.request.contextPath}/delFood/${food.getFid()}/${pageSize}/${currPage}">
                                <button type="button" class="btn btn-danger" style="font-size: 3px">DELETE</button>
                            </a>
                        </td>
                        <td width="100" class="success">
                            <a href="${pageContext.request.contextPath}/toModifyFood/${food.getFid()}/${pageSize}/${currPage}">
                                <button type="button" class="btn btn-Info" style="font-size: 3px">MODIFY</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%-- 分页--%>
<nav aria-label="Page navigation">
    <div class="col-sm-8"></div>
    <ul class="pagination">
        <c:if test="${currPage <= 1}">
        <li class="disabled">
            </c:if>
            <c:if test="${currPage > 1}">
        <li class="active">
            </c:if>
            <a href="${pageContext.request.contextPath}/food/${currPage-1}/${pageSize}?fname=${foodCache.getFname()}&ftype=${foodCache.getFtype()}&introduce=${foodCache.getIntroduce()}" aria-label="Previous" >
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <%--显示页数--%>
        <c:forEach begin="1" end="${totalPages}" var="num">
            <%--                判断是否为当前页，若是则标记为特殊颜色--%>
            <c:if test="${currPage == num}">
                <li class="active"><a href="${pageContext.request.contextPath}/food/${num}/${pageSize}?fname=${foodCache.getFname()}&ftype=${foodCache.getFtype()}&introduce=${foodCache.getIntroduce()}">${num}</a></li>
            </c:if>
            <c:if test="${currPage != num}">
                <li><a href="${pageContext.request.contextPath}/food/${num}/${pageSize}?fname=${foodCache.getFname()}&ftype=${foodCache.getFtype()}&introduce=${foodCache.getIntroduce()}">${num}</a></li>
            </c:if>
        </c:forEach>

        <%--    根据当前页和总页数的比较 判断是否禁用上一页      --%>
        <c:if test="${currPage>=totalPages}">
        <li class="disabled">
            </c:if>
            <c:if test="${currPage<totalPages}">
        <li class="active">
            </c:if>
            <a href="${pageContext.request.contextPath}/food/${currPage+1}/${pageSize}?fname=${foodCache.getFname()}&ftype=${foodCache.getFtype()}&introduce=${foodCache.getIntroduce()}" aria-label="Next" >
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

</body>
</html>
