<%--
  Created by IntelliJ IDEA.
  User: huyhoanghoangicloud.com
  Date: 9/7/22
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        List product
    </title>
    <style>
        .add {
            color: blue;
            text-decoration: none;
            padding: 20px;
            border: 1px solid blue;
            border-radius: 10px;
            margin-left: 5px;
        }
        .add:hover{
            color: white;
            background-color: blue;
        }
    </style>
</head>
<body>
<a class="add" href="/room?action=create">+ Add New Product</a>
<form action="/room?action=search" method="post">
    <div class="form-group"
         style=";display: flex;align-items: center;justify-content: end;flex-direction: row">
        <input class="form-control me-2" style="width: 200px;margin: 1em" type="search" name="tenNguoiThueSearch"
               value="${tenNguoiThueSearch}" placeholder="Input name search " aria-label="Search">
        <button class="btn btn-outline-primary" type="submit">Search</button>
    </div>
</form>
<table class="table">
    <tr>
        <th>STT</th>
        <th>Mã Phòng Trọ</th>
        <th>Tên Người Thuê</th>
        <th>Sđt</th>
        <th>Ngày Bắt Đầu Thuê</th>
        <th>Hình Thức thanh toán</th>
        <th>Action</th>
    </tr>
    <c:forEach var="room" items="${roomList}" varStatus="varStatus">
        <tr>
            <td>${varStatus.count}</td>
            <td>PTX-00${room.maPhongTro}</td>
            <td>${room.tenNguoiThue}</td>
            <td>0${room.sDT}</td>
            <td>${room.ngayBatDau}</td>
            <c:forEach var="c" items="${paymentList}">
                <c:if test="${c.id == room.idHinhThuc}">
                    <td>${c.namePayment}
                    </td>
                </c:if>
            </c:forEach>
            <td>
                <!-- Button trigger modal update-->
                <button type="button" class="btn btn-outline-primary btn-update" onclick="onUpdate(this)"
                        data-id="${product.id}" data-name="${product.name}" data-price="${product.price}"
                        data-quantity="${product.quantity}" data-color="${product.color}"
                        data-category="${product.idCategory}"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModalUpdate">
                    Update
                </button>
                <button type="button" onclick="deleteInfo('${room.maPhongTro}','${room.tenNguoiThue}')" class="btn btn-danger"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>


    <!-- Modal delete -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/room?action=delete" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="idDelete" id="idDelete">
                        <span>Do you want to delete <span id="deleteName"> </span> </span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Ok</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</table>
<script>
    function deleteInfo(maPhongTro, tenNguoiThue) {
        document.getElementById("idDelete").value = maPhongTro;
        document.getElementById("deleteName").innerText = tenNguoiThue;
    }
</script>

</body>
</html>
