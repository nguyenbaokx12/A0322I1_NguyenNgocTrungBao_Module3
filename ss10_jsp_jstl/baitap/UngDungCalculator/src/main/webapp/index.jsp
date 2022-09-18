<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Simple Calculator</h2>
<form method="get" action="/CalculatorServlet">
    <div>
        <span>First operand: </span> <input type="text" name="firstNumber"/>
    </div>
    <div>
        <span>Operator: </span>
        <select>
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">x</option>
            <option value="/">/</option>
        </select>
    </div>
    <div>
        <span>Second operand: </span> <input type="text" name="secondNumber"/>
    </div>
    <div>
        <input type="submit" id="submit" value="Caculate">
    </div>
</form>
</body>
</html>