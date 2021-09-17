<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">

        <jsp:include page="/WEB-INF/partials/messages.jsp" />

        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <a href="${pageContext.request.contextPath}/forgotUsername"><p>Forgot username?</p></a>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <a href="${pageContext.request.contextPath}/forgotPassword"><p>Forgot password?</p></a>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
            <input type="hidden" name="redirect" value="${redirect}">
        </form>

        <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Create an Account!</a></p>
    </div>
</body>
</html>
