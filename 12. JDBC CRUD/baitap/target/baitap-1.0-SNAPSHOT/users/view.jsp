<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/8/2021
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        table {
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1>View Users Page</h1>
            <h3>Information of user:</h3>
            <table class="table table-bordered">
                <tr>
                    <th>Username:</th>
                    <td><c:out value="${user.getName()}"/></td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><c:out value="${user.getEmail()}"/></td>
                </tr>
                <tr>
                    <th>Country:</th>
                    <td><c:out value="${user.getCountry()}"/></td>
                </tr>
            </table>
            <h3>
                <a href="${pageContext.request.contextPath}/users?action=user">Click here to back list</a>
            </h3>
        </div>
    </div>
</body>
</html>
