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
    <title>View Product</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        html, body {
            width: 100%;
            height: 100%;
        }
        td {
            color: white;
            font-size: 18px;
            font-weight: bold;
        }
        table {
            margin: 0 auto;
            text-align: center;
        }
        .contain {
            background-image: url("https://cdn.dribbble.com/users/3958529/screenshots/8515371/iso_4___________________1_4x.png");
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
            height: 20em;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background-color: rgba(54, 37, 217, 0.84);
            opacity: 0.85;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        @media only screen and (max-height: 630px) {
            .contain {
                background-image: url("https://cdn.dribbble.com/users/3958529/screenshots/8515371/iso_4___________________1_4x.png");
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
                background-image: url("https://cdn.dribbble.com/users/3958529/screenshots/8515371/iso_4___________________1_4x.png");
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
            <div style="text-align: center; margin-top: 30px">
                <h1 style="font-weight: bold">Product details</h1>
                <p>
                    <a href="${pageContext.request.contextPath}/products"
                       style="color: white; font-size: 20px">Back to products list</a>
                </p>
            </div>
            <table>
                <tr>
                    <td>Name Product:</td>
                    <td>${requestScope["product"].getNameProduct()}</td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td>${requestScope["product"].getPrice()}</td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>${requestScope["product"].getDescription()}</td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td>${requestScope["product"].getCountry()}</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
