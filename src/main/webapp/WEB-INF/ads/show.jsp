<%--
  Created by IntelliJ IDEA.
  User: calais
  Date: 9/13/21
  Time: 7:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad Info" />
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <h1>${ad.title}</h1>
    <p>${ad.description}</p>

    <h2>Contact Information:</h2>
    <a href="${pageContext.request.contextPath}/profile"><h3>User: ${user.username}</h3></a><%--Link to profile page - CG--%>
    <h4>Email: ${user.email}</h4>

</body>
</html>
