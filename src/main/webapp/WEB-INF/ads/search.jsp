<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Here Are Your Search Results, ${sessionScope.user.username}!</h1>

    <c:forEach var="ad" items="${ads}">
    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title">${ad.title}</h5>
            <p>${ad.description}</p>
        </div>
    </div>
    </c:forEach>

</body>
</html>
