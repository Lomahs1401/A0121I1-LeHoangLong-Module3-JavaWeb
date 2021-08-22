<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap.min.css"/>
    <style>
        img {
            width: 300px;
            height: auto;
        }
        th {
            text-align: center;
        }
        td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="text-align: center">Danh sách khách hàng</h1>
        <table class = "table">
            <thead class="thead-dark">
                <tr>
                    <th>Tên</th>
                    <th>Ngày Sinh</th>
                    <th>Địa Chỉ</th>
                    <th>Ảnh</th>
                </tr>
            </thead>
            <tbody>
                <%--@elvariable id="users" type="java.util.List"--%>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><c:out value="${user.getName()}"/></td>
                        <td><c:out value="${user.getDateOfBirth()}"/></td>
                        <td><c:out value="${user.getAddress()}"/></td>
                        <td>
                            <img src="img/${user.getImage()}" alt="Image"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>