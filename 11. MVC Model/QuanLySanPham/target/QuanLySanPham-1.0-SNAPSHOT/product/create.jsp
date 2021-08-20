<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/8/2021
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        html, body {
            width: 100%;
            height: 100%;
        }
        td {
            color: black;
        }
        table {
            margin: 0 auto;
            text-align: center;
        }
        .contain {
            background-image: url("https://www.wallpapertip.com/wmimgs/83-834178_selling-products.jpg");
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
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            background-color: #23d5f3;
            opacity: 0.8;
        }
        .message{
            color:green;
            font-size: 25px;
            font-weight: bold;
        }
        @media only screen and (max-height: 630px) {
            .contain {
                background-image: url("https://www.wallpapertip.com/wmimgs/83-834178_selling-products.jpg");
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
                background-image: url("https://www.wallpapertip.com/wmimgs/83-834178_selling-products.jpg");
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
                <h1 style="color: white">Create New Product</h1>
                <p>
                    <c:if test='${requestScope["message"] != null}'>
                        <span class="message">${requestScope["message"]}</span>
                    </c:if>
                </p>
                <p>
                    <a href="${pageContext.request.contextPath}/products" style="color: white; font-size: 20px"
                       id="back">Back to products list</a>
                </p>
            </div>

            <form method="post">
                <fieldset style="opacity: 0.7">
                    <legend style="color: black; font-weight: bold; font-size: 20px; text-align: center">Product Information</legend>
                    <table>
                        <tr>
                            <td>Name Product: </td>
                            <td>
                                <label for="nameProduct"></label>
                                <input type="text" name="nameProduct" id="nameProduct">
                            </td>
                        </tr>
                        <tr>
                            <td>Price: </td>
                            <td>
                                <label for="price"></label>
                                <input type="text" name="price" id="price">
                            </td>
                        </tr>
                        <tr>
                            <td>Description: </td>
                            <td>
                                <label for="description"></label>
                                <input type="text" name="description" id="description">
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
                                <input type="submit" value="Create New Product!" class="btn btn-primary">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>
