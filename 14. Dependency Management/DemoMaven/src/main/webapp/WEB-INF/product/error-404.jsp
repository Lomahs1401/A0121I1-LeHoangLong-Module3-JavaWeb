<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/8/2021
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        body {
            background-image: url("https://www.atechnj.com/media/Error-state.jpg");
            background-repeat: no-repeat;
            background-size: 100% auto;
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
            <h1 style="font-weight: bold">Sorry, something went wrong...</h1>
            <h3>
                <a href="${pageContext.request.contextPath}/products?action=products">Click here to back list products.</a>
            </h3>
        </div>
    </div>
</body>
</html>
