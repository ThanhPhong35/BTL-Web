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
    <title>product found</title>
    <link rel="stylesheet" href="css/searchProduct.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="shortcut icon" href="image/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@include file="layout/header.jsp" %>
    <div class="container">
        <div class="searchP">
            <p class="label"> Sản phẩm tìm thấy <p>
            <!--Products-->
            <div class="result">
                <div class="menu">
                    <div class="tab tab1">
                        <p class="labelC labelM">Danh mục sản phẩm</p>
                        <c:set var="cate" value="${listC}"/>
                        <form id="f1" action="search" class="form">
                            <div>
                                <input type="checkbox" id="c0" name="cidd" 
                                       ${chid[0]?"checked":""} value="${0}" 
                                       onclick="setCheck(this)"/>
                                <span>All</span>
                            </div>

                            <c:forEach begin="0" end="${cate.size()-1}" var="i" >
                                <div>
                                    <input type="checkbox" id="cm" name="cidd"
                                           value="${cate.get(i).getCid()}"
                                           ${chid[i+1]?"checked":""} onclick="setCheck(this)">
                                    <span>${cate.get(i).getCname()}</span>
                                </div>                     
                            </c:forEach>
                        </form>
                    </div>
                    <div class="tab tab2">
                        <p class="labelP labelM">Tìm kiếm theo giá</p>
                        <c:set var="pp" value="${pp}"/>
                        <form id="f2" action="search">
                            <div>
                                <input type="checkbox" id="g0" name="price" 
                                       ${pb[0]?"checked":""} value="0" 
                                       onclick="setCheck1(this)">
                                <span>All</span>
                            </div>
                            <c:forEach begin="0" end="${5}" var="i" >  
                                <div>
                                    <input type="checkbox" id="g1" name="price"
                                           value="${(i+1)}"
                                           ${pb[i+1]?"checked":""} onclick="setCheck1(this)">
                                    <span>${pp[i]}</span>
                                </div>
                            </c:forEach>
                        </form>
                    </div>
                </div>
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
            </div>
        </div>
        <!--Services-->

        <div class="services" id="Servises">
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
    <script type="text/javascript">
        function setCheck(obj){
            var fries = document.getElementsByName('cidd');
            if((obj.id=='c0')&&(fries[0].checked==true)){
                for(var i =1; i<fries.length ; i++){
                    fries[i].checked =false;
                }
            }
            else{
                for(var i =1; i<fries.length; i++){
                    if(fries[i].checked==true){
                        fries[0].checked=false;
                        break;
                    }
                }
            }
            document.getElementById('f1').submit();
        }
        function setCheck1(obj){
            var fries = document.getElementsByName('price');
            if((obj.id=='c0')&&(fries[0].checked==true)){
                for(var i =1; i<fries.length ; i++){
                    fries[i].checked =false;
                }
            }
            else{
                for(var i =1; i<fries.length; i++){
                    if(fries[i].checked==true){
                        fries[0].checked=false;
                        break;
                    }
                }
            }
            document.getElementById('f2').submit();
        }
    </script>
</body>
</html>