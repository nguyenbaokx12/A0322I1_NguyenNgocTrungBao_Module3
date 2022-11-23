<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 8/17/2022
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Trang list product</h1>
<a href="/product?action=create">Them moi</a>
<br>
<input type="text" name="" id="">
<form action="/product?action=findBy" method="post">
    <button type="submit" name="findName">Search</button>
</form>

<table class="table table-dark">
    <tr>
        <th>Id</th>
        <th>Name product</th>
        <th>price productr</th>
        <th>Manufacturer product</th>
        <th>Grantee By Year</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="product" items="${bookList}" varStatus="status">
        <tr>

            <td>${status.count}</td>
                <%--      <td>${product.idProduct}</td>--%>
            <td>${product.nameProduct}</td>
            <td>${product.priceProduct}</td>
            <td>${product.manufacturerProduct}</td>
            <td>${product.granteeByYear}</td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" onclick="deleteInfo('${product.idProduct}','${product.nameProduct}')" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>

</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/product" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden name="deleteId" id="deleteId">
                    <input hidden name="action" value="delete">
                    <span>Bạn có muốn xoá sp </span>
                    <span id="deleteName"></span><span> Không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deleteInfo(id,name) {
        document.getElementById("deleteId").value=id;
        document.getElementById("deleteName").innerText=name;
    }
</script>
</body>
</html>
