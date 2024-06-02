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
<!--                    edit Product-->
    <div class="main-edit">
        <div class="edit" id="update">
            <div class="header">
                <span>Sửa sản phẩm</span>
                <i class="fa-solid fa-xmark" onclick="confirmExitProduct()" ></i>
            </div>
            <div class="form">
                <form class="infor" action="update-product" method="post" enctype="multipart/form-data">
                    <table>     
                        <input type="hidden" name="id" value="${pd.id}" id="">
                        </tr>
                        <tr>
                            <td>
                                Tên sản phẩm
                            </td>
                            <td>
                                <input type="text" name="name" value="${pd.name}" id="">
                            </td>
                            <td>
                                Hãng
                            </td>
                            <td>
                                <select name="cid" id="">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.cid}" ${c.cid eq pd.category.getCid() ? "selected" : ""}>${c.cname}</option>
                                    </c:forEach>  
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Ảnh
                            </td>
                            <td>
                                <div class="photo">
                                    <input type="hidden" name="img" value="${pd.image}">
                                    <img src="${pd.image}">
                                </div>
                               <input type="file" name="image" value="${pd.image}" id="">
                            </td>
                            
                            <td>
                                Chủ đề sản phẩm
                            </td>
                            <td>
                                <textarea name="title" value="${pd.title}" id=""></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Giá sản phẩm
                            </td>
                            <td>
                                <input type="text" name="price" value="${pd.price}" id="">
                            </td>
                            <td>
                                Mô tả
                            </td>
                            <td>
                                <textarea name="des" value="${pd.des}"></textarea>
                            </td>
                        </tr>
                        <tr>
                            
                        </tr>
                        <tr>
                            
                        </tr>
                        <tr>
                            
                        </tr>
                    </table>
                    <input type="submit" value="Lưu">
                </form>
            </div>   
        </div>
<!--                            End edit Product-->
    </div>

    <script src="js/admin/main.js">

    </script>
</body>
</html>
