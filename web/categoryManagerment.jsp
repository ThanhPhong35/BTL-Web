
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
                    <form class="search-container" action="search-category" method="get">
                        <input id="search-box" value="${txt}" type="text" class="search-box" name="txt" />
                        <button type="submit" id="search-submit" ><i class="fas fa-search search-icon"></i></button>
                    </form>
                    <a class="add" onclick="openAdd()">
                        <i class="fa-solid fa-plus"></i>
                        <span>Thêm mới</span>
                    </a>
                    
<!--                    Bảng Category-->
                    <div class="result">
                        
                        <table>

                                <tr>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Tên danh mục
                                    </th>
                                    <th class="picture center">
                                        Hình ảnh
                                    </th>
                                    <th class="center">
                                        Hành động
                                    </th>
                                </tr>
                                <c:forEach items="${requestScope.listC}" var="c">
                                    <tr>
                                        <td>
                                            ${c.cid}
                                        </td>
                                        <td>
                                            ${c.cname}
                                        </td>
                                        <td class="picture center">
                                            <img src="${c.cimage}" alt="">
                                        </td>          
                                        <td class="center">
                                            <a href="update-category?cid=${c.cid}"">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </a>
                                            <a href="#" onclick="confirmDeleteCategory(event, ${c.cid});">
                                                <i class="fa-solid fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                        </table>
                    </div>
<!--                    End table Categoey-->

                    <div class="overlay" id="overlay"></div>
                    
<!--                    add Category-->
                    <div class="modal" id="add-new">
                        <div class="header">
                            <span>Thêm danh mục</span>
                            <i class="fa-solid fa-xmark" onclick="closeAdd()"></i>
                        </div>
                        <div class="form">
                            <form class="infor" action="add-category" method="post" enctype="multipart/form-data">
                                <table>
                                    <input type="hidden" name="cid">
                                    <tr>
                                        <td>
                                            Tên danh mục
                                        </td>
                                        <td>
                                            <input type="text" name="cname" value="${c.cname}" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Ảnh
                                        </td>
                                        <td>
                                            <input type="file" name="cimage" value="${c.cimage}" id="">
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" value="Lưu">
                            </form>
                        </div>   
                    </div>
<!--                            End add Category-->
                </div>
<!--    End Category                       -->
            </div>   
        </div>
    </div>
    <script src="js/admin/main.js">

    </script>
</body>
</html>


