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
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">

    <div class="jumbotron jumbotron-fluid">
        <div class="jumbo-container">
            <h1 class="display-4">Welcome to the Adlister</h1>
        </div>
    </div>


    <div class="search-bar">
        <form action="/ads/search" METHOD="POST">
            <input id="keyword" name="keyword" class="form-control" type="text" placeholder="What are you looking for?">
            <button type="submit" class="home-search-bar btn btn-dark btn-block" value="Search">Search</button>
        </form>
    </div>

    <div>
        <br>
        <br>
    </div>

    <div class="jumbotron jumbotron-fluid">
        <div class="categories-container" id="categories-header">
            <h3 class="categories-header"><i class="fa fa-hashtag" aria-hidden="true">CATEGORIES</i></h3>
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
        <div class="yerba-power w3-black w3-center w3-padding-24">Powered by Yerba-Santa</div>
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
