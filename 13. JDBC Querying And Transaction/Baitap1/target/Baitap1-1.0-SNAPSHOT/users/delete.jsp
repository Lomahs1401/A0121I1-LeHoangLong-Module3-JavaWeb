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
    <title>Delete user</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>"/>
    <style>
        table {
            margin: 0 auto;
            text-align: center;
        }
        a {
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1 style="color: #ce0000">Delete Product</h1>
            <p>
                <a href="${pageContext.request.contextPath}/users" style="color: darkblue; font-size: 20px">Back to list users</a>
            </p>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/users?action=delete">
            <h3 style="text-align: center">Are you sure you want to delete it?</h3>
            <fieldset style="opacity: 0.7;">
                <legend style="color: darkred; font-size: 22px; text-align: center">User Information</legend>
                <table>
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                    </c:if>
                    <tr>
                        <td>Name user: </td>
                        <td>${requestScope["user"].getName()}</td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td>${requestScope["user"].getEmail()}</td>
                    </tr>
                    <tr>
                        <td>Country: </td>
                        <td>${requestScope["user"].getCountry()}</td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Delete user!" class="btn btn-danger" style="opacity: 1.0"></td>
                        <td><a href="${pageContext.request.contextPath}/users"
                               style="text-decoration: none; color: white; opacity: 1.0" class="btn btn-primary">
                            Bring Me Back To List Users!</a></td>
                    </tr>
<%--                    <input type="hidden" name="action" value="delete"/>--%>
                </table>
            </fieldset>
        </form>
    </div>
</body>
</html>
