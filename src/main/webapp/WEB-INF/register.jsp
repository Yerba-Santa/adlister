<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">

        <jsp:include page="/WEB-INF/partials/messages.jsp" />

        <h1 class="display-4">Registration:</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <c:if test="${sessionScope.username != null}">
                    <input id="username" name="username" class="form-control" type="text" value="${sessionScope.username}">
                </c:if>
                <c:if test="${sessionScope.username == null}">
                    <input id="username" name="username" class="form-control" type="text">
                </c:if>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <c:if test="${sessionScope.email != null}">
                    <input id="email" name="email" class="form-control" type="text" value="${sessionScope.email}">
                </c:if>
                <c:if test="${sessionScope.email == null}">
                    <input id="email" name="email" class="form-control" type="text">
                </c:if>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-dark btn-block">
        </form>

        <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login now!</a></p>
    </div>
</body>
</html>
