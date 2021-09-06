<%--suppress ALL --%>

<%--
  Created by IntelliJ IDEA.
  User: lelon
  Date: 9/4/2021
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/image/favicon.ico"/>"/>
    <title>List Customer</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        body {
            background-image: url("image/FuramaBackground.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
        }
        .container {
            position: relative;
        }
        .main {
            margin: auto;
            text-align: center;
            position: absolute;
            top: 0;
            bottom: 0;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            opacity: 0.8;
        }
        thead {
            background: #046056;
            color: white;
            font-weight: bold;
            font-size: 24px;
        }
        th, td {
            vertical-align: middle !important;
            text-align: center;
        }
        .update, .delete {
            background: #046056;
            color: white;
        }
        .update:hover, .delete:hover {
            background: #067063;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="main">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID Khách Hàng</th>
                        <th>Loại Khách</th>
                        <th>Họ Và Tên</th>
                        <th>Ngày Sinh</th>
                        <th>Giới Tính</th>
                        <th>Số CMND</th>
                        <th>SĐT</th>
                        <th>Email</th>
                        <th>Địa Chỉ (Tỉnh/Thành Phổ)</th>
                        <th>Cập Nhật</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${requestScope['customers']}">
                        <tr>
                            <td>${customer.getCustomerId()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.getCustomerTypeId() == 82091}">Diamond</c:when>
                                    <c:when test="${customer.getCustomerTypeId() == 81038}">Platinum</c:when>
                                    <c:when test="${customer.getCustomerTypeId() == 89401}">Gold</c:when>
                                    <c:when test="${customer.getCustomerTypeId() == 88284}">Silver</c:when>
                                    <c:when test="${customer.getCustomerTypeId() == 85714}">Member</c:when>
                                </c:choose>
                            </td>
                            <td>${customer.getCustomerName()}</td>
                            <td>${customer.getCustomerBirthday()}</td>
                            <td>${customer.getCustomerGender()}</td>
                            <td>${customer.getCustomerIdCard()}</td>
                            <td>${customer.getCustomerPhone()}</td>
                            <td>${customer.getCustomerEmail()}</td>
                            <td>${customer.getCustomerAddress()}</td>
                            <td>
                                <a type="button" class="btn update"
                                   href="${pageContext.request.contextPath}/customer?action=update&id=${customer.getCustomerId()}">Cập
                                    Nhật</a>
                            </td>
                            <td>
                                <a type="button" class="btn delete"
                                   href="${pageContext.request.contextPath}/customer?action=delete&id=${customer.getCustomerId()}">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
