<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>

        <div class="form-group">


            <div class="categories">

                <label for="electronics-media">Electronics/Media</label>
                <input id="electronics-media" name="electronics-media" type="checkbox">

                <label for="clothing">Clothing</label>
                <input id="clothing" name="clothing" type="checkbox">

                <label for="vehicles">Vehicles</label>
                <input id="vehicles" name="vehicles" type="checkbox">

                <label for="sporting-goods">Sporting Goods/Outdoors</label>
                <input id="sporting-goods" name="sporting-goods" type="checkbox">

                <label for="pets">Pets</label>
                <input id="pets" name="pets" type="checkbox">

            </div>
            <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
