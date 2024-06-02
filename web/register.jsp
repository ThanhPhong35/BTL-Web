<%-- 
    Document   : sign-up.jsp
    Created on : Oct 31, 2023, 11:02:57 PM
    Author     : YOU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/register.css"/>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Đăng ký</title>
    </head>
    <body>
        <div class="signup_form" style="width: 100%; height: 100vh;background-image: url(image/loging_bg.png);background-size: cover; background-position: center;">
        <div class="left">
            <img src="image/logshoes.png">
        </div>
        <form action="register" method="post" id="signupForm" class="right">
            <h1>Đăng ký</h1>
            <p class="text-warning" style="color:red; text-align: center; font-size:18px">${notice}</p>
            <div>
                <p class="label">
                    <span>Tên đăng nhập</span>
                    <span class="error" id="usernameError"></span>
                </p>
                <div class="user box">
                    <i class="fa-solid fa-user icon"></i>
                    <input type="text" name="user" placeholder="Tên đăng nhập" class="text-input" id="username">
                </div>
                <p class="label">
                    <span>Email</span>
                    <span class="error" id="emailError"></span>
                </p>
                <div class="email box">
                    <i class="fa-solid fa-user icon"></i>
                    <input type="text" name="email" placeholder="Email@gmail.com" class="text-input" id="email">
                </div>
                <p class="label">
                    <span>Mật khẩu</span>
                    <span class="error" id="passwordError"></span>
                </p>
                <div class="password box">
                    <i class="fa-solid fa-lock icon"></i>
                    <input type="password" name="pass" placeholder="Mật khẩu" class="text-input" id="password">
                </div>
                <p class="label">
                    <span>Nhập lại mật khẩu</span>
                    <span class="error" id="confirmError"></span>
                </p>
                <div class="confirm-password box">
                    <i class="fa-solid fa-lock icon"></i>
                    <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" class="text-input" id="confirm-password">
                </div>

                <p class="loging">
                    <span>Bạn đã có tài khoản?</span>
                    <a href="login" class="login">Đăng nhập</a>
                </p>
                <button type="submit" onclick="checkSign()">Đăng ký</button>
            </div>
        </form>
    </div>
    <script src="js/scripts.js"></script>
</body>
</html>

