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
    <title>List Users</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>"/>
    <style>
        a {
            text-decoration: none;
            color: deepskyblue;
        }
        a:hover {
            text-decoration: none;
        }
        table {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1>Welcome to List Users Page!</h1>
            <h3 style="text-align: center; margin-top: 20px">
                <a href="${pageContext.request.contextPath}/users?action=getAllUsers" class="btn-primary btn">
                    Click here to get all users!</a>
            </h3>
        </div>
        <c:if test='${requestScope["listUsers"] != null}'>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Họ và tên</th>
                        <th>Quốc gia</th>
                        <th>Cập nhật</th>
                        <th>Xoá</th>
                    </tr>
                </thead>
                <tbody>
                    <jsp:useBean id="listUsers" scope="request" type="java.util.List"/>
                    <c:forEach var="user" items="${listUsers}">
                        <tr>
                            <td><c:out value="${user.getId()}"/></td>
                            <td><c:out value="${user.getName()}"/></td>
                            <td><c:out value="${user.getCountry()}"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/users?action=update&id=${user.getId()}"
                                   class="btn btn-primary">Cập nhật</a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.getId()}"
                                   class="btn btn-primary">Xoá</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
