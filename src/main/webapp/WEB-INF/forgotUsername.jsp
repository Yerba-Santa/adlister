<%--
  Created by IntelliJ IDEA.
  User: calais
  Date: 9/15/21
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Recover Username" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">

        <jsp:include page="/WEB-INF/partials/messages.jsp" />

        <h1>Recover Username</h1>
        <c:if test="${sessionScope.username == null}">
            <form action="/forgotUsername" method="POST">
                <div class="form-group">
                    <label for="email">Enter email:</label>
                    <input id="email" name="email" class="form-control" type="text">
                </div>
                <input type="submit" class="btn btn-primary btn-block" value="Submit">
            </form>
        </c:if>

        <c:if test="${sessionScope.username != null}">
            <h3>Your username is: ${sessionScope.username}</h3>
        </c:if>

        <a href="${pageContext.request.contextPath}/login"><p>Return to Login</p></a>
    </div>

</body>
</html>
