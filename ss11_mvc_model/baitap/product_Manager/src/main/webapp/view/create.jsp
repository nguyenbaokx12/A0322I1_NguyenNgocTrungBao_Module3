<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 23/11/2022
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới</h1>
<a href="/product">Quay lại trang list</a>
<c:if test="${mess != null}">
    <p style="color: red">${mess}</p>
</c:if>
<form action="/product?action=create" method="post">
    <pre>ID:           <input type="text" name="id"/></pre>
    <pre>Name:         <input type="text" name="name"> </pre>
    <pre>Price :       <input type="text" name="price">
    <pre>Manufacturer: <input type="text" name="manufacturer"> </pre>
    <pre>GranteeByYear:<input type="text" name="granteeByYear"> </pre>
    <pre>      <button>Save</button></pre>
</form>
</body>
</html>
