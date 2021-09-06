<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/image/favicon.ico"/>"/>
    <title>CRUD Customer</title>
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
            background-image: url("/image/Furama_Resort_Danang-3.jpg");
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
            background-color: #23d5f3;
            opacity: 0.8;
        }

        .mainCreate, .mainUpdate {
            height: 29em;
        }

        .mainDelete {
            height: 36em;
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
    <c:if test="${requestScope['updateCustomer'] == null && requestScope['deleteCustomer'] == null}">
        <div class="mainCreate">
            <form action="${pageContext.request.contextPath}/customer" method="post">
                <fieldset class="createForm">
                    <legend style="color: black; font-weight: bold; font-size: 24px; text-align: center">Khách Hàng Mới</legend>
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
                                <label for="name">Họ và tên:</label>
                            </td>
                            <td>
                                <input type="text" name="name" id="name">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Loại Khách:</label>
                            </td>
                            <td>
                                <label>
                                    <select name="customer-type">
                                        <option value="diamond">Diamond</option>
                                        <option value="platinum">Platinum</option>
                                        <option value="gold">Gold</option>
                                        <option value="silver">Silver</option>
                                        <option value="member">Member</option>
                                    </select>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="birthday">Ngày Sinh:</label>
                            </td>
                            <td>
                                <input type="date" name="birthday" id="birthday">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>Giới Tính:</label>
                            </td>
                            <td>
                                <label for="male">Nam</label>
                                <input type="radio" name="gender" id="male" value="male" checked
                                       style="box-shadow: none">
                                <label for="female">Nữ</label>
                                <input type="radio" name="gender" id="female" value="female" style="box-shadow: none">
                                <label for="other">Khác</label>
                                <input type="radio" name="gender" id="other" value="other" style="box-shadow: none">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="id-card">Số CMND:</label>
                            </td>
                            <td>
                                <input type="text" name="id-card" id="id-card">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="phone-number">Số điện thoại:</label>
                            </td>
                            <td>
                                <input type="text" name="phone-number" id="phone-number">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="email">Email:</label>
                            </td>
                            <td>
                                <input type="text" name="email" id="email">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="address">Địa chỉ (Tỉnh/Thành Phố):</label>
                            </td>
                            <td>
                                <input type="text" name="address" id="address">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Thêm Khách Hàng!" class="btn btn-primary">
                                <input type="hidden" name="action" value="create"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
    </c:if>
    <c:if test="${requestScope['updateCustomer'] != null}">
        <div class="mainUpdate">
            <form action="${pageContext.request.contextPath}/customer" method="post">
                <fieldset class="updateForm">
                    <legend style="font-weight: bold; font-size: 24px; text-align: center">Thông Tin Khách Hàng</legend>
                    <p>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p>
                    <table>
                        <tbody>
                        <tr>
                            <td>
                                <label for="new-name">Họ và tên:</label>
                            </td>
                            <td>
                                <input type="text" name="name" id="new-name"
                                       value="${requestScope['updateCustomer'].getCustomerName()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Loại Khách:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerTypeId() == 82091}">
                                        <label>
                                            <select name="customer-type">
                                                <option value="diamond" selected="selected">Diamond</option>
                                                <option value="platinum">Platinum</option>
                                                <option value="gold">Gold</option>
                                                <option value="silver">Silver</option>
                                                <option value="member">Member</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerTypeId() == 81038}">
                                        <label>
                                            <select name="customer-type">
                                                <option value="diamond">Diamond</option>
                                                <option value="platinum" selected="selected">Platinum</option>
                                                <option value="gold">Gold</option>
                                                <option value="silver">Silver</option>
                                                <option value="member">Member</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerTypeId() == 89401}">
                                        <label>
                                            <select name="customer-type">
                                                <option value="diamond">Diamond</option>
                                                <option value="platinum">Platinum</option>
                                                <option value="gold" selected="selected">Gold</option>
                                                <option value="silver">Silver</option>
                                                <option value="member">Member</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerTypeId() == 88284}">
                                        <label>
                                            <select name="customer-type">
                                                <option value="diamond">Diamond</option>
                                                <option value="platinum">Platinum</option>
                                                <option value="gold">Gold</option>
                                                <option value="silver" selected="selected">Silver</option>
                                                <option value="member">Member</option>
                                            </select>
                                        </label>
                                    </c:when>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerTypeId() == 85714}">
                                        <label>
                                            <select name="customer-type">
                                                <option value="diamond">Diamond</option>
                                                <option value="platinum">Platinum</option>
                                                <option value="gold">Gold</option>
                                                <option value="silver">Silver</option>
                                                <option value="member" selected="selected">Member</option>
                                            </select>
                                        </label>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-birthday">Ngày Sinh:</label>
                            </td>
                            <td>
                                <input type="date" name="birthday" id="new-birthday"
                                       value="${requestScope['updateCustomer'].getCustomerBirthday()}"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>Giới Tính:</label>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerGender().equals('male')}">
                                        <label for="new-gender-male">Nam</label>
                                        <input type="radio" name="gender" id="new-gender-male" value="male" checked
                                               style="box-shadow: none">
                                        <label for="new-gender-female">Nữ</label>
                                        <input type="radio" name="gender" id="new-gender-female" value="female"
                                               style="box-shadow: none">
                                        <label for="new-gender-other">Khác</label>
                                        <input type="radio" name="gender" id="new-gender-other" value="other"
                                               style="box-shadow: none">
                                    </c:when>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerGender().equals('female')}">
                                        <label for="new-gender-male">Nam</label>
                                        <input type="radio" name="gender" id="new-gender-male" value="male"
                                               style="box-shadow: none">
                                        <label for="new-gender-female">Nữ</label>
                                        <input type="radio" name="gender" id="new-gender-female" value="female" checked
                                               style="box-shadow: none">
                                        <label for="new-gender-other">Khác</label>
                                        <input type="radio" name="gender" id="new-gender-other" value="other"
                                               style="box-shadow: none">
                                    </c:when>
                                    <c:when test="${requestScope['updateCustomer'].getCustomerGender().equals('other')}">
                                        <label for="new-gender-male">Nam</label>
                                        <input type="radio" name="gender" id="new-gender-male" value="male"
                                               style="box-shadow: none">
                                        <label for="new-gender-female">Nữ</label>
                                        <input type="radio" name="gender" id="new-gender-female" value="female"
                                               style="box-shadow: none">
                                        <label for="new-gender-other">Khác</label>
                                        <input type="radio" name="gender" id="new-gender-other" value="other" checked
                                               style="box-shadow: none">
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-id-card">Số CMND:</label>
                            </td>
                            <td>
                                <input type="text" name="id-card" id="new-id-card"
                                       value="${requestScope['updateCustomer'].getCustomerIdCard()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-phone-number">Số điện thoại:</label>
                            </td>
                            <td>
                                <input type="text" name="phone-number" id="new-phone-number"
                                       value="${requestScope['updateCustomer'].getCustomerPhone()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-email">Email:</label>
                            </td>
                            <td>
                                <input type="text" name="email" id="new-email"
                                       value="${requestScope['updateCustomer'].getCustomerEmail()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="new-address">Địa chỉ (Tỉnh/Thành Phố):</label>
                            </td>
                            <td>
                                <input type="text" name="address" id="new-address"
                                       value="${requestScope['updateCustomer'].getCustomerAddress()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Xác Nhận Cập Nhật!" class="btn btn-primary">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="id" value="${requestScope['updateCustomer'].getCustomerId()}"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
    </c:if>
    <c:if test="${requestScope['deleteCustomer'] != null}">
        <div class="mainDelete">
            <form action="${pageContext.request.contextPath}/customer" method="post">
                <fieldset class="deleteForm">
                    <legend style="font-weight: bold; font-size: 24px; text-align: center">Thông Tin Khách Hàng</legend>
                    <p>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p>
                    <table class="table table-striped" style="color: black; font-weight: bold">
                        <tbody>
                        <tr>
                            <td>ID Khách Hàng:</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerId()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Loại Khách:</td>
                            <td>
                                <c:choose>
                                    <c:when test="${requestScope['deleteCustomer'].getCustomerTypeId() == 82091}">
                                        <c:out value="${'Diamond'}"/>
                                    </c:when>
                                    <c:when test="${requestScope['deleteCustomer'].getCustomerTypeId() == 81038}">
                                        <c:out value="${'Platinum'}"/>
                                    </c:when>
                                    <c:when test="${requestScope['deleteCustomer'].getCustomerTypeId() == 89401}">
                                        <c:out value="${'Gold'}"/>
                                    </c:when>
                                    <c:when test="${requestScope['deleteCustomer'].getCustomerTypeId() == 88284}">
                                        <c:out value="${'Silver'}"/>
                                    </c:when>
                                    <c:when test="${requestScope['deleteCustomer'].getCustomerTypeId() == 85714}">
                                        <c:out value="${'Member'}"/>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>Họ Và Tên:</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerName()}"/>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>Ngày Sinh:</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerBirthday()}"/>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>Giới Tính:</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerGender()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Số CMND:</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerIdCard()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>SĐT:</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerPhone()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerEmail()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Địa Chỉ (Tỉnh/Thành Phố):</td>
                            <td>
                                <c:out value="${requestScope['deleteCustomer'].getCustomerAddress()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" class="btn btn-danger" name="action" value="delete">Bạn Có Chắc
                                    Muốn Xóa?
                                </button>
                                <input type="hidden" name="id" value="${requestScope['deleteCustomer'].getCustomerId()}"/>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/customer?action=home"
                                   class="btn btn-primary">Quay Về Trang Chủ</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
    </c:if>
</div>
</body>
</html>