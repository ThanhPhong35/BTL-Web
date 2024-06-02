<%-- 
    Document   : changPass
    Created on : Sep 13, 2023, 11:52:07 AM
    Author     : YOU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/changepass.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="main">
            <div class="changpass">
                <form action="changepassword" method="post">
                    <p>
                        Đổi mật khẩu
                    </p>
                    <span class="error" id="confirmError" style=""></span>
                    <table>
                        <tr>
                            <td>
                                Nhập mật khẩu
                            </td>
                            <td>
                                <input type="password" id="password" name="password" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nhập lại mật khẩu
                            </td>
                            <td>
                                <input type="password" id="confirm-password" name="confirmpassword" required="true">
                            </td>
                        </tr>
                        
                    </table>
                    <input type="checkbox" id="showPassword" onchange="togglePassword()"> Hiện  mật khẩu
                    </br>
                    <input type="submit" onclick="checkConfirmPass()" value="Lưu">
                </form>
            </div>
        </div>
        <script src="js/scripts.js">
            
        </script>
    </body>
</html>
