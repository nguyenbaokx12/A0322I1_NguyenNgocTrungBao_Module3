<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>CREATE</title>
</head>
<body>
<form method="post">
    <input type="hidden" name="action" value="create" />
    <input type="hidden" placeholder="id" name="id" />
    <p>Name</p>
    <input type="text" placeholder="name" name="name"/>
    <p>Email</p>
    <input type="email" placeholder="email" name="email" />
    <p>Country</p>
    <input type="text" placeholder="country" name="country"/>
    <input type="submit" value="Thêm Mới"/>
</form>
</body>
</html>