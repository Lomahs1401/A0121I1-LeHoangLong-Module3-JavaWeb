<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/image/favicon.ico"/>"/>
    <title>List Employee</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>">
    <style>
        body {
            background-image: url("/image/FuramaBackground.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
        }
        .container-fluid {
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
<div class="container-fluid">
    <div class="main">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID Nhân Viên</th>
                <th>Họ Và Tên</th>
                <th>Ngày Sinh</th>
                <th>Số CMND</th>
                <th>Lương</th>
                <th>SĐT</th>
                <th>Email</th>
                <th>Địa Chỉ (Tỉnh/Thành Phổ)</th>
                <th>Vị Trí</th>
                <th>Trình Độ</th>
                <th>Bộ Phận</th>
                <th>Username</th>
                <th>Cập Nhật</th>
                <th>Xóa</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${requestScope['employees']}">
                    <tr>
                        <td>${employee.getEmployeeId()}</td>
                        <td>${employee.getEmployeeName()}</td>
                        <td>${employee.getEmployeeBirthday()}</td>
                        <td>${employee.getEmployeeIdCard()}</td>
                        <td>${employee.getEmployeeSalary()}</td>
                        <td>${employee.getEmployeePhone()}</td>
                        <td>${employee.getEmployeeMail()}</td>
                        <td>${employee.getEmployeeAddress()}</td>
                        <td>
                            <c:choose>
                                <c:when test="${employee.getPositionId() == 1}">Lễ Tân</c:when>
                                <c:when test="${employee.getPositionId() == 2}">Giám Đốc</c:when>
                                <c:when test="${employee.getPositionId() == 3}">Quản Lý</c:when>
                                <c:when test="${employee.getPositionId() == 4}">Phục Vụ</c:when>
                                <c:when test="${employee.getPositionId() == 5}">Chuyên Viên</c:when>
                                <c:when test="${employee.getPositionId() == 6}">Giám Sát</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${employee.getEducationDegreeId() == 10}">Đại Học</c:when>
                                <c:when test="${employee.getEducationDegreeId() == 11}">Trung Cấp</c:when>
                                <c:when test="${employee.getEducationDegreeId() == 12}">Cao Đẳng</c:when>
                                <c:when test="${employee.getEducationDegreeId() == 13}">Sau Đại Học</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${employee.getDivisionId() == 100}">Sale-Marketing</c:when>
                                <c:when test="${employee.getDivisionId() == 101}">Phục Vụ</c:when>
                                <c:when test="${employee.getDivisionId() == 102}">Quản Lý</c:when>
                             <c:when test="${employee.getDivisionId() == 103}">Hành Chính</c:when>
                            </c:choose>
                        </td>
                        <td>${employee.getUsername()}</td>
                        <td>
                            <a type="button" class="btn update"
                               href="${pageContext.request.contextPath}/employee?action=update&id=${employee.getEmployeeId()}">Cập
                                Nhật</a>
                        </td>
                        <td>
                            <a type="button" class="btn delete"
                               href="${pageContext.request.contextPath}/employee?action=delete&id=${employee.getEmployeeId()}">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
