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
    <title>Detail</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="shortcut icon" href="image/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@include file="layout/header.jsp" %>
    <div class="container">
        <div class="detail">
            <div class="detail-main">
                <div class="left">
                    <div class="left-img">
                        <img src="${detail.image}">
                    </div>
                    <div class="left-share">
                        <span>
                            Chia sẻ:
                        </span>
                        <a>
                            <i class="fa-brands fa-tiktok"></i>
                        </a>
                        <a>
                            <i class="fa-brands fa-facebook-messenger"></i>
                        </a>
                        <a>
                            <i class="fa-brands fa-facebook"></i>
                        </a>
                        <a>
                            <i class="fa-brands fa-twitter"></i>
                        </a>
                       
                    </div>
                </div>
                    
                    <div class="right">
                        <div class="right-title">
                            <p class="p-name">
                                <span>Yêu thích</span>
                                ${detail.name}
                            </p>
                            <p class="p-title">
                                ${detail.title}
                            </p>
                        </div>
                        <div class="right-price">
                            <span>đ</span>
                            ${detail.price}
                        </div>
                        <form name="f" action="" method="post">
                            <table>
                                <tr>
                                    <td>
                                        Deal Sốc
                                    </td>
                                    <td>
                                        <i class="fa-solid fa-gift"></i>
                                        Mua để nhận quà
                                    </td>
                                </tr>
                                <tr class="transport-row">
                                    <td>
                                        Vận Chuyển
                                    </td>
                                    <td>
                                        <span> 
                                            <p>
                                                <i class="fa-solid fa-truck"></i>
                                                Miền phí vận chuyển 
                                            </p>
                                            <p> Vận chuyển khắp cả nước </p>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Số lượng
                                    </td>
                                    <td class="amount">
                                        <div class="quantity-btn" onclick="decrement()">-</div>
                                        <input type="text" name="num" class="quantity-input" id="quantity" value="1" oninput="validateQuantity()">
                                        <div class="quantity-btn" onclick="increment()">+</div>
                                    </td>
                                </tr>
                            </table>
                            <div class="right-buy">
                                <button type="submit" class="add-cart buy" onclick="addcart('${detail.id}')">
                                    <img src="image/add-cart.png" alt="Giỏ hàng">
                                    <span>Thêm vào giỏ hàng</span>
                                </button>
                                
                            </div>
                        </form>
                        <div class="right-bot">
                            <span class="bott-l">
                                Shoes Đảm Bảo
                            </span>
                            <span class="bott-r">
                                3 Ngày Trả Hàng/Hoàn Tiền
                            </span>
                        </div>
                    </div>
                </div>
            
            <div class="detail-des">
                <p class="des-title">Mô tả sản phẩm<p>
                <p class="des-content"> 
                    ${detail.des}
                </p>

            </div>    
        </div>
    </div>
    <%@include file="layout/footer.jsp" %>
    <script src="js/scripts.js"></script>
    <script type="text/javascript">
        function addcart(id){
            document.f.action="addcart?id="+id;
            document.submit();
        }
    </script>
</body>
</html>