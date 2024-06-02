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
        <link rel="stylesheet" href="css/login.css"/>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Đăng Nhập</title>
    </head>
    <body>
        <div class="login_form" style="width: 100%; height: 100vh;background-image: url(image/loging_bg.png);background-size: cover; background-position: center;">
        <div class="left">
            <img src="image/logshoes.png">
        </div>
        <form action="login" method="post" id="loginForm" class="right">
            <h1>Đăng nhập</h1>
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
                    <span>Mật khẩu</span>
                    <span class="error" id="passwordError"></span>
                </p>
                <div class="password box">
                    <i class="fa-solid fa-lock icon"></i>
                    <input type="password" name="pass" placeholder="Mật khẩu" class="text-input" id="password">
                </div>
                 <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Nhớ mật khẩu</label>
                </div>
                <button type="submit" onclick="checkLogin()">Đăng nhập</button>
                <div class="seperate">
                    <div class="line">
                        <hr>
                    </div>
                    <span>Hoặc</span>
                    <div class="line"></div>
                </div>
                <div class="differ-login">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/shopping/login-google&response_type=code&client_id=948154573898-k0ur2s7iucotp8mi4s4kiil8nraoqfds.apps.googleusercontent.com&approval_prompt=force" class="google-login-btn differ-btn">
                        <img src="image/google.png" alt="Đăng nhập với Google"/>
                        <span>Google</span>
                    </a>
                    <a href="#" class="face-login-btn differ-btn">
                        <img src="image/facebook.png" alt="Đăng nhập với Google"/>
                        <span>Facebook</span>
                    </a>
                </div>
                
                <p class="register">
                    <span>Bạn đã chưa tài khoản?</span>
                    <a href="register" class="login">Đăng ký</a>
                </p>
            </div>
        </form>
    </div>
    <script src="js/scripts.js"></script>
</body>
</html>

