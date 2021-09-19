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

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>

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
            <i class="fas fa-facebook-official w3-hover-opacity"></i>
            <i class="fas fa-instagram w3-hover-opacity"></i>
            <i class="fas fa-snapchat w3-hover-opacity"></i>
            <i class="fas fa-pinterest-p w3-hover-opacity"></i>
            <i class="fas fa-twitter w3-hover-opacity"></i>
            <i class="fas fa-linkedin w3-hover-opacity"></i>
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

<<<<<<< HEAD
            <c:forEach var="ad" items="${ads}">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">${ad.title}</h5>
                        <p>${ad.description}</p>
                        <a href="${pageContext.request.contextPath}/ads/updateads?ad_id=${ad.id}" class="btn btn-sm btn-success">Update</a>
                        <a href="${pageContext.request.contextPath}/ads/delete?ad_id=${ad.id}" onclick="return confirm('Are you sure you want to delete this item?')" class="btn btn-sm btn-danger">Delete</a>
=======
        <!-- First Photo Grid-->
        <div class="w3-row-padding">
            <div class="display-cards w3-third w3-container margin-auto" style="width: 100%;">
                <h2>Here are all your ads:</h2>
                <c:forEach var="ad" items="${ads}">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">${ad.title}</h5>
                            <p>${ad.description}</p>
                            <a href="${pageContext.request.contextPath}/ads/updateads?ad_id=${ad.id}" class="btn btn-sm btn-success">Update</a>
                            <a href="${pageContext.request.contextPath}/ads/delete?ad_id=${ad.id}" class="btn btn-sm btn-danger"
                               data-toggle="modal" data-target="#exampleModal${ad.id}">Delete</a> <!-- Button trigger modal -->
                        </div>
>>>>>>> main
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="w3-black w3-center w3-padding-24">Powered by Yerba-Santa</div>
    </div>

    <div class="modal fade" id="exampleModal${ad.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirm Action</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to Delete?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <a href="/ads/delete?ad_id=${ad.id}" class="btn btn-danger">Yes</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<<<<<<< HEAD
=======
    <!-- End page content -->

>>>>>>> main
<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";

    function deleteConfirmation() {


    }
    }
</script>

</body>
</html>