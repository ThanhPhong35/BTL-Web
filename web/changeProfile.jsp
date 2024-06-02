<%-- 
    Document   : changeProfile
    Created on : Dec 13, 2023, 3:01:47 PM
    Author     : YOU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Profile</title>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/changeprofile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <div class="main-edit">
        <div class="edit" id="update">
            <div class="header">
                <span>Thông tin tài khoản</span>
                <i class="fa-solid fa-xmark" onclick="confirmExitAccount()" ></i>
            </div>
            <div class="form">
                <form class="infor" action="changeprofile" method="post">
                    <table>
                        <c:set var="a" value="${sessionScope.account}"/>
                        <tr>
                            <td>
                                Tên đầy đủ
                            </td>
                            <td>
                                <input type="text" name="fullname" value="${a.fullname}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tên đăng nhập
                            </td>
                            <td>
                                <input type="text" name="username" value="${a.username}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật khẩu
                            </td>
                            <td>
                                <input type="text" name="password" value="${a.password}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email
                            </td>
                            <td>
                                <input type="email" name="email" value="${a.email}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Điện thoại
                            </td>
                            <td>
                                <input type="text" name="phone" value="${a.phone}">
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Lưu">
                </form>
            </div>   
        </div>
<!--                            End edit Account-->
    </div>

    <script src="js/scripts.js">

    </script>
    </body>
</html>
