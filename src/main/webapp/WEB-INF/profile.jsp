<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" href="/main.css">

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container">
        <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
           title="close menu">
            <i class="fa fa-remove"></i>
        </a>
        <br><br>
        <h4 class="users-name"><b>${sessionScope.user.username}</b></h4>
    </div>
    <br>
    <div class="w3-bar-block">
        <i class="fas fa-user fa-5x" id="profile-logo"></i>
        <br>
        <a href="${pageContext.request.contextPath}/user/update" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i
                class="fa fa-th-large fa-fw w3-margin-right"></i>EDIT PROFILE</a>
    </div>
    <div class="w3-panel w3-large">
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
     title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:300px">


    <!-- Header -->
    <header id="portfolio">
        <a href="#"></a>
        <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i
                class="fa fa-bars"></i></span>
        <div class="w3-container">
            <h1><b>Welcome!</b></h1>
        </div>
    </header>

    <!-- First Photo Grid-->
    <div class="w3-row-padding">
        <div class="w3-third w3-container w3-margin-bottom">
        <h2>Here are all your ads:</h2>

            <c:forEach var="ad" items="${ads}">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">${ad.title}</h5>
                        <p>${ad.description}</p>
                        <a href="${pageContext.request.contextPath}/ads/updateads?ad_id=${ad.id}" class="btn btn-sm btn-success">Update</a>
                        <a href="${pageContext.request.contextPath}/ads/delete?ad_id=${ad.id}" class="btn btn-sm btn-danger">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <div class="w3-black w3-center w3-padding-24">Powered by Yerba-Santa</div>

    <!-- End page content -->
</div>


<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
</script>


<%-->>>>>>> main--%>

</body>
</html>
