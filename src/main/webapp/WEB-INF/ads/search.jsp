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
    <h1 class="display-4">Here Are Your Search Results:</h1>

    <c:if test="${ads != null}">
        <c:forEach var="ad" items="${ads}">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title"><a href="${pageContext.request.contextPath}/ads/show?id=${ad.id}">${ad.title}</a></h5>
                <p>${ad.description}</p>
            </div>
        </div>
        </c:forEach>
    </c:if>

    <c:if test="${ads.isEmpty()}">
        <h3>No Search Results Found</h3>
    </c:if>

    <a href="${pageContext.request.contextPath}/ads">Return to all ads</a>

</body>
</html>
