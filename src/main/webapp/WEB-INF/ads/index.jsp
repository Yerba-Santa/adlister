<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <div class="display-cards w3-third w3-container margin-auto" style="width: 100%;">
        <h2>Here are all your ads:</h2>
        <c:forEach var="ad" items="${ads}">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">${ad.title}</h5>
                    <p>${ad.description}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
