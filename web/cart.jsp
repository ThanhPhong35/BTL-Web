<%-- 
    Document   : cart
    Created on : Oct 28, 2023, 8:58:42 PM
    Author     : YOU
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/reset.css"/>
        <link rel="stylesheet" href="css/cart.css"/>
        
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%@include file="layout/header.jsp" %>
        <div class="container">
            <div class="shopping-cart">
                <table>
                    <tr>
                        <th>
                            #
                        </th>
                        <th> 
                            Sản phẩm 
                        </th>
                        <th>
                            Đơn giá
                        </th>
                        <th>
                            Số lượng
                        </th>
                        
                        <th>
                            Thành tiền
                        </th>
                        <th>
                            Xóa
                        </th>
                    </tr>
                    <c:set var="o" value="${sessionScope.cart}"/>
                    <c:set var="t" value="0"/>
                    <c:forEach items="${o.items}" var="i">
                        <c:set var="t" value="${t+1}"/>
                        <tr>
                            <td>
                                ${t}
                            </td>
                            <td>
                                <img src="${i.product.image}" class="imgP"><!-- comment -->
                                <span class="nameP">
                                    ${i.product.name}
                                </span>
                            </td>
                            <td>
                                <fmt:formatNumber pattern="##.#" value="${i.price}"/>
                                
                            </td>
                            <td class="amount">
                                <div classs="quantity-btn">
                                    <a href="process?num=-1&id=${i.product.id}">-</a>
                                </div>
                                <input type="text" class="quantity-input" id="quantity" value="${i.quantity}" >
                                <div classs="quantity-btn">
                                    <a href="process?num=1&id=${i.product.id}">+</a>
                                </div>
                            </td>
                            <td>
                               <fmt:formatNumber pattern="##.#" value="${i.quantity*i.price}"/> 
                             
                            </td>
                    
                            <td>
                                <form action="process" method="post">
                                    <input type="hidden" name="id" value="${i.product.id}"/>
                                    <input type="submit" value="Xóa" class="action">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <form class="total" action="checkout" method="post">
                <div class="totalMoney">
<!--                    <span>Tổng tiền:</span>
                    <span>  </span>
                    <span>
                        VND
                    </span>-->
                </div>
                <button type="submit" class="payment"> 
                    Thanh toán 
                </button>
            </div>
        </form>
        <%@include file="layout/footer.jsp" %>
        <script src="js/scripts.js"></script>
    </body>
</html>
</html>
