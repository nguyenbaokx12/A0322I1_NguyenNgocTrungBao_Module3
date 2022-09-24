<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 21/09/2022
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<p>
    <a href="/User">Return the list</a>
</p>
<form method="post">
    <p>Name</p>
    <input type="text" value="${user.name}" name="name">
    <p>Email</p>
    <input type="email" value="${user.email}" name="email">
    <p>Country</p>
    <input type="text" value="${user.country}" name="country">
    <input type="submit" value="Cập Nhật">
</form>
</body>
</html>
