<%-- 
    Document   : home
    Created on : Oct 28, 2023, 8:58:42 PM
    Author     : YOU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="shortcut icon" href="image/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@include file="layout/header.jsp" %>
    <div class="container">
        <div class="big-img">
            <div class="big1">
                <img src="image/big1.jpg" alt="">
            </div>
            <div class="big2"> 
                <img src="image/big2.jpg" alt="">
            </div>
            <div class="big3">
                <img src="image/big3.jpg" alt="">
            </div>
            <div class="big4">
                <img src="image/big4.jpg" alt="">
            </div>
            <div class="big5">
                <img src="image/big5.jpg" alt="">
            </div>
        </div>
        <div class="newest">
            <p class="label">Sản phẩm mới nhất</p>
            <div class="newest-p">
                <c:forEach items="${listN}" var="n">
                    <a href="product-detail?pid=${n.id}">
                        <img src="${n.image}">
                        <p><span>đ</span>${n.price}</p>
                    </a>
                </c:forEach> 
            </div>
        </div>
<!--        <div class="banner backgroud">
            <div class="slider">
                <div class="hallo">
                    <img src="image/banner0.png" alt="">          
                </div>
                <div class="list">
                    <div class="item">
                        <img src="image/banner1.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="image/banner2.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="image/banner3.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="image/banner4.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="image/banner5.jpg" alt="">
                    </div>
                </div>
                <div class="buttons">
                    <button id="prev"><</button>
                    <button id="next">></button>
                </div>
                <ul class="dots">
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            <div class="hallo">
                <img src="image/hallo.png" alt="">          
            </div>
        </div>-->
        <!DOCTYPE html>
<!--        <div class="img-accordion">
            <div class="img img1">
                <p> nike potential 3 </p>
            </div>
            <div class="img img2">
                <p> air jordan 1 </p>
            </div>
            <div class="img img3">
                <p> air jordan 7 retro gc </p>
            </div>
            <div class="img img4">
                <p> air jordan 5 </p>
            </div>
            <div class="img img5">
                <p> nike air max </p>
            </div>
        </div>-->
        <!-- Categories -->
        <div class="categories" id="Category">
            <p class="label">Danh mục</p>
            <ul>
                <c:forEach items="${listC}" var="c">
                    <li class="type-product ${tag==c.cid ? "active" :"" }">
                        <a href="category?cid=${c.cid}#Category">
                            <img src="${c.cimage}" alt="" class="cate-img">
                            <span class="cate-title">${c.cname}</span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="allP backgroud">
            <p class="label">
                Tất cả các sản phẩm
            </p>
            <!--Products-->
            <div class="products" id="Products">
                <div class="box">
                    <c:forEach items="${listP}" var="x">
                        <div class="card">
                            <div class="small_card">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-solid fa-share"></i>
                            </div>

                            <div class="image">
                                <a href="product-detail?pid=${x.id}"><img src="${x.image}"></a>
                            </div>

                            <div class="products_text">
                                <p class="products_name">
                                    <a href="product-detail?pid=${x.id}">
                                        <span>[${x.name}]</span>
                                        ${x.title}
                                    </a>
                                <p>
                                <p class="products_price">
                                    Giá: ${x.price}   
                                <p>
                            </div>
                        </div>    
                    </c:forEach>
                </div>
            </div>
            <div class="page">
                <c:forEach begin="1" end="${endP}" var ="i">
                    <a class="${page == i ? "active":""}" href="home?index=${i}">
                        ${i}
                    </a>
                </c:forEach>
            </div>
        </div>
        <!--Services-->

        <div class="services backgroud" id="Servises">
            <h1>Dịch vụ<span>của chúng tôi</span></h1>

            <div class="services_cards">
                <div class="services_box">
                    <i class="fa-solid fa-truck-fast"></i>
                    <h3>Vận chuyển nhanh</h3>

                </div>

                <div class="services_box">
                    <i class="fa-solid fa-rotate-left"></i>
                    <h3>10 ngày đổi trả</h3>

                </div>

                <div class="services_box">
                    <i class="fa-solid fa-headset"></i>
                    <h3>Hỗ trợ 24/7 </h3>
                </div>
            </div>

        </div>
    </div>
    <%@include file="layout/footer.jsp" %>
    <script src="js/scripts.js"></script>
</body>
</html>