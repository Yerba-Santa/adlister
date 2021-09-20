<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<a class="back-button" href="/profile"><i class="fa fa-chevron-left" aria-hidden="true">Back to Profile</i></a>
<div class="container">

    <jsp:include page="/WEB-INF/partials/messages.jsp" />



    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">

        <div class="form-group">
            <label for="title">Title</label>
            <c:if test="${sessionScope.title != null}">
                <input id="title" name="title" class="form-control" type="text" value="${sessionScope.title}">
            </c:if>
            <c:if test="${sessionScope.title == null}">
                <input id="title" name="title" class="form-control" type="text">
            </c:if>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <c:if test="${sessionScope.description != null}">
                <textarea id="description" name="description" class="form-control" type="text" value="${sessionScope.description}"></textarea>
            </c:if>
            <c:if test="${sessionScope.description == null}">
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </c:if>
        </div>

        <div class="select-category form-group">
            <div class="categories">
                <input id="electronics-media" name="electronics-media" type="checkbox">
                <label for="electronics-media">Electronics/Media</label>

                <input id="clothing" name="clothing" type="checkbox">
                <label for="clothing">Clothing</label>

                <input id="vehicles" name="vehicles" type="checkbox">
                <label for="vehicles">Vehicles</label>

                <input id="sporting-goods" name="sporting-goods" type="checkbox">
                <label for="sporting-goods">Sporting Goods/Outdoors</label>

                <input id="pets" name="pets" type="checkbox">
                <label for="pets">Pets</label>
            </div>
            <input type="submit" class="btn btn-block btn-dark">
            <input type="hidden" name="redirect" value="${redirect}">
        </div>
    </form>
</div>
</body>
</html>
