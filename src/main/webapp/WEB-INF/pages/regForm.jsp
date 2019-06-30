<%--
  Created by IntelliJ IDEA.
  User: Пользователь
  Date: 28.06.2019
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Registration</title>
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
            <li><a href="\">home</a> </li>
        </ul>
    </nav>

</header>


<h2 class="user">
    Hello New User
</h2>



    <section class="reg">
    <form method="post" action="">

        <input text="text" required placeholder="login" name="login"><br><br>
        <input type="password" required placeholder="password" name="password"><br><br>
        <input class="button" type="submit" value="Registration">

    </form>

    </section>



</body>
</html>
