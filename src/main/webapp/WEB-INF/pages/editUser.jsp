
<%--
  Created by IntelliJ IDEA.
  User: Пользователь
  Date: 25.06.2019
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <c:if test="${empty user.name}">
        <title>Add</title>
    </c:if>

    <c:if test="${!empty user.name}">
        <title>Edit</title>
    </c:if>

    <style>
        <%@include file="style.css"%>
    </style>

</head>
<body>

<header>
    <div class="top_bar"></div>

    <div class="welcome">
        <h1>Hello Norway</h1>
        <a href="#"><img src="${pageContext.request.contextPath}\ROOT\welcome.jpg" alt="Norway1" width="600" height="250"/></a> <br>

    </div>

    <nav>
        <ul class="menu">
            <li><a href="\">quit</a> </li>
        </ul>
    </nav>

</header>

<h2 class="user">
    Do you want to upgrade?
</h2>

<section class="reg">

<c:if test="${empty user.name}">
    <c:url value="/add" var="var"/>
</c:if>

<c:if test="${!empty user.name}">
    <c:url value="/edit" var="var"/>
</c:if>


<form action="${var}" method="post">
    <c:if test="${!empty user.name}">
        <input type="hidden" name="id" value="${user.id}">
    </c:if>

    <label for="name">Name</label>
    <input type="text" name="name" id="name">

    <label for="password">Password</label>
    <input type="text" name="password" id="password">

    <c:if test="${empty user.name}">
        <input type="submit" value="Add new user">
    </c:if>

    <c:if test="${!empty user.name}">
        <input type="submit" value="Edit user">
    </c:if>

</form>


</section>

</body>
</html>
