<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/8/2021
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="device=width-device, initial-scale=1"/>
    <style>
        .message{
            color:green;
            font-size: 25px;
            font-weight: bold;
        }
        body {
            background-image: url("https://wallpaperaccess.com/full/170249.jpg");
            background-repeat: no-repeat;
            width: 100%;
        }
        #back:hover {
            color: darkgrey;
        }
    </style>
</head>
<body>
    <div style="text-align: center">
        <h1>Create new customer</h1>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/customers" style="color: white; text-decoration: none"
               id="back">Back to customer list</a>
        </p>
    </div>

    <form method="post">
        <fieldset style="opacity: 0.6">
            <legend>Customer information</legend>
            <table>
                <tr>
                    <td>Name: </td>
                    <td>
                        <label for="name"></label>
                        <input type="text" name="name" id="name">
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
                    <td>Address: </td>
                    <td>
                        <label for="address"></label>
                        <input type="text" name="address" id="address">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Create customer" class="btn btn-primary">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>
