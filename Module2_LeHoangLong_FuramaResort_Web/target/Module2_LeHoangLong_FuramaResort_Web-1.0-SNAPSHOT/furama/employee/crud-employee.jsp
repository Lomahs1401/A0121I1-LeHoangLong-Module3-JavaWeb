<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/image/favicon.ico"/>"/>
    <title>CRUD Employee</title>
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

        label {
            font-weight: bold;
            font-size: 20px;
        }

        input {
            min-width: 4.375em;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.4);
            border-radius: 5px;
        }

        .contain {
            background-image: url("/image/furama-resort-danang-receptionist.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            position: relative;
        }

        .mainCreate, .mainUpdate, .mainDelete {
            margin: auto;
            width: 38em;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            background-color: #ea9f3c;
            opacity: 0.8;
        }

        .mainCreate, .mainUpdate {
            height: 35em;
        }

        .mainDelete {
            height: 45em;
        }

        .message {
            font-size: 24px;
            font-weight: bolder;
            color: #046056;
            opacity: 1.0;
        }
    </style>
</head>
<body>
<div class="contain">
    <c:if test="${requestScope['updateEmployee'] == null && requestScope['deleteEmployee'] == null}">
    <div class="mainCreate">
        <form action="${pageContext.request.contextPath}/employee" method="post">
            <fieldset class="createForm">
                <legend style="color: black; font-weight: bold; font-size: 24px; text-align: center">Nhân Viên Mới</legend>
                <p>
                    <c:if test='${requestScope["message"] != null}'>
                        <span class="message">${requestScope["message"]}</span>
                    </c:if>
                </p>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <label for="name">Họ Và Tên:</label>
                        </td>
                        <td>
                            <input type="text" name="employee-name" id="name">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="birthday">Ngày Sinh:</label>
                        </td>
                        <td>
                            <input type="date" name="employee-birthday" id="birthday">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="id-card">Số CMND:</label>
                        </td>
                        <td>
                            <input type="text" name="employee-id-card" id="id-card">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="salary">Lương:</label>
                        </td>
                        <td>
                            <input type="text" name="employee-salary" id="salary">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="phone-number">Số Điện Thoại:</label>
                        </td>
                        <td>
                            <input type="text" name="employee-phone" id="phone-number">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="email">Email:</label>
                        </td>
                        <td>
                            <input type="text" name="employee-email" id="email">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="address">Địa chỉ (Tỉnh/Thành Phố):</label>
                        </td>
                        <td>
                            <input type="text" name="employee-address" id="address">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Vị Trí:</label>
                        </td>
                        <td>
                            <label>
                                <select name="position-id">
                                    <option value="le-tan">Lễ Tân</option>
                                    <option value="giam-doc">Giám Đốc</option>
                                    <option value="quan-ly">Quản Lý</option>
                                    <option value="phuc-vu">Phục Vụ</option>
                                    <option value="chuyen-vien">Chuyên Viên</option>
                                    <option value="giam-sat">Giám Sát</option>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Trình Độ:</label>
                        </td>
                        <td>
                            <label>
                                <select name="education-degree-id">
                                    <option value="dai-hoc">Đại Học</option>
                                    <option value="sau-dai-hoc">Sau Đại Học</option>
                                    <option value="cao-dang">Cap Đẳng</option>
                                    <option value="trung-cap">Trung Cấp</option>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Bộ Phận:</label>
                        </td>
                        <td>
                            <label>
                                <select name="division-id">
                                    <option value="sale-marketing">Sale Marketing</option>
                                    <option value="phuc-vu">Phục Vụ</option>
                                    <option value="quan-ly">Quản Lý</option>
                                    <option value="hanh-chinh">Hành Chính</option>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="username">Username:</label>
                        </td>
                        <td>
                            <input type="text" name="username" id="username">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Thêm Nhân Viên!" class="btn btn-success">
                            <input type="hidden" name="action" value="create"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
        </form>
    </div>
        </c:if>
        <c:if test="${requestScope['updateEmployee'] != null}">
        <div class="mainUpdate">
            <form action="${pageContext.request.contextPath}/employee" method="post">
                <fieldset class="updateForm">
                    <legend style="color: black; font-weight: bold; font-size: 24px; text-align: center">Thông Tin Nhân Viên</legend>
                    <p>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p>
                    <table>
                        <thead>
                        <tr>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <label for="new-name">Họ Và Tên:</label>
                            </td>
                            <td>
                                <input type="text" name="employee-name" id="new-name" value="${requestScope['updateEmployee'].getEmployeeName()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-birthday">Ngày Sinh:</label>
                            </td>
                            <td>
                                <input type="date" name="employee-birthday" id="new-birthday" value="${requestScope['updateEmployee'].getEmployeeBirthday()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-id-card">Số CMND:</label>
                            </td>
                            <td>
                                <input type="text" name="employee-id-card" id="new-id-card" value="${requestScope['updateEmployee'].getEmployeeIdCard()}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-salary">Lương:</label>
                            </td>
                            <td>
                                <input type="text" name="employee-salary" id="new-salary" value="${requestScope['updateEmployee'].getEmployeeSalary()}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-phone-number">Số Điện Thoại:</label>
                            </td>
                            <td>
                                <input type="text" name="employee-phone" id="new-phone-number" value="${requestScope['updateEmployee'].getEmployeePhone()}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-email">Email:</label>
                            </td>
                            <td>
                                <input type="text" name="employee-email" id="new-email" value="${requestScope['updateEmployee'].getEmployeeMail()}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-address">Địa chỉ (Tỉnh/Thành Phố):</label>
                            </td>
                            <td>
                                <input type="text" name="employee-address" id="new-address" value="${requestScope['updateEmployee'].getEmployeeAddress()}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Vị Trí:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['updateEmployee'].getPositionId() == 1}">
                                        <label>
                                            <select name="position-id">
                                                <option value="le-tan" selected>Lễ Tân</option>
                                                <option value="giam-doc">Giám Đốc</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="chuyen-vien">Chuyên Viên</option>
                                                <option value="giam-sat">Giám Sát</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getPositionId() == 2}">
                                        <label>
                                            <select name="position-id">
                                                <option value="le-tan">Lễ Tân</option>
                                                <option value="giam-doc" selected>Giám Đốc</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="chuyen-vien">Chuyên Viên</option>
                                                <option value="giam-sat">Giám Sát</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getPositionId() == 3}">
                                        <label>
                                            <select name="position-id">
                                                <option value="le-tan">Lễ Tân</option>
                                                <option value="giam-doc">Giám Đốc</option>
                                                <option value="quan-ly" selected>Quản Lý</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="chuyen-vien">Chuyên Viên</option>
                                                <option value="giam-sat">Giám Sát</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getPositionId() == 4}">
                                        <label>
                                            <select name="position-id">
                                                <option value="le-tan">Lễ Tân</option>
                                                <option value="giam-doc">Giám Đốc</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="phuc-vu" selected>Phục Vụ</option>
                                                <option value="chuyen-vien">Chuyên Viên</option>
                                                <option value="giam-sat">Giám Sát</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getPositionId() == 5}">
                                        <label>
                                            <select name="position-id">
                                                <option value="le-tan">Lễ Tân</option>
                                                <option value="giam-doc">Giám Đốc</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="chuyen-vien" selected>Chuyên Viên</option>
                                                <option value="giam-sat">Giám Sát</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getPositionId() == 6}">
                                        <label>
                                            <select name="position-id">
                                                <option value="le-tan">Lễ Tân</option>
                                                <option value="giam-doc">Giám Đốc</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="chuyen-vien">Chuyên Viên</option>
                                                <option value="giam-sat" selected>Giám Sát</option>
                                            </select>
                                        </label>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Trình Độ:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['updateEmployee'].getEducationDegreeId() == 10}">
                                        <label>
                                            <select name="education-degree-id">
                                                <option value="dai-hoc" selected>Đại Học</option>
                                                <option value="trung-cap">Trung Cấp</option>
                                                <option value="cao-dang">Cao Đẳng</option>
                                                <option value="sau-dai-hoc">Sau Đại Học</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getEducationDegreeId() == 11}">
                                        <label>
                                            <select name="education-degree-id">
                                                <option value="dai-hoc">Đại Học</option>
                                                <option value="trung-cap" selected>Trung Cấp</option>
                                                <option value="cao-dang">Cao Đẳng</option>
                                                <option value="sau-dai-hoc">Sau Đại Học</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getEducationDegreeId() == 12}">
                                        <label>
                                            <select name="education-degree-id">
                                                <option value="dai-hoc">Đại Học</option>
                                                <option value="trung-cap">Trung Cấp</option>
                                                <option value="cao-dang" selected>Cao Đẳng</option>
                                                <option value="sau-dai-hoc">Sau Đại Học</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getEducationDegreeId() == 13}">
                                        <label>
                                            <select name="education-degree-id">
                                                <option value="dai-hoc">Đại Học</option>
                                                <option value="trung-cap">Trung Cấp</option>
                                                <option value="cao-dang">Cao Đẳng</option>
                                                <option value="sau-dai-hoc" selected>Sau Đại Học</option>
                                            </select>
                                        </label>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Bộ Phận:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['updateEmployee'].getDivisionId() == 100}">
                                        <label>
                                            <select name="division-id">
                                                <option value="sale-marketing" selected>Sale Marketing</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="hanh-chinh">Hành Chính</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getDivisionId() == 101}">
                                        <label>
                                            <select name="division-id">
                                                <option value="sale-marketing">Sale Marketing</option>
                                                <option value="phuc-vu" selected>Phục Vụ</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="hanh-chinh">Hành Chính</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getDivisionId() == 102}">
                                        <label>
                                            <select name="division-id">
                                                <option value="sale-marketing">Sale Marketing</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="quan-ly" selected>Quản Lý</option>
                                                <option value="hanh-chinh">Hành Chính</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateEmployee'].getDivisionId() == 103}">
                                        <label>
                                            <select name="division-id">
                                                <option value="sale-marketing">Sale Marketing</option>
                                                <option value="phuc-vu">Phục Vụ</option>
                                                <option value="quan-ly">Quản Lý</option>
                                                <option value="hanh-chinh" selected>Hành Chính</option>
                                            </select>
                                        </label>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-username">Username:</label>
                            </td>
                            <td>
                                <input type="text" name="username" id="new-username" value="${requestScope['updateEmployee'].getUsername()}">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Xác Nhận Cập Nhật!" class="btn btn-success">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name = "employee-id" value="${requestScope['updateEmployee'].getEmployeeId()}"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
        </c:if>
        <c:if test="${requestScope['deleteEmployee'] != null}">
        <div class="mainDelete">
            <form action="${pageContext.request.contextPath}/employee" method="post">
                <fieldset class="deleteForm">
                    <legend style="font-weight: bold; font-size: 24px; text-align: center">Thông Tin Nhân Viên</legend>
                    <p>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p>
                    <table class="table table-striped" style="color: black; font-weight: bold">
                        <tbody>
                        <tr>
                            <td>ID Nhân Viên:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeId()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Họ Và Tên:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeName()}"/>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>Ngày Sinh:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeBirthday()}"/>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>Số CMND:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeIdCard()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Lương:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeSalary()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>SĐT:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeePhone()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeMail()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Địa Chỉ (Tỉnh/Thành Phố):</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getEmployeeAddress()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Vị Trí:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['deleteEmployee'].getPositionId() == 1}">Lễ Tân</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getPositionId() == 2}">Giám Đốc</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getPositionId() == 3}">Quản Lý</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getPositionId() == 4}">Phục Vụ</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getPositionId() == 5}">Chuyên Viên</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getPositionId() == 6}">Giám Sát</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Trình Độ:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['deleteEmployee'].getEducationDegreeId() == 10}">Đại Học</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getEducationDegreeId() == 11}">Trung Cấp</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getEducationDegreeId() == 12}">Cao Đẳng</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getEducationDegreeId() == 13}">Sau Đại Học</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Bộ Phận:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['deleteEmployee'].getDivisionId() == 100}">Sale-Marketing</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getDivisionId() == 101}">Phục Vụ</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getDivisionId() == 102}">Quản Lý</c:when>
                                    <c:when test="${requestScope['deleteEmployee'].getDivisionId() == 103}">Hành Chính</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td>
                                <c:out value="${requestScope['deleteEmployee'].getUsername()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" class="btn btn-danger" name="action" value="delete">Bạn Có Chắc
                                    Muốn Xóa?
                                </button>
                                <input type="hidden" name="employee-id" value="${requestScope['deleteEmployee'].getEmployeeId()}"/>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/employee?action=home"
                                   class="btn btn-success">Quay Về Trang Chủ</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
        </c:if>
</body>
</html>
