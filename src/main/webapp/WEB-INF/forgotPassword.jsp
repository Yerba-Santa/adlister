<%--
  Created by IntelliJ IDEA.
  User: calais
  Date: 9/15/21
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Reset Password" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <jsp:include page="/WEB-INF/partials/messages.jsp" />

    <h1>Reset Password</h1>

    <c:if test="${sessionScope.sucess == null}">
        <form action="/forgotPassword" method="POST">

            <div class="form-group">
                <label for="username">Enter username:</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>

            <div class="form-group">
                <label for="email">Enter email:</label>
                <input id="email" name="email" class="form-control" type="text">
            </div>

           <c:if test="${sessionScope.confirmReset != null}" >
               <div class="form-group">
                   <label for="newPassword">Enter email:</label>
                   <input id="newPassword" name="newPassword" class="form-control" type="password">
               </div>
               <div class="form-group">
                   <label for="confirmNewPassword">Enter username:</label>
                   <input id="confirmNewPassword" name="confirmNewPassword" class="form-control" type="password">
               </div>
           </c:if>
            <input type="submit" class="btn btn-primary btn-block" value="Submit">
        </form>
    </c:if>


    <c:if test="${sessionScope.passwordSuccess != null}">
        <h3>Password Successfully Reset!</h3>
    </c:if>
    <a href="${pageContext.request.contextPath}/login"><p>Return to Login</p></a>
</div>

</body>
</html>

