<%--
  Created by IntelliJ IDEA.
  User: Пользователь
  Date: 28.06.2019
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>editProduct</title>
</head>
<body>
<c:url value="/userPage" var="var"/>
<form action="${var}" method="post">

    <input type="hidden" name="id" value="${product.id}">
    <input type="hidden" name="name" value="${product.name}">

    <label for="count">Count</label>
    <input type="text" name="count" id="count">

    <input type="submit" value="Add Product">

</form>

</body>
</html>
