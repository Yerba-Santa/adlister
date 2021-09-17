<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <link rel="stylesheet" href="/main.css">
</head>

<%--WHEN LOGGED IN--%>
<c:if test="${sessionScope.user != null}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">ADLISTER</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarLoggedInContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/ads/create"><i class="fas fa-plus-circle">Create New Ad</i></a>
                </li>
                <li>
                    <a class="nav-link" href="/logout"><i class="fas fa-sign-out">Logout</i></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarLoggedInDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        View Ads
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/ads">All</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Electronics & Media</a>
                        <a class="dropdown-item" href="#">Clothing</a>
                        <a class="dropdown-item" href="#">Pets</a>
                        <a class="dropdown-item" href="#">Sporting Goods & Outdoors</a>
                        <a class="dropdown-item" href="#">Vehicles</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</c:if>

<%--WHEN USER IS NOT LOGGED IN --%>
<c:if test="${sessionScope.user == null}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">Adlister</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNotLoggedInContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/login"><i class="fas fa-user">Login</i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register"><i class="fas fa-user-plus">Register</i></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarLoggedOutDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        View Ads
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/ads">All</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Electronics & Media</a>
                        <a class="dropdown-item" href="#">Clothing</a>
                        <a class="dropdown-item" href="#">Pets</a>
                        <a class="dropdown-item" href="#">Sporting Goods & Outdoors</a>
                        <a class="dropdown-item" href="#">Vehicles</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</c:if>

<%--SEARCH DROPDOWN MENU FOR /ADS PAGE--%>
<%--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--    Dropdown--%>
<%--</a>--%>