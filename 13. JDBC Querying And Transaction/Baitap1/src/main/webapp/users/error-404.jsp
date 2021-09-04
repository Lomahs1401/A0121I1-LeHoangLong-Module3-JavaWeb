<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/8/2021
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
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
        <div style="text-align: center; margin-top: 500px">
            <h1 style="color: red">Something wrong...</h1>
            <h3>
                <a href="${pageContext.request.contextPath}/users?action=user">Back to list users</a>
            </h3>
        </div>
    </div>
</body>
</html>
