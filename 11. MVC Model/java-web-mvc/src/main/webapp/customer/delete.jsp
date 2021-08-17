<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/8/2021
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="device=width-device, initial-scale=1"/>
    <style>
        body {
            background-image: url("https://i.pinimg.com/originals/cb/7a/e8/cb7ae8cb0601ec3167227dbd28f871ae.jpg");
            background-repeat: no-repeat;
            width: 100%;
        }
    </style>
</head>
<body>
<div style="text-align: center">
    <h1>Delete customer</h1>
    <p>
        <a href="${pageContext.request.contextPath}/customers" style="color: white; text-decoration: none">Back to customer list</a>
    </p>
</div>

<form method="post">
    <h3>Are you sure?</h3>
    <fieldset style="background-color: white; opacity: 0.5">
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${requestScope["customer"].getName()}</td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>${requestScope["customer"].getEmail()}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${requestScope["customer"].getAddress()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td><a href="${pageContext.request.contextPath}/customers" style="text-decoration: none; color: white">
                    Bring me back to customer list!</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
