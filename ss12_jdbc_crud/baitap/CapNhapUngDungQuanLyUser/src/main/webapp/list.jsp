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

        .add {
            padding: 10px;
            margin-top: 20px;
            background-color: blue;
            color: white;
            text-decoration: none;
        }
        .add:hover{
            color: chartreuse;
        }

        .edit{
            text-decoration: none;
            background-color: blue;
            color: white;
            padding: 10px;
            border-radius: 10px;

        }

        .edit:hover{
            color: chartreuse;

        }

        .delete{
            text-decoration: none;
            background-color: red;
            color: white;
            padding: 10px;
            border-radius: 10px;
        }

        .delete:hover{
            color: chartreuse;
        }

        .sub>th{
            padding-right: 100px;
            border-bottom: 1px solid black;
            padding-top: 30px;

        }

        .sub-s>td{
            padding-right: 100px;
            padding-bottom: 30px;
            padding-top: 30px;
            border-bottom: 1px solid black;
        }
    </style>
</head>
<body>
<p>
    <a class="add" href="/User?action=create">Add new user</a>
</p>
<p>
<form action="/User" method="post">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="country" name="country">
    <input type="submit" value="Search">
</form>
</p>
<table cellspacing="0">
    <tr class="sub">
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="user" items="${listUser}" varStatus="varStatus">
        <tr class="sub-s">
            <td>${varStatus.count}</td>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a class="edit" href="/User?action=update&id=${user.id}">Edit</a></td>
            <td><a class="delete" href="/User?action=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
