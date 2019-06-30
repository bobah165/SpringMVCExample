<%--
  Created by IntelliJ IDEA.
  User: Пользователь
  Date: 26.06.2019
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CurrentUser</title>

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
            <li><a href="/edit/${currentUser.id}">upgrade user</a> </li>
            <li><a href="/delete/${currentUser.id}">delete usesr</a> </li>
            <li><a href="/">Quit</a> </li>
        </ul>
    </nav>

</header>

<h2 class="user"> Hello ${currentUser.name} </h2>


<%--<a href="/edit/${currentUser.id}">edit</a>--%>
<%--<a href="/delete/${currentUser.id}">delete</a>--%>


<h2> Choose Products </h2>
<br><br><br>

<section class="product">

<table>
    <tr>
        <th>id</th>
        <th>Name</th>
        <th>Count</th>
        <th>Reference</th>

    </tr>
    <c:forEach var="product" items="${prodList}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.count}</td>
            <td>
                <a href="/userPage/${product.id}">add</a>
            </td>

        </tr>
    </c:forEach>
</table>
</section>

</body>
</html>
