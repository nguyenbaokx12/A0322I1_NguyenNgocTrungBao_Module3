<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style>
    html {
    box-sizing: border-box;
    font-size: 16px;
    font-family: Arial;
}
* {
    margin: 0;
    padding: 0;
    box-sizing: inherit;
}
h2{
    text-align: center;
}
table {
    width: 50%;
    margin: 30px auto 0 auto;
    border-collapse: collapse;
}
th, td {
    border-bottom: 1px solid black;
    text-align: left;
}
table {
    box-shadow: #2ee9ff 0px 7px 29px 0px;
}
td {
    height: 100px;
}
th, td {
    padding: 0 10px;
}
img {
    height: 80px;
    width: 80px;
}</style>
<body>
<table>
    <h2>Danh Sách Khách Hàng</h2>
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customers" items="${listcustomers}">
        <tr style="border-bottom: 1px solid black">
            <td>${customers.name}</td>
            <td>${customers.dateOfBirth}</td>
            <td>${customers.diaChi}</td>
            <td>
                <img src="<c:url value="${customers.urlImage}"/>" />
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>