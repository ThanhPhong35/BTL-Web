<%-- 
    Document   : adminhome
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
    <link rel="stylesheet" href="css/admin/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <title>Admin panel</title>
</head>
<body>
<!--                    edit Account-->
    <div class="main-edit">
        <div class="edit" id="update">
            <div class="header">
                <span>Sửa tài khoản</span>
                <i class="fa-solid fa-xmark" onclick="confirmExitAccount()" ></i>
            </div>
            <div class="form">
                <form class="infor" action="update-account" method="post">
                    <table>
                        <tr>
                            <td>
                                ID
                            </td>
                            <td>
                                <input type="text" name="userid" value="${a.userid}" readonly>
                            </td>
                        </tr>
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
                        <tr>
                            <td>
                                Vị trí
                            </td>
                            <td>
                                <input type="radio" name="roleid" value="1" ${a.roleid==1 ? "checked" : ""}>  Admin
                                <input type="radio" name="roleid" value="2" ${a.roleid==2 ? "checked" : ""}>  User
                            </td>
                        </tr>

                    </table>
                    <input type="submit" value="Lưu">
                </form>
            </div>   
        </div>
<!--                            End edit Account-->
    </div>

    <script src="js/admin/main.js">

    </script>
</body>
</html>


