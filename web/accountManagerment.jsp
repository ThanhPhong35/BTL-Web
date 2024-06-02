
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
    <div class="admin-panel">
        <%@include file="layout/sidebar.jsp" %>
        
        <div class="content">
        
            <div class="ifomation">
                <i class="fa-regular fa-bell"></i>
                <div>
                    <img src="">
                    <span>Xin chào Admin</span>
                </div>
            </div>
            <div class="main">
                <div id="tab3" class="tab-content">
                    <form class="search-container" action="search-account" method="get">
                        <input id="search-box" value="${txt}" type="text" class="search-box" name="txt" />
                        <button type="submit" id="search-submit" ><i class="fas fa-search search-icon"></i></button>
                    </form>
                    <a class="add" onclick="openAdd()">
                        <i class="fa-solid fa-plus"></i>
                        <span>Thêm mới</span>
                    </a>
                    <div class="newest">
                        <span>
                            Tài khoản mới nhất
                        </span>
                        <table>
                            <tr>
                                <td>
                                    ${newest.userid}
                                </td>
                                <td>
                                    ${newest.fullname}
                                </td>
                                <td>
                                    ${newest.username}
                                </td>
                                <td>
                                    ${newest.password}
                                </td>
                                <td class="status center">
                                    <c:if test="${newest.status==1}">
                                        <a href='#' class="active" onclick="inactivateAccount(event, ${newest.userid})">Mở</a>
                                    </c:if>
                                    <c:if test="${newest.status==0}">
                                        <a href='#' class="inactive" onclick="activateAccount(event, ${newest.userid})">Khóa</a>
                                    </c:if>
                                </td>
                                <td class="position center">
                                    <c:if test="${newest.roleid==1}">
                                        <a class="inactive">Admin</a>
                                    </c:if>
                                    <c:if test="${newest.roleid==2}">
                                        <a>Khách hàng</a>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </div>
<!--                    Bảng Account-->
                    <div class="result">
                        <table>
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Tên đầy đủ
                                </th>
                                <th>
                                    Tên đăng nhập
                                </th>
                                <th>
                                    Mật khẩu
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Điện thoại
                                </th>
                                <th>
                                    Trạng thái
                                </th>
                                <th class="position center">
                                    Vị trí
                                </th>
                                <th class="center">
                                    Hành động
                                </th>
                            </tr>
                            <c:forEach items="${requestScope.a}" var="c">
                                <tr>
                                    <td>
                                        ${c.userid}
                                    </td>
                                    <td>
                                        ${c.fullname}
                                    </td>
                                    <td>
                                        ${c.username}
                                    </td>
                                    <td>
                                        ${c.password}
                                    </td>
                                    <td>
                                        ${c.email}
                                    </td>
                                    <td>
                                        ${c.phone}
                                    </td>
                                    <td class="status center">
                                        <c:if test="${c.status==1}">
                                            <a href='#' class="active" onclick="inactivateAccount(event, ${c.userid})">Mở</a>
                                        </c:if>
                                        <c:if test="${c.status==0}">
                                            <a href='#' class="inactive" onclick="activateAccount(event, ${c.userid})">Khóa</a>
                                        </c:if>
                                    </td>
                                    <td class="position center">
                                        <c:if test="${c.roleid==1}">
                                            <a class="inactive">Admin</a>
                                        </c:if>
                                        <c:if test="${c.roleid==2}">
                                            <a>Khách hàng</a>
                                        </c:if>
                                    </td>
                                    <td class="center">
                                        <a href="update-account?id=${c.userid}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                        <a href="#" onclick="confirmDeleteAccount(event, ${c.userid});">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
<!--                    End table Account-->

                    <div class="overlay" id="overlay"></div>
                    
<!--                    add Account-->
                    <div class="modal" id="add-new">
                        <div class="header">
                            <span>Thêm tài khoản</span>
                            <i class="fa-solid fa-xmark" onclick="closeAdd()"></i>
                        </div>
                        <div class="form">
                            <form class="infor" action="add-account" method="post">
                                <table>

                                    <tr>
                                        <td>
                                            Tên đầy đủ
                                        </td>
                                        <td>
                                            <input type="text" name="fullname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Tên đăng nhập
                                        </td>
                                        <td>
                                            <input type="text" name="username">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mật khẩu
                                        </td>
                                        <td>
                                            <input type="text" name="password">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Email
                                        </td>
                                        <td>
                                            <input type="email" name="email">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Điện thoại
                                        </td>
                                        <td>
                                            <input type="text" name="phone">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Vị trí
                                        </td>
                                        <td>
                                            <input type="radio" name="roleid" value="1">  Admin
                                            <input type="radio" name="roleid" value="2">  User
                                        </td>
                                    </tr>
                                    
                                </table>
                                <input type="submit" value="Lưu">
                            </form>
                        </div>   
                    </div>
<!--                            End add Account-->
                   
                </div>        
<!--    End Category                       -->
            </div>   
        </div>
    </div>
    <script src="js/admin/main.js">

    </script>
</body>
</html>


