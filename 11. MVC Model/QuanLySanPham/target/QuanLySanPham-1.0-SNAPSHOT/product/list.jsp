<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/8/2021
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>"/>
    <style>
        html, body {
            width: 100%;
            height: 100%;
        }
        table {
            text-align: center;
            width: 100%;
            margin: 0 auto;
        }
        td {
            padding: 0.5em !important;
            vertical-align: middle !important;
        }
        a.clickButton {
            padding: 0.15em 0.75em !important;
        }
        tbody {
            background-color: plum;
        }
        .contain {
            background-image: url("https://www.teahub.io/photos/full/188-1886823_apple-products-wallpaper-hd.jpg");
            background-repeat: no-repeat;
            background-position: center center;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            position: relative;
        }
        .main {
            margin: auto;
            width: 35em;
            height: 20em;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background-color: plum;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.8);
            opacity: 0.8;
        }
        @media only screen and (max-height: 630px) {
            .contain {
                background-image: url("https://www.teahub.io/photos/full/188-1886823_apple-products-wallpaper-hd.jpg");
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
                background-image: url("https://www.teahub.io/photos/full/188-1886823_apple-products-wallpaper-hd.jpg");
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
            <div>
                <h1 style="color: white">List Products</h1>
                <p>
                    <a href="${pageContext.request.contextPath}/products?action=create"
                       style="color: white; font-weight: bolder">Create New Product Here!</a>
                </p>
            </div>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Name Product</th>
                    <th>Country</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items='${requestScope["products"]}'>
                    <tr style="opacity: 0.8;">
                        <td>
                            <a href="${pageContext.request.contextPath}
                            /products?action=view&id=${product.getId()}" style="text-decoration: none;">
                                <c:out value="${product.getNameProduct()}"/>
                            </a>
                        </td>
                        <td>
                            <c:out value="${product.getCountry()}"/>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}
                            /products?action=edit&id=${product.getId()}"
                               style="text-decoration: none;" class="btn btn-primary clickButton">Edit</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}
                            /products?action=delete&id=${product.getId()}"
                               style="text-decoration: none;" class="btn btn-primary clickButton">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
