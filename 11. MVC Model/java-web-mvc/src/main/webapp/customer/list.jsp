<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/8/2021
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="device=width-device, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        body {
            background-image: url("https://i.pinimg.com/originals/af/8e/d3/af8ed3265ed9b78d34f2340b5bb42b71.jpg");
            background-repeat: no-repeat;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1>Customers</h1>
            <p>
                <a href="${pageContext.request.contextPath}customers?action=create"
                   style="text-decoration: none; color: white">Create new customer</a>
            </p>
        </div>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items='${requestScope["customers"]}' var="customer">
                    <tr style="opacity: 0.65" class="table-light">
                        <td>
                            <a href="${pageContext.request.contextPath}customers?action=view&id=${customer.getId()}">
                                <c:out value="${customer.getName()}"/>
                            </a>
                        </td>
                        <td>
                            <c:out value="${customer.getEmail()}"/>
                        </td>
                        <td>
                            <c:out value="${customer.getAddress()}"/>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}
                            customers?action=edit&id=${customer.getId()}">edit</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}
                            customers?action=delete&id=${customer.getId()}">delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
