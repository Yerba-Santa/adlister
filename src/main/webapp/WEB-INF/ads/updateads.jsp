<%--
  Created by IntelliJ IDEA.
  User: hermanator55
  Date: 9/15/21
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Update your Ad</h1>
    <form action="/ads/updateads" method="post">
        <div class="form-group">
            <label for="updateTitle">Title</label>
            <input id="updateTitle" name="updateTitle" class="form-control" type="text" value="${title}">
            <input type="hidden" name="ad_id" value="${ad_id}">
        </div>
        <div class="form-group">
            <label for="updateDescription">Description</label>
            <textarea id="updateDescription" name="updateDescription" class="form-control" type="text">${description}</textarea>
        </div>
        <input type="submit" class="btn btn-block btn-dark">
    </form>
</div>

</body>
</html>
