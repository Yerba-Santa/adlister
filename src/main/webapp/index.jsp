<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Raleway", sans-serif
        }
    </style>
</head>
<body>
<%--<jsp:include page="/WEB-INF/partials/navbar.jsp"/>--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/login">Login</a></li>
            <%--                    <li><a href="/logout">Logout</a></li>--%>
            <li><a href="/register">Register</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>
<div class="container">

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Welcome to the Adlister</h1>
            <p class="lead">TESTING</p>
        </div>
    </div>


    <div class="search-bar">
        <form action="/ads/search" METHOD="POST">
            <input id="keyword" name="keyword" class="form-control" type="text" placeholder="What are you looking for?">
            <button type="submit" class="btn btn-primary btn-block" value="Search">Search</button>
        </form>
    </div>

    <div>
        <br>
        <br>
    </div>

    <footer class="w3-container w3-padding-32 w3-dark-grey">
        <div class="w3-row-padding">
            <div class="w3-third">
                <h3>FOOTER</h3>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                <p>Powered by Yerba Santa</p>
            </div>


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

            <div class="w3-third">
                <h3>CATEGORIES</h3>
                <p>
                    <span class="w3-tag w3-black w3-margin-bottom">Electronics & Media</span><span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span>
                    <span class="w3-tag w3-grey w3-small w3-margin-bottom">Pets</span><span class="w3-tag w3-grey w3-small w3-margin-bottom">Sporting Goods & Outdoors</span>
                    <span class="w3-tag w3-grey w3-small w3-margin-bottom">Vehicles</span>
                </p>
            </div>

        </div>
    </footer>

</div>
</body>
</html>
