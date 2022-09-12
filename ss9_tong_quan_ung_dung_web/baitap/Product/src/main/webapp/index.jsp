<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/convert" method="post">
    <input type="text" name="price" placeholder="Enter your price: "/>
    <input type="text" name="percent" placeholder="Enter your percent: "/>
    <input type = "submit" id = "submit" value = "Submit"/>
    <br>
    <b>${discountAmount}</b>
    <br>
    <b>${discountPrice}</b>
</form>
</body>
</html>