<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 16/09/2022
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Result</h2>
    <c:if test='${error!=""}'>
        <p>${error}</p>
    </c:if>

    <c:if test='${error==""}'>
        <p>${firstNum}</p>
        <p>${operator}</p>
        <p>${secondNum}</p>=
        <p>${result}</p>
    </c:if>
</body>
</html>
