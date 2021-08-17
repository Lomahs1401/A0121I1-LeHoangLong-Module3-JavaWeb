<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/8/2021
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View customer</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="device=width-device, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>"/>
    <style>
        body {
            background-image: url("https://wallpapercave.com/wp/YKJtSPc.jpg");
            background-repeat: no-repeat;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <div style="text-align: center">
        <h1>Customer details</h1>
        <p>
            <a href="${pageContext.request.contextPath}/customers" style="color: white; text-decoration: none">Back to customer list</a>
        </p>
    </div>

    <table class="table table-striped table-hover">
        <tr class="table-light" style="opacity: 0.5">
            <td>Name: </td>
            <td>${requestScope["customer"].getName()}</td>
        </tr>
        <tr class="table-light" style="opacity: 0.5">
            <td>Email: </td>
            <td>${requestScope["customer"].getEmail()}</td>
        </tr>
        <tr class="table-light" style="opacity: 0.5">
            <td>Address: </td>
            <td>${requestScope["customer"].getAddress()}</td>
        </tr>
    </table>
</div>
</body>
</html>
