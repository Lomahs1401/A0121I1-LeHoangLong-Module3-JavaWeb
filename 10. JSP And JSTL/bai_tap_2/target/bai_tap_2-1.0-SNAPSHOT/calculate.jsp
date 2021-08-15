<%@ page import="com.example.bai_tap_2.Calculator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/8/2021
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculate</title>
</head>
<body>
    <c:if test="${exception != null}">
        <h1 style="color: red"><c:out value="${'Lỗi chia hết cho 0!'}"/></h1>
    </c:if>
    <c:if test="${exception == null}">
        <h1>Your result:</h1>
        <h1><c:out value="${firstOperand} ${operator} ${secondOperator} = ${result}"/></h1>
    </c:if>

</body>
</html>
