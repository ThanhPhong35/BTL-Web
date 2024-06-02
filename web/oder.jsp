
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
                            Mã đơn hàng 
                        </th>
                        <th>
                            Ngày đặt hàng
                        </th>
                        <th>
                            Tổng tiền
                        </th>
                        
                        <th>
                            Trạng thái
                        </th>
                        <th>
                            
                        </th>
                    </tr>
                    <c:set var="t" value="0"/>
                    <c:forEach items="${requestScope.listo}" var="i">
                        <c:set var="t" value="${t+1}"/>
                        <tr>
                            <td>
                                ${t}
                            </td>
                            <td>
                                ${i.id}
                            </td>
                            <td>
                                ${i.date}
                            </td>
                            <td>
                                <fmt:formatNumber pattern="##.#" value="${i.totalmoney}"/>
                                
                            </td>
                            <td class="status">
                                <c:if test="${i.status==0}">
                                    <a class="process">
                                        Chờ xác nhận
                                    </a>
                                </c:if>
                                <c:if test="${i.status==1}">
                                    <a class="confirmed">
                                        Đã xác nhận
                                    </a>
                                </c:if>
                                <c:if test="${i.status==2}">
                                    <a class="cancled">
                                        Đã bị hủy
                                    </a>
                                </c:if>
                            </td>
                            <td>
                                <a href="order-detail?oid=${i.id}">
                                    Chi tiết
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%@include file="layout/footer.jsp" %>
        <script src="js/scripts.js"></script>
    </body>
</html>
</html>
