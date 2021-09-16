<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<c:if test="${sessionScope.user == null}">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Adlister</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><i class="fas fa-user"><!--something--></i></li>
                <li><a href="/login">Login</a></li>
                <li><i class="fas fa-user-plus"><!--something--></i></li>
                <li><a href="/register">Register</a></li>
<%--                <li>--%>
<%--                    <form action="/ads/search" METHOD="POST">--%>
<%--                        <input id="keyword" name="keyword" class="form-control" type="text">--%>
<%--                        <button type="submit" class="btn btn-primary btn-block" value="Search">Search</button>--%>
<%--                    </form>--%>
<%--                </li>--%>
            </ul>
        </div>
    </nav>
</c:if>
<c:if test="${sessionScope.user != null}">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Adlister</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                    <%--                        <li><a href="/login">Login</a></li>--%>
                <li><a href="/logout">Logout</a></li>
                    <%--                        <li><a href="/register">Register</a></li>--%>
                <li><a href="/ads/create">Create Ad</a></li>
                <li>
                    <form action="/ads/search" METHOD="POST">
                        <input id="title" name="keyword" class="form-control" type="text">
                        <button type="submit" class="btn btn-primary btn-block" value="Search">Search</button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>
</c:if>


