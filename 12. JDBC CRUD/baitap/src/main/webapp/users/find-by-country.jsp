<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/8/2021
  Time: 8:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find User By Country</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        table {
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1>Find User By Country</h1>
            <h3>
                <a href="${pageContext.request.contextPath}/users?action=user">Click here to back list users</a>
            </h3>
            <form method="post" action="${pageContext.request.contextPath}/users">
                <table>
                    <tr>
                        <th>Country:</th>
                        <td>
                            <label for="findByCountry">
                                <input type="text" name="findByCountry" id="findByCountry">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Submit country" class="btn btn-primary">
                        </td>
                    </tr>
                    <input type="hidden" name="action" value="findByCountry"/>
                </table>
            </form>
            <c:if test="${requestScope['users'] != null}">
                <h1 style="text-align: center">Danh sách user được tìm kiếm với country <c:out value="${country}"/></h1>
                <table style="text-align: center" class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Họ và tên</th>
                            <th>Email</th>
                            <th>Quốc gia</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.getId()}</td>
                                <td>${user.getName()}</td>
                                <td>${user.getEmail()}</td>
                                <td>${user.getCountry()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</body>
</html>
