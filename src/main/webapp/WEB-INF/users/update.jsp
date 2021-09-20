<%--
  Created by IntelliJ IDEA.
  User: hermanator55
  Date: 9/15/21
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Edit Profile"/>
        </jsp:include>
        <link rel="stylesheet" href="/main.css">
    </head>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<a class="back-button" href="/profile"><i class="fa fa-chevron-left" aria-hidden="true">Back to Profile</i></a>
<div class="container">
    <h1 class="display-4"> Update your Profile</h1>

    <jsp:include page="/WEB-INF/partials/messages.jsp"/>
    <form action="/user/update" method="post">
        <form>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" value="${email}">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Username</label>
                <input type="text" name="username" class="form-control" id="exampleInputPassword1" value="${username}">
            </div>
            <button type="submit" class="btn btn-block btn-dark">Submit</button>
        </form>
    </form>
</div>

</body>
</html>
