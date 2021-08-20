<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/8/2021
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>" type="text/css">
    <style>
        html, body {
            width: 100%;
            height: 100%;
        }
        td {
            color: black;
            font-weight: bold;
        }
        table {
            margin: 0 auto;
            text-align: center;
        }
        .contain {
            background-image: url("https://pc-farm.co.jp/wp-content/uploads/84302c82594d676dbadfc39c9082a6d1.jpg");
            background-repeat: no-repeat;
            background-position: center center;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            position: relative;
        }
        .main {
            margin: auto;
            width: 31.4375em;
            height: 22.5em;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background-color: rgba(238, 109, 109, 0.91);
            opacity: 0.95;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        @media only screen and (max-height: 630px) {
            .contain {
                background-image: url("https://pc-farm.co.jp/wp-content/uploads/84302c82594d676dbadfc39c9082a6d1.jpg");
                background-repeat: no-repeat;
                background-position: center center;
                background-size: 100% 100%;
                width: 100%;
                height: 700px;
                position: relative;
            }
        }
        @media only screen and (max-width: 540px) {
            .contain {
                background-image: url("https://pc-farm.co.jp/wp-content/uploads/84302c82594d676dbadfc39c9082a6d1.jpg");
                background-repeat: no-repeat;
                background-position: center center;
                background-size: 100% 100%;
                width: 630px;
                height: 850px;
                position: relative;
            }
        }
    </style>
</head>
<body>
    <div class="contain">
        <div class="main">
            <div style="text-align: center">
                <h1 style="color: #ce0000">Delete Product</h1>
                <p>
                    <a href="${pageContext.request.contextPath}/products" style="color: darkblue; font-size: 20px">Back to products list</a>
                </p>
            </div>
            <form method="post">
                <h3>Are you sure you want to delete it?</h3>
                <fieldset style="opacity: 0.7;">
                    <legend style="color: darkred; font-size: 22px">Product Information</legend>
                    <table>
                        <tr>
                            <td>Name Product: </td>
                            <td>${requestScope["product"].getNameProduct()}</td>
                        </tr>
                        <tr>
                            <td>Price: </td>
                            <td>${requestScope["product"].getPrice()}</td>
                        </tr>
                        <tr>
                            <td>Description: </td>
                            <td>${requestScope["product"].getDescription()}</td>
                        </tr>
                        <tr>
                            <td>Country: </td>
                            <td>${requestScope["product"].getCountry()}</td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Delete Product!" class="btn btn-danger" style="opacity: 1.0"></td>
                            <td><a href="${pageContext.request.contextPath}/products"
                                   style="text-decoration: none; color: white; opacity: 1.0" class="btn btn-primary">
                                Bring Me Back To Products List!</a></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>
