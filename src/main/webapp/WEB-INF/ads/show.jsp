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
        <jsp:param name="title" value="Ad Info"/>
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<a class="back-button" href="/ads"><i class="fa fa-chevron-left" aria-hidden="true">Back to Ads</i></a>

<div class="display-cards">
    <div class="card" style="width: 18rem;">
        <h3>${ad.title}</h3>
        <h4>${ad.description}</h4>
        <br>
        <h4>Contact Information:</h4>
        <h5>User: ${user.username}</h5><%--Link to profile page - CG--%>
        <h5>Email: ${user.email}</h5>
    </div>
</div>


</body>
</html>


<%--<p>${ad.description}</p>--%>

<%--<h2>Contact Information:</h2>--%>
<%--<a href="${pageContext.request.contextPath}/profile"><h3>User: ${user.username}</h3></a>&lt;%&ndash;Link to profile page - CG&ndash;%&gt;--%>
<%--<h4>Email: ${user.email}</h4>--%>