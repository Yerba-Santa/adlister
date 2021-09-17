<%--
  Created by IntelliJ IDEA.
  User: calais
  Date: 9/15/21
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
<<<<<<< HEAD
  .closebtn {
    color: black;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.1s;
  }
  .closebtn:hover {
    color: white;
  }
</style>

<c:choose>
  <c:when test="${errorMessage == 'PasswordIncorrect'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Password Incorrect</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'UserNull'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Username does not exist</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'UsernameEmpty'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Username can't be empty</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'EmailEmpty'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Email can't be empty</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'PasswordEmpty'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Password can't be empty</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'MatchPassword'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Passwords don't match</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'MatchPassword'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Passwords don't match</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'UsernameDuplicate'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Username already exists. Please select a different one</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'EmailDuplicate'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! An account with this email already exists</strong>
      <p><a href="${pageContext.request.contextPath}/login">Login</a></p>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'EmailInvalid'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Please enter a valid email address</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'PasswordInvalid'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Password must meet the following requirements:
        <ul>
          <li>Must be between 5 and 15 characters</li>
          <li>Must contain at least one digit, one lower case character, one special character and one upper case character</li>
          <li>Cannot contain whitespace/spaces</li>
        </ul>
      </strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'TitleNull'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Title cannot be empty</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'DescriptionNull'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! Description cannot be empty</strong>
    </div>
  </c:when>

  <c:when test="${errorMessage == 'UsernameEmailConflict'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! No account is associated with this email</strong>
    </div>
  </c:when>


  <c:when test="${errorMessage == 'EmailUsernameConflict'}">
    <div class="alert alert-danger">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <strong>Error! No account found with this email and username</strong>
    </div>
  </c:when>

  <c:otherwise></c:otherwise>

</c:choose>
    .closebtn {
        color: black;
        font-weight: bold;
        float: right;
        font-size: 22px;
        line-height: 20px;
        cursor: pointer;
        transition: 0.1s;
    }

    .closebtn:hover {
        color: white;
    }
</style>

<c:choose>
    <c:when test="${errorMessage == 'PasswordIncorrect'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Password Incorrect</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'UserNull'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Username does not exist</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'UsernameEmpty'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Username can't be empty</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'EmailEmpty'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Email can't be empty</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'PasswordEmpty'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Password can't be empty</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'MatchPassword'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Passwords don't match</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'MatchPassword'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Passwords don't match</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'UsernameDuplicate'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Username already exists. Please select a different one</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'EmailDuplicate'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! An account with this email already exists</strong>
            <p><a href="${pageContext.request.contextPath}/login">Login</a></p>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'EmailInvalid'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Please enter a valid email address</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'PasswordInvalid'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Password must meet the following requirements:
            <ul>
                <li>Must be between 5 and 15 characters</li>
                <li>Must contain at least one digit, one lower case character, one special character and one upper case character</li>
                <li>Cannot contain whitespace/spaces</li>
            </ul>
            </strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'TitleNull'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Title cannot be empty</strong>
        </div>
    </c:when>

    <c:when test="${errorMessage == 'DescriptionNull'}">
        <div class="alert alert-danger">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Error! Description cannot be empty</strong>
        </div>
    </c:when>
    <c:otherwise></c:otherwise>

</c:choose>
