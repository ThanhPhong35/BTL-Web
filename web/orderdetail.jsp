
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/reset.css"/>
        <link rel="stylesheet" href="css/orderdetail.css"/>
        
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="container">
            <div class="order">
                <table>
                    <tr>
                        <th>
                            #
                        </th>
                        <th> 
                            Tên sản phẩm 
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
                    </tr>
                    <c:set var="t" value="0"/>
                    <c:forEach items="${od}" var="i">
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
                                ${i.quantity}
                            </td>
                            <td>
                               <fmt:formatNumber pattern="##.#" value="${i.price}"/> 
                               
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <script src="js/scripts.js"></script>
    </body>
</html>
</html>
