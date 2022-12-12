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
        List
    </title>

</head>
<body>
<h1>DANH SÁCH BỆNH VIỆN</h1>
<table class="table">
    <tr>
        <th>STT</th>
        <th>MÃ BỆNH ÁN</th>
        <th>MÃ BỆNH NHÂN</th>
        <th>TÊN BỆNH NHÂN</th>
        <th>NGÀY NHẬP VIỆN</th>
        <th>NGÀY XUẤT VIỆN</th>
        <th>LÝ DO NHẬP VIỆN</th>
        <th>ACTION</th>
    </tr>
    <c:forEach var="benhvien" items="${benhNhanList}" varStatus="varStatus">
        <tr>
            <td>${varStatus.count}</td>
            <c:forEach var="c" items="${benhAnList}">
                <c:if test="${c.idBenhAn == benhvien.id_BenhAn}">
                    <td>${c.nameBenhAn}
                    </td>
                </c:if>
            </c:forEach>
            <td>BN-${benhvien.idBenhNhan}</td>
            <td>${benhvien.nameBenhNhan}</td>
            <td>${benhvien.ngayNhapVien}</td>
            <td>${benhvien.ngayXuatVien}</td>
            <td>${benhvien.lyDo}</td>

            <td>
                <!-- Button trigger modal update-->
                <button type="button" class="btn btn-outline-primary btn-update" onclick="onUpdate(this)"
                        data-idBenhNhan="${benhvien.idBenhNhan}"

            <c:forEach var="c" items="${benhAnList}">
                <c:if test="${c.idBenhAn == benhvien.id_BenhAn}">
                    data-nameBenhAn="${c.nameBenhAn}";
                </c:if>
            </c:forEach>

                        data-name="${benhvien.nameBenhNhan}"
                        data-ngaynhap="${benhvien.ngayNhapVien}"
                        data-ngayxuat="${benhvien.ngayXuatVien}"
                        data-lydo="${benhvien.lyDo}"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModalUpdate">
                    SỬA
                </button>
                <button type="button" onclick="deleteInfo('${benhvien.idBenhNhan}','${benhvien.nameBenhNhan}')" class="btn btn-danger"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    XOÁ
                </button>
            </td>
        </tr>
    </c:forEach>

</table>

<!-- Modal delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="benhvien?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <span>BẠN CÓ MUỐN XOÁ <span id="deleteName"> </span>? </span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ĐÓNG</button>
                    <button type="submit" class="btn btn-primary">ĐỒNG Ý</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Modal Update-->
<div class="modal fade" id="exampleModalUpdate" tabindex="-1"
     aria-labelledby="exampleModalLabelUpdate"
     aria-hidden="true">
    <form action="/benhvien?action=edit" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelUpdate">SỬA</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="idBenhNhanUpp">MÃ BỆNH NHÂN</label>
                        <input disabled type="text" name="idBenhNhan" id="idBenhNhanUpp" class="form-control"
                               placeholder="Input Ten">
                    </div>
                    <div class="form-group">
                        <label for="nameBenhAnUp">MÃ BỆNH ÁN</label>
                        <input disabled type="text" name="nameBenhAn" id="nameBenhAnUp" class="form-control"
                               placeholder="Input Ten">
                    </div>
                    <div class="form-group">
                        <label for="nameBenhNhanUp">TÊN BỆNH NHÂN</label>
                        <input type="text" name="nameBenhNhan" id="nameBenhNhanUp" class="form-control"
                               placeholder="Input Ten">
                    </div>
                    <div class="form-group">
                        <label for="ngayNhapVienUp">NGÀY NHẬP VIỆN</label>
                        <input type="text" name="ngayNhapVien" id="ngayNhapVienUp" class="form-control"
                               placeholder="Input Ngay Nhap Vien">
                    </div>
                    <div class="form-group">
                        <label for="ngayXuatVienUp">NGÀY XUẤT VIỆN</label>
                        <input type="text" name="ngayXuatVien" id="ngayXuatVienUp" class="form-control"
                               placeholder="Input Ngay Xuat Vien">
                    </div>
                    <div class="form-group">
                        <label for="lyDoUp">LÝ DO</label>
                        <input type="text" name="lyDo" id="lyDoUp" class="form-control"
                               placeholder="Input Ly Do">
                    </div>
                    <div>
                        <input type="hidden" name="idBenhNhan" id="idBenhNhanUp">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ĐÓNG
                    </button>
                    <button type="submit" class="btn btn-primary">LƯU THAY ĐỔI</button>
                </div>
            </div>
        </div>
    </form>
</div>


<script>
    function deleteInfo(idBenhNhan, nameBenhNhan) {
        document.getElementById("idDelete").value = idBenhNhan;
        document.getElementById("deleteName").innerText = nameBenhNhan;
    }

    $(".btn-update").click(function () {
        let idBenhNhan = $(this).attr("data-idBenhNhan");
        let nameBenhNhan = $(this).attr("data-name");
        let nameBenhAn = $(this).attr("data-nameBenhAn");
        let ngayNhapVien = $(this).attr("data-ngaynhap");
        let ngayXuatVien = $(this).attr("data-ngayxuat");
        let lyDo = $(this).attr("data-lydo");
        $("#nameBenhNhanUp").val(nameBenhNhan)
        $("#nameBenhAnUp").val(nameBenhAn)

        $("#ngayNhapVienUp").val(ngayNhapVien)
        $("#ngayXuatVienUp").val(ngayXuatVien)
        $("#lyDoUp").val(lyDo)
        $("#idBenhNhanUp").val(idBenhNhan)
        $("#idBenhNhanUpp").val("BN-"+idBenhNhan)
    })

</script>

</body>
</html>