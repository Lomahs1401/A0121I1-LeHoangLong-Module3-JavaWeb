<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/image/favicon.ico"/>"/>
    <title>Furama Resort Danang</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <style>
        :root {
            --my-color: #046056;
        }

        body {
            background-image: url("image/FuramaBackground.jpg");
            background-size: contain;
            background-position: right;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        .header-top {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
        }

        .header-top-left {
            display: flex;
            flex: 1;
        }

        .header-top-left img {
            display: block;
            height: 100px;
            width: auto;
            margin: auto;
        }

        .header-top-middle {
            display: flex;
            flex: 3;
        }

        .header-top-middle h1 {
            margin: auto;
        }

        .header-top-middle h1::selection {
            background: var(--my-color);
            color: white;
        }

        .header-top-right {
            display: flex;
            flex: 1;
        }

        .header-top-right ul {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin: auto;
        }

        .header-top-right ul li {
            list-style-type: none;
            padding: 12px 16px;
        }

        .header-top-right ul li a {
            font-size: 24px;
            color: black;
            text-decoration: none;
        }

        .header-top-right ul li a:hover {
            color: var(--my-color);
            text-decoration: none;
            font-weight: bold;
        }

        nav {
            background-color: var(--my-color);
        }

        nav > a {
            display: flex !important;
        }

        nav a img {
            margin: auto;
        }

        nav ul li {
            margin: auto;
            padding: 0 16px;
        }

        .nav-link {
            color: white !important;
        }

        .nav-link:hover {
            color: white !important;
            background: #067063;
        }

        .btn:hover {
            background: #067063;
        }

        .dropdown-toggle {
            background: var(--my-color);
            font-size: 28px;
            border: none;
            color: white;
            box-shadow: none !important;
        }

        .dropdown-item:hover {
            background: var(--my-color);
            color: white;
            font-weight: bold;
        }

        .carousel {
            margin-bottom: 150px;
        }

        .carousel-inner img {
            background-size: 100% 100%;
        }

        .carousel-item {
            position: absolute;
        }

        .carousel-caption {
            position: absolute;
            top: 40%;
            left: 20%;
        }

        .carousel-caption h1 {
            font-weight: bold;
            font-size: 40px;
            font-family: Arial, serif;
            background: rgba(4, 96, 86, 0.7);
            color: white;
        }

        footer {
            background-color: rgb(173, 220, 207);
        }

        footer .container {
            display: flex;
        }

        .container-left {
            background: #ece3e3;
            padding: 65px 45px 30px 45px;
            margin-right: 80px;
            flex: 2;
        }

        .container-left__color {
            color: #cbbe73;
        }

        .map p a {
            background: var(--my-color);
            color: lightgray;
            font-size: 40px;
            padding: 10px 40px 10px 15px;
        }

        .map p a:hover {
            background: var(--my-color);
            color: white;
            font-size: 40px;
            text-decoration: none;
        }

        .container-right {
            padding: 65px 45px;
            flex: 1.5;
        }

        .container-right__color {
            color: #cbbe73;
        }

        .container-right p a {
            color: black;
        }

        .container-right p a:hover {
            text-decoration: none;
            color: var(--my-color);
            font-weight: bold;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-top">
        <div class="header-top-left">
            <img src="image/logo.png" alt="Logo Furama Resort"/>
        </div>
        <div class="header-top-middle">
            <h1>CHÀO MỪNG ĐẾN VỚI ĐÀ NẴNG FURAMA RESORT</h1>
        </div>
        <div class="header-top-right">
            <ul>
                <li>
                    <a href="#">EN</a>
                </li>
                <li>
                    <a href="#">VI</a>
                </li>
                <li>
                    <a href="#">JP</a>
                </li>
                <li>
                    <a href="#">KR</a>
                </li>
                <li>
                    <a href="#">RU</a>
                </li>
                <li>
                    <a href="#">CN</a>
                </li>
            </ul>
        </div>
    </div>
    <nav class="nav navbar-expand-md justify-content-around">
        <a class="navbar-brand" href="#">
            <img src="image/popup-Furama-01.png" alt="Logo" style="width: 100px;"/>
        </a>
        <ul class="navbar-nav justify-content-between">
            <li class="nav-item">
                <h3>
                    <a class="nav-link" href="<c:url value="/customer?action=home"/>">Trang chủ</a>
                </h3>
            </li>
            <li class="nav-item dropdown">
                <button class="btn dropdown-toggle" data-toggle="dropdown">Nhân Viên</button>
                <ul class="dropdown-menu">
                    <a class="dropdown-item" href="<c:url value="/employee?action=create"/>">Thêm Nhân Viên</a>
                    <a class="dropdown-item" href="<c:url value="/employee?action=list"/>">Danh Sách Nhân Viên</a>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <button class="btn dropdown-toggle" data-toggle="dropdown">Khách Hàng</button>
                <ul class="dropdown-menu">
                    <a class="dropdown-item" href="<c:url value="/customer?action=create"/>">Thêm Khách Hàng</a>
                    <a class="dropdown-item" href="<c:url value="/customer?action=list"/>">Danh Sách Khách Hàng</a>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <button class="btn dropdown-toggle" data-toggle="dropdown">Dịch Vụ</button>
                <ul class="dropdown-menu">
                    <a class="dropdown-item" href="<c:url value="/service?action=create"/>">Thêm Dịch Vụ</a>
                    <a class="dropdown-item" href="<c:url value="/service?action=list"/>">Xem Danh Sách Dịch Vụ</a>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <button class="btn dropdown-toggle" data-toggle="dropdown">Hợp Đồng</button>
                <ul class="dropdown-menu">
                    <a class="dropdown-item" href="<c:url value="/contract?action=create"/>">Thêm Hợp Đồng</a>
                    <a class="dropdown-item" href="<c:url value="/contract?action=list"/>">Xem Danh Sách Hợp Đồng</a>
                </ul>
            </li>
        </ul>
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="text" placeholder="Tìm kiếm"/>
            <button class="btn btn-info" type="submit">Tìm Kiếm</button>
        </form>
    </nav>
</header>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ul>
    <div class="carousel-inner" role="listbox" style="height: 100vh">
        <div class="carousel-item active">
            <img class="d-block w-100" src="image/Furama-resort-danang-1.jpg" alt="First slide">
            <div class="carousel-caption">
                <h1>KHU NGHỈ DƯỠNG ẨM THỰC TOẠ LẠC TẠI ĐÀ NẴNG <br/> MỘT TRONG 6 BÃI BIỂN ĐẸP NHẤT THẾ GIỚI</h1>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="image/Furama-resort-danang-2.jpg" alt="Second slide">
            <div class="carousel-caption">
                <h1>KHU NGHỈ DƯỠNG ẨM THỰC TOẠ LẠC TẠI ĐÀ NẴNG <br/> MỘT TRONG 6 BÃI BIỂN ĐẸP NHẤT THẾ GIỚI</h1>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="image/Furama-resort-danang-4.jpg" alt="Third slide">
            <div class="carousel-caption">
                <h1>KHU NGHỈ DƯỠNG ẨM THỰC TOẠ LẠC TẠI ĐÀ NẴNG <br/> MỘT TRONG 6 BÃI BIỂN ĐẸP NHẤT THẾ GIỚI</h1>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="image/Garden-Superior-Furama-resort-danang-3.jpg" alt="Third slide">
            <div class="carousel-caption">
                <h1>KHU NGHỈ DƯỠNG ẨM THỰC TOẠ LẠC TẠI ĐÀ NẴNG <br/> MỘT TRONG 6 BÃI BIỂN ĐẸP NHẤT THẾ GIỚI</h1>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<footer>
    <div class="container">
        <div class="container-left">
            <h1 class="container-left__color">Hướng Dẫn Di Chuyển</h1>
            <p>Khu nghỉ dưỡng Furama là cơ sở hàng đầu để khám phá một trong những điểm đến hấp dẫn nhất Châu Á. Chỉ
                cách Đà Nẵng một quảng lái xe ngắn là bốn Di sản Văn hoá Thế giới được UNESCO công nhận:</p>
            <div class="map">
                <p>
                    <a href="#">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>Xem Trên Bản Đồ</span>
                    </a>
                </p>
            </div>
            <h3 class="container-left__color">Địa điểm</h3>
            <table class="table">
                <tbody>
                <tr>
                    <td>1.</td>
                    <td>Cố đô Huế</td>
                    <td>2 tiếng</td>
                </tr>
                <tr>
                    <td>2.</td>
                    <td>Phố cổ Hội An</td>
                    <td>30 phút</td>
                </tr>
                <tr>
                    <td>3.</td>
                    <td>Thánh địa Mỹ Sơn</td>
                    <td>90 phút</td>
                </tr>
                <tr>
                    <td>4.</td>
                    <td>Động Phong Nha</td>
                    <td>3 tiếng</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="container-right">
            <h2 class="container-right__color">Liên hệ</h2>
            <p><span style="color: var(--my-color);"><i class="fa fa-map-marker" aria-hidden="true"></i></span>
                103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</p>
            <p><span style="color: var(--my-color);"><i class="fa fa-phone" aria-hidden="true"></i></span>
                Tel: 84-236-3847 333/888 * Fax: 84-236-3847 666</p>
            <p><span style="color: var(--my-color);"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                Email: <a href="#">reservation@furamavietnam.com</a></p>
            <p><span style="color: var(--my-color);"><i class="fa fa-google" aria-hidden="true"></i></span>
                Website: <a href="#">www.furamavietnam.com</a></p>
            <h3>@ 2018 Furama Resort Danang</h3>
        </div>
    </div>
</footer>
</body>
</html>