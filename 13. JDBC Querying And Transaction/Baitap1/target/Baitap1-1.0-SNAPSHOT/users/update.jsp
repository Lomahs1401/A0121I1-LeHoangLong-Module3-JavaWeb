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
    <title>Update user</title>
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
            <h1>Update user page!</h1>
            <p>
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>
            <h3>
                <a href="${pageContext.request.contextPath}/users">Click here to back list users</a>
            </h3>
        </div>
        <form action="${pageContext.request.contextPath}/users" method="post">
            <fieldset style="opacity: 0.7">
                <legend style="color: black; font-weight: bold; font-size: 20px; text-align: center">User Information</legend>
                <table>
                    <jsp:useBean id="user" scope="request" type="java.util.List"/>
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}'/>"/>
                    </c:if>
                    <tr>
                        <td>Name user: </td>
                        <td>
                            <label for="nameUser"></label>
                            <input type="text" name="nameUser" id="nameUser"
                            value="${requestScope["user"].getName()}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td>
                            <label for="email"></label>
                            <input type="text" name="email" id="email"
                            value="${requestScope["user"].getEmail()}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Country: </td>
                        <td>
                            <label for="country"></label>
                            <input type="text" name="country" id="country"
                            value="${requestScope["user"].getCountry()}"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Update user!" class="btn btn-primary">
                        </td>
                    </tr>
                    <input type="hidden" name="action" value="update"/>
                </table>
            </fieldset>
        </form>
    </div>
</body>
</html>
