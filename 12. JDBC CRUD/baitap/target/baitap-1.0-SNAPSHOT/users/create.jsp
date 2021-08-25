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
    <title>Create New User</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>"/>
    <style>
        a:hover {
            text-decoration: none;
        }
        a {
            text-decoration: none;
        }
        table {
            margin: 0 auto;
            text-align: center;
        }
        .message {
            color: #1c7430;
            font-weight: bold;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1>Welcome to create new user page!</h1>
            <p>
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>
            <h3>
                <a href="${pageContext.request.contextPath}/users?action=users">
                    If you don't want to create new user, click here to back list users!</a>
            </h3>
        </div>
        <form action="${pageContext.request.contextPath}/users" method="post">
            <fieldset style="opacity: 0.7">
            <legend style="color: black; font-weight: bold; font-size: 20px; text-align: center">User Information</legend>
            <table>
                <tr>
                    <td>Name user: </td>
                    <td>
                        <label for="nameUser"></label>
                        <input type="text" name="nameUser" id="nameUser">
                    </td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <label for="email"></label>
                        <input type="text" name="email" id="email">
                    </td>
                </tr>
                <tr>
                    <td>Country: </td>
                    <td>
                        <label for="country"></label>
                        <input type="text" name="country" id="country">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Create New User!" class="btn btn-primary">
                    </td>
                </tr>
                <input type="hidden" name="action" value="create"/>
            </table>
        </fieldset>
        </form>
    </div>
</body>
</html>
