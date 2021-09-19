<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
<%--<jsp:include page="/WEB-INF/partials/navbar.jsp"/>--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand ml-auto" href="/">Adlister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/login"><i class="fas fa-user">Login</i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/register"><i class="fas fa-user-plus">Register</i></a>
            </li>
            <%--            <li class="nav-item dropdown">--%>
            <%--                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"--%>
            <%--                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--                    View Ads--%>
            <%--                </a>--%>
            <%--                <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
            <%--                    <a class="dropdown-item" href="/ads">All</a>--%>
            <%--                    <div class="dropdown-divider"></div>--%>
            <%--                    <a class="dropdown-item" href="#">Electronics & Media</a>--%>
            <%--                    <a class="dropdown-item" href="#">Clothing</a>--%>
            <%--                    <a class="dropdown-item" href="#">Pets</a>--%>
            <%--                    <a class="dropdown-item" href="#">Sporting Goods & Outdoors</a>--%>
            <%--                    <a class="dropdown-item" href="#">Vehicles</a>--%>
            <%--                </div>--%>
            <%--            </li>--%>
        </ul>
    </div>
</nav>
<div class="container">

    <div class="jumbotron jumbotron-fluid">
        <div class="jumbo-container">
            <h1 class="display-4">Welcome to the Adlister</h1>
            <p class="lead">TESTING</p>
        </div>
    </div>


    <div class="search-bar">
        <form action="/ads/search" METHOD="POST">
            <input id="keyword" name="keyword" class="form-control" type="text" placeholder="What are you looking for?">
            <button type="submit" class="btn btn-dark btn-block" value="Search">Search</button>
        </form>
    </div>

    <div>
        <br>
        <br>
    </div>

    <div class="jumbotron jumbotron-fluid">
        <div class="categories-container" id="categories-header">
            <h3>SEARCH </h3>
            <h3><i class="fa fa-hashtag" aria-hidden="true">CATEGORIES</i></h3>
            <div class="category">
                <span class="align-baseline w3-tag w3-grey w3-margin-bottom w3-margin-left"><a href="${pageContext.request.contextPath}/ads/category?category=Electronics">Electronics & Media</a></span><span
                    class="align-top w3-tag w3-grey w3-margin-bottom"><a href="${pageContext.request.contextPath}/ads/category?category=Clothing">Clothing</a></span>
                <span class="align-bottom w3-tag w3-grey w3-margin-bottom"><a href="${pageContext.request.contextPath}/ads/category?category=Pets">Pets</a></span><span
                    class="align-top w3-tag w3-grey w3-margin-bottom"><a href="${pageContext.request.contextPath}/ads/category?category=Sporting">Sporting Goods & Outdoors</a></span>
                <span class="align-baseline w3-tag w3-grey w3-margin-bottom"><a href="${pageContext.request.contextPath}/ads/category?category=Vehicles">Vehicles</a></span>
            </div>
        </div>
    </div>

    <footer class="w3-container w3-padding-32 w3-dark-grey">
        <div class="w3-black w3-center w3-padding-24">Powered by Yerba-Santa</div>
        <%--            <div class="w3-third">--%>
        <%--                <h3>BLOG POSTS</h3>--%>
        <%--                <ul class="w3-ul w3-hoverable">--%>
        <%--                    <li class="w3-padding-16">--%>
        <%--                        <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">--%>
        <%--                        <span class="w3-large">Lorem</span><br>--%>
        <%--                        <span>Sed mattis nunc</span>--%>
        <%--                    </li>--%>
        <%--                    <li class="w3-padding-16">--%>
        <%--                        <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">--%>
        <%--                        <span class="w3-large">Ipsum</span><br>--%>
        <%--                        <span>Praes tinci sed</span>--%>
        <%--                    </li>--%>
        <%--                </ul>--%>
        <%--            </div>--%>

</div>
</footer>

</div>
</body>
</html>
