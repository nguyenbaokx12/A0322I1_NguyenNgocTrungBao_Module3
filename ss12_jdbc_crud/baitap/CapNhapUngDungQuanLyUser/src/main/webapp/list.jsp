<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 21/09/2022
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>
        html {
            font-family: 'DM Sans', sans-serif;
        }
    </style>
</head>
<body>
<p>
    <a href="/User?action=create">Add new user</a>
</p>
<p>
<form action="/User" method="post">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="country" name="country">
    <input type="submit" value="Search">
</form>
</p>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/User?action=update&id=${user.id}">Edit</a></td>
            <td><a href="/User?action=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
