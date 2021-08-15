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
    </style>
</head>
<body>
    <div class="container">
        <h1 style="text-align: center">Danh sách khách hàng</h1>
        <table class = "table">
            <thead>
                <tr>
                    <th>Tên</th>
                    <th>Ngày Sinh</th>
                    <th>Địa Chỉ</th>
                    <th>Ảnh</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="align-content-center"><c:out value="${'Mai Văn Hoàn'}"/></td>
                    <td>${'1983-08-20'}</td>
                    <td>${'Hà Nội'}</td>
                    <td>
                        <img src="img/1.jpeg" alt="Mai Văn Hoàn image"/>
                    </td>
                </tr>
                <tr>
                    <td><c:out value="${'Nguyễn Văn Nam'}"/></td>
                    <td>${'1983-08-21'}</td>
                    <td>${'Bắc Giang'}</td>
                    <td>
                        <img src="img/2.jpg" alt="Nguyễn Văn Nam image"/>
                    </td>
                </tr>
                <tr>
                    <td><c:out value="${'Nguyễn Thái Hoà'}"/></td>
                    <td>${'1983-08-22'}</td>
                    <td>${'Nam Định'}</td>
                    <td>
                        <img src="img/3.jpg" alt="Nguyễn Thái Hoà" />
                    </td>
                </tr>
                <tr>
                    <td><c:out value="${'Trần Đăng Khoa'}"/></td>
                    <td>${'1983-08-17'}</td>
                    <td>${'Hà Tây'}</td>
                    <td>
                        <img src="img/4.jpg" alt="Trần Đăng Khoa"/>
                    </td>
                </tr>
                <tr>
                    <td><c:out value="${'Nguyễn Đình Thi'}"/></td>
                    <td>${'1983-08-19'}</td>
                    <td>${'Hà Nội'}</td>
                    <td>
                        <img src="img/5.jpg" alt="Nguyễn Đình Thi"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>