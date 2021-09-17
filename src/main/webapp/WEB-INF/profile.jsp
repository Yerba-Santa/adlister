<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/main.css">
    <style>
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Raleway", sans-serif
        }
    </style>
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
        <h4><b>${sessionScope.user.username}</b></h4>
    </div>
    <div class="w3-bar-block">
        <i class="fas fa-user fa-5x" id="profile-logo"></i>
        <br>
        <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i
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
            <%--                <div class="w3-section w3-bottombar w3-padding-16">--%>
            <%--                    <span class="w3-margin-right">Filter:</span>--%>
            <%--                    <button class="w3-button w3-black">ALL</button>--%>
            <%--                    <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>--%>
            <%--                    <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>--%>
            <%--                    <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>--%>
            <%--                </div>--%>
        </div>
    </header>

    <!-- First Photo Grid-->
    <div class="w3-row-padding">
        <div class="w3-third w3-container w3-margin-bottom">


            <c:forEach var="ad" items="${ads}">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">

                        <h5 class="card-title">${ad.title}</h5>
                            <%--                    <h6 class="card-subtitle mb-2 text-muted">${categories.title}</h6>--%>
                        <p>${ad.description}</p>
                        <a href="/ads/updateads?ad_id=${ad.id}" class="btn btn-success">Update</a>
                        <a href="/ads/delete?ad_id=${ad.id}" class="btn btn-danger">Delete</a>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer class="w3-container w3-padding-32 w3-dark-grey">
        <div class="w3-row-padding">
            <div class="w3-third">
                <h3>FOOTER</h3>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae,
                    ultricies
                    congue gravida diam non fringilla.</p>
                <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
            </div>

            <div class="w3-third">
                <h3>BLOG POSTS</h3>
                <ul class="w3-ul w3-hoverable">
                    <li class="w3-padding-16">
                        <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
                        <span class="w3-large">Lorem</span><br>
                        <span>Sed mattis nunc</span>
                    </li>
                    <li class="w3-padding-16">
                        <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
                        <span class="w3-large">Ipsum</span><br>
                        <span>Praes tinci sed</span>
                    </li>
                </ul>
            </div>
        </div>
    </footer>

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
