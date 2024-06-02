<%-- 
    Document   : sidebar
    Created on : Sep 26, 2023, 9:58:53 PM
    Author     : YOU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/admin/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <title>Admin panel</title>
</head>
<body>        
    <div class="sidebar">
        <div class="logo">
            <img src="">
            <p>Shoe'
                <span>s</span>
            </p>
        </div>
        <ul>
            <li><a href="admin-dashboard" name="tab1"><i class="fa-solid fa-house"></i>Tổng quan</a></li>
            <li><a href="account-managerment" name="tab2"><i class="fa-solid fa-users"></i>Tài khoản</a></li>
            <li><a href="category-managerment" name="tab3"><i class="fa-solid fa-list"></i>Danh mục</a></li>
            <li><a href="product-managerment" name="tab4"><i class="fa-solid fa-box"></i></i>Sản phẩm</a></li>
            <li><a href="order-managerment" name="tab5"><i class="fa-solid fa-cart-shopping"></i>Đơn hàng</a></li>
            <li><a href="logout" name="tab6"><i class="fa-solid fa-right-from-bracket"></i></i>Đăng xuất</a></li>
        </ul>
    </div>
    <script src="js/admin/main.js">
    </script>
</body>
</html>


