<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Simple Calculator</h1>
        <form action="<c:url value="/calculate"/>" method="post">
            <div class="form-group">
                <label for="firstOperand">First Operand:</label>
                <input type="text" class="form-control" id="firstOperand" name="firstOperand" placeholder="Enter first operand"/>
            </div>
            <div class="form-group">
                <label for="operator">Operator
                    <select name="operator" id="operator">
                        <option value="addition">Addition</option>
                        <option value="subtraction">Subtraction</option>
                        <option value="multiplication">Multiplication</option>
                        <option value="division">Division</option>
                    </select>
                </label>
            </div>
            <div class="form-group">
                <label for="secondOperand">Second Operand:</label>
                <input type="text" class="form-control" id="secondOperand" name="secondOperand" placeholder="Enter second operand"/>
            </div>
            <input type="submit" value="Calculate" class="btn btn-primary">
        </form>
    </div>
</body>
</html>