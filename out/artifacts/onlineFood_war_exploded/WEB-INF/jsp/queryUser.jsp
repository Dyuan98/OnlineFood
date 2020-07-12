<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表界面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jQuery_3.5.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        td, th{
            text-align: center;
        }

    </style>
</head>
<body background = "${pageContext.request.contextPath}/statics/img/food03.jpg">

<div class="container">

    <%-- 顶部主题   --%>
    <div class="row clearfix" style="margin: auto">
        <div class="col-md-12 column">
            <div class="page-header" style="text-align: center">
                <h1>
                    <strong>所有用户信息</strong>
                </h1>
            </div>
        </div>
    </div>

    <%--搜索框        --%>
    <form  action="${pageContext.request.contextPath}/likeQuery" method="post" class="navbar-form navbar-left " role="search" >
        <div class="form-group ">
            <input type="text" class="form-control" name="name" placeholder="昵称">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="phone" placeholder="电话号码">
        </div>
        <div class="form-group">
            <input type="text" class="form-control"  name="address" placeholder="地址">
        </div>
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="currPage" value="${currPage}">
        <button type="submit" class="btn btn-info">查询</button>
    </form>

    <%-- 表单   --%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped table table-bordered">
                <thead>
                <tr>
                    <th>用户昵称</th>
                    <th>用户密码</th>
                    <th>用户电话</th>
                    <th>用户地址</th>
                    <th>删除用户</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${requestScope.get('users')}">
                    <tr>
                        <td class="active">${user.getName()}</td>
                        <td class="success">${user.getPwd()}</td>
                        <td class="warning">${user.getPhone()}</td>
                        <td class="danger">${user.getAddress()}</td>
                        <td class="info">
                            <a href="${pageContext.request.contextPath}/del/${user.getId()}/${pageSize}/${currPage}">
                                <button type="button" class="btn btn-danger" style="font-size: 3px">DELETE</button>
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
<%--            <a href="${pageContext.request.contextPath}/user/${currPage-1}/${pageSize}" aria-label="Previous" >--%>
                <a href="http://www.baidu.com" class="a_post">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
        </li>

        <c:forEach begin="1" end="${totalPages}" var="num">
            <c:if test="${currPage == num}">
                <li class="active"><a href="${pageContext.request.contextPath}/user/${num}/${pageSize}">${num}</a></li>
            </c:if>
            <c:if test="${currPage != num}">
                <li ><a href="${pageContext.request.contextPath}/user/${num}/${pageSize}">${num}</a></li>
            </c:if>
        </c:forEach>

        <c:if test="${currPage>=totalPages}">
        <li class="disabled">
            </c:if>
            <c:if test="${currPage<totalPages}">
        <li class="active">
            </c:if>
            <a href="${pageContext.request.contextPath}/user/${currPage+1}/${pageSize}" aria-label="Next" >
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>


    </ul>
</nav>
</body>
</html>
