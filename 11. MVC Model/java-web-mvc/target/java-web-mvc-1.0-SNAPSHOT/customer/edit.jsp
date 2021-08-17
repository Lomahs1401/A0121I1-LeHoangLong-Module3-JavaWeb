<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/8/2021
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit customer</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="device=width-device, initial-scale=1"/>
    <style>
        body {
            background-image: url("https://cdn.wallpapersafari.com/30/34/X2sVJP.png");
            background-repeat: no-repeat;
            width: 100%;
        }
    </style>
</head>
<body>
<div style="text-align: center">
    <h1>Edit customer</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="${pageContext.request.contextPath}/customers" style="color: white; text-decoration: none">Back to customer list</a>
    </p>
</div>

<form method="post">
    <fieldset style="background-color: white; opacity: 0.5;">
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><label for="name"></label><input type="text" name="name" id="name" value="${requestScope["customer"].getName()}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><label for="email"></label><input type="text" name="email" id="email" value="${requestScope["customer"].getEmail()}"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><label for="address"></label><input type="text" name="address" id="address" value="${requestScope["customer"].getAddress()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
