<%-- 
    Document   : header
    Created on : Aug 31, 2023, 2:22:36 PM
    Author     : YOU
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Document</title>
</head>
<body>
    <header>
        <div class="header-main">
            <div class="infor">
                <div class="sale">
                    <a href="#" class="channel" >Kênh người bán</a>
                    <a href="#" class="saler">Trở thành người bán</a>
                    <span href="#" class="contact">
                        Kết nối
                        <a href="#"> <i class="fa-brands fa-facebook"></i></a>
                        <a href="#"> <i class="fa-brands fa-instagram"></i></a>
                        <a href="#"> <i class="fa-brands fa-tiktok"></i></a>
                    </span>

                </div>

                <div class="notice-support">
                    <div>
                        <i class="fa-solid fa-bell"></i>
                        <a href="#" class="notice">Thông báo</a>
                    </div>
                    <div>
                        <i class="fa-solid fa-circle-question"></i> 
                        <a href="#" class="support">Hỗ trợ</a>
                    </div>
                </div>
                <c:if test="${sessionScope.account != null}">
                    <div class="infor-user">
                        <div class="menu">
                          
                            <div class="user">
                                <span>Xin chào, ${sessionScope.account.username}</span>
                                <div class="dropdown">
                                    <a href="changeprofile">
                                        Thông tin
                                    </a>
                                    <a href="changepassword">
                                        Đổi mật khẩu
                                    </a>
                                    <a href="order">
                                        Đơn hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div>
                            <a href="logout" class="logout">Đăng xuất</a>
                        </div>    
                    </div>      
                </c:if>
                <c:if test="${sessionScope.account == null}">  
                    <div class="log-sign">
                        <a href="login" class="login">Đăng nhập</a>
                        <a href="register" class="signup">Đăng ký</a>
                    </div>
                </c:if>
            </div>
            
            <div class="form-search">
                <div class="logo">
                    <h1>Shoe<span>s</span></h1>
                </div>
                <form class="search" action="searchproduct" method="get">
                    <input type="text" name="product" placeholder="Nhập tên sản phẩm" class="search-input" required>
                    <button type="submit" class="search-button"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
                <div class="cart">
                    <a href="cart">
                        <img src="image/shopping_cart.png">
                    </a>
                </div>
                <div class="size" style="position: relative; width: 20px; height: 20px; border: 1px solid red; border-radius: 50%; background-color: red;text-align: center; color: white; right: 85px;top: 10px"> 
                    <c:if test="${sessionScope.size != null}">
                        ${sessionScope.size}
                    </c:if>
                    <c:if test="${sessionScope.size == null}">
                        0
                    </c:if>
                </div>
            </div>

            <div class="nav">
                <ul>
                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li>
                            <a  href="admin panel">
                                Trang Admin
                            </a>
                        </li>
                    </c:if>
                    
                    <li>
                        <a href="home">Trang chủ</a>
                    </li>
                    <li>
                        <a href="#Category">Sản phẩm</a>
                    </li>
                    <li>
                        <a href="aboutUs.jsp">Về chúng tôi</a>
                    </li>
                    <li>
                        <a href="#Servises">Dịch vụ</a>
                    </li>
                </ul>
            </div>

        </div>
    </header>
    <script>
    </script>
</body>
</html>