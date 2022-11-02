<%--
  Created by IntelliJ IDEA.
  User: huyhoanghoangicloud.com
  Date: 9/5/22
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Them moi</title>
</head>
<style>
    .back{
        text-decoration: none;
        color: black;
    }

    .back:hover{
        color: white;
    }

    .content{
        border: 1px solid black;
        width: 400px;
        padding-left: 50px;
        border-radius: 10px;
        box-shadow: 10px 10px 5px black;
        margin-left: 500px;
        font-size: 20px;
        height: 490px;
    }

    .click:hover{
        color: white;
        background-color: black;
        border-radius: 10px;
        cursor: pointer;
    }
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
</style>
<body>
<div class="content">
    <div>
        <h1>Add New Product</h1>
        <form action="/room?action=create" method="post">
            <pre>Tên Người Thuê    : <input required type="text" name="tenNguoiThue" ></pre>
            <pre>SĐT               : <input id="std" required type="number" name="sDT" > </pre>
            <pre>Ngày Bắt Đầu Thuê : <input type="date" name="ngayBatDau"></pre>
            <pre>Hình Thức         : <select style="font-size: 20px; width: 100px" name="idHinhThuc">
                     <c:forEach var="cls" items="${paymentList}">
                                     <option value="${cls.id}">${cls.namePayment}</option>
                     </c:forEach>
                    </select></pre>
            <button class="click" style="font-size: 20px; width: 100px"  type="submit">Create</button>
        </form>
    </div>

    <button class="click" style="font-size: 20px; width: 100px" >
        <a  class="back" href="/room">Back </a>
    </button>
    <c:if test="${mess!=null}">
        <p style="color: red">${mess}</p>
    </c:if>
</div>
</body>
</html>
