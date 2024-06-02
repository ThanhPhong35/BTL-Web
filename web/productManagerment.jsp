
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
                    <form class="search-container" action="search-product" method="get">
                        <input id="search-box" value="${txt}" type="text" class="search-box" name="txt" />
                        <button type="submit" id="search-submit" ><i class="fas fa-search search-icon"></i></button>
                    </form>
                    <a class="add" onclick="openAdd()">
                        <i class="fa-solid fa-plus"></i>
                        <span>Thêm mới</span>
                    </a>
                    <div class="newest">
                        <span>
                            Sản phẩm mới nhất
                        </span>
                        <table>
                            <tr>
                                <td>
                                    ${newest.id}
                                </td>
                                <td>
                                    ${newest.name}
                                </td>
                                <td class="picture">
                                    <img src="${newest.image}">
                                </td>
                                <td >
                                    ${newest.price}
                                </td>
                            </tr>
                        </table>
                    </div>
<!--                    Bảng Product-->
                    <div class="result">
                        <table>
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Tên sản phẩm
                                </th>
                                <th class="center">
                                    Hình ảnh
                                </th>
                                <th>
                                    Giá
                                </th>
                                <th>
                                    Chủ đề
                                </th>
                                <th>
                                    Hãng
                                </th>
                                <th class="center">
                                    Hành động
                                </th>
                            </tr>
                            <c:forEach items="${p}" var="p">
                                <tr>
                                    <td>
                                        ${p.id}
                                    </td>
                                    <td>
                                        ${p.name}
                                    </td>
                                    <td class="picture center">
                                        <img src="${p.image}">
                                    </td>
                                    <td>
                                        ${p.price}
                                    </td>
                                    <td class="title">
                                        ${p.title}
                                    </td>
                                    <td>
                                         ${p.category != null ? p.category.getCname() : 'Unknown Category'}
                                    </td>
                               
                                    <td class="center">
                                        <a href="update-product?id=${p.id}"">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                        <a href="#" onclick="confirmDeleteProduct(event, ${p.id});">
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
                            <span>Thêm sản phẩm</span>
                            <i class="fa-solid fa-xmark" onclick="closeAdd()"></i>
                        </div>
                        <div class="form">
                            <form class="infor" action="add-product" method="post" enctype="multipart/form-data">
                                <table>
                                    <tr>
                                        <td>
                                            Tên sản phẩm
                                        </td>
                                        <td>
                                            <input type="text" name="name" value="${pd.name}" id="">
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            Ảnh
                                        </td>
                                        <td>
                                           <input type="file" name="image" value="${pd.image}" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Giá sản phẩm
                                        </td>
                                        <td>
                                            <input type="text" name="price" value="${pd.price}" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Chủ đề
                                        </td>
                                        <td>
                                            <input type="text" name="title" value="${pd.title}" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mô tả
                                        </td>
                                        <td>
                                            <textarea name="des" value="${pd.des}"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Hãng
                                        </td>
                                        <td>
                                            <select name="cid" id="">
                                                <c:forEach items="${listC}" var="c">
                                                    <option value="${c.cid}" selected>${c.cname}</option>
                                                </c:forEach>   
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" value="Lưu">
                            </form>
                        </div>   
                    </div>
<!--                            End add Account-->
                            
<!--    End Category                       -->
            </div>   
        </div>
    </div>
    <script src="js/admin/main.js">

    </script>
</body>
</html>


