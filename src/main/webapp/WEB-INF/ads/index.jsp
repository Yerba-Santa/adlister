<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<c:if test="${sessionScope.user != null}">
    <a class="back-button" href="/profile"><i class="fa fa-chevron-left" aria-hidden="true">Back to Profile</i></a>
</c:if>

<div class="categories-container" id="categories-header">
    <h3 class="display-4">View by Category</h3>
    <div class="category">
        <span class="align-baseline w3-tag w3-grey w3-margin-bottom w3-margin-left"><a
                href="${pageContext.request.contextPath}/ads/category?category=Electronics">Electronics & Media</a></span><span
            class="align-top w3-tag w3-grey w3-margin-bottom"><a
            href="${pageContext.request.contextPath}/ads/category?category=Clothing">Clothing</a></span>
        <span class="align-bottom w3-tag w3-grey w3-margin-bottom"><a
                href="${pageContext.request.contextPath}/ads/category?category=Pets">Pets</a></span>
        <span class="align-baseline w3-tag w3-grey w3-margin-bottom"><a
                href="${pageContext.request.contextPath}/ads/category?category=Vehicles">Vehicles</a></span>
        <span class="align-top w3-tag w3-grey w3-margin-bottom"><a
                href="${pageContext.request.contextPath}/ads/category?category=Sporting">Sporting Goods & Outdoors</a></span>
    </div>
</div>
<p><hr></p>
<div class="container">

    <div class="display-cards w3-third w3-container margin-auto" style="width: 100%;">
        <c:forEach var="ad" items="${ads}">
            <div class="card" style="width: 18rem; margin: auto">
                <div class="card-body">
                    <h5 class="card-title"><a
                            href="${pageContext.request.contextPath}/ads/show?id=${ad.id}">${ad.title}</a></h5>
                    <p>${ad.description}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>




</body>
</html>
