<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                <div id="tab1" class="tab-content">
                    <div class="counter">
                        <div class="view box">
                            <c:if test="${sessionScope.counter == null}">
                                0
                            </c:if>
                            <c:if test="${sessionScope.counter != null}">
                                ${sessionScope.counter}
                            </c:if>    
                            <i class="fa-solid fa-eye"></i>
                            <p> Lượt xem</p>
                        </div>
                        <div class="account box">
                            ${requestScope.a_counter}
                            <i class="fa-solid fa-users"></i>
                            <p>
                                Tài khoản
                            </p>
                        </div>
                        <div class="product box">
                            
                            ${requestScope.p_counter}
                            <i class="fa-solid fa-box"></i>
                            <p>
                                Sản phẩm
                            </p>
                        </div>
                        <div class="order box">
                            ${requestScope.o_counter}
                            <i class="fa-solid fa-cart-shopping"></i>
                            <p>
                                Đơn hàng
                            </p>
                        </div>
                        <div class="revenue box">
                            ${requestScope.revenue}
                            <i class="fa-solid fa-money-check-dollar"></i>
                            <p>
                                Doanh thu
                            </p>
                        </div>
                    </div>
                        <div>      
                            <div class="order">
                                <p class="title">
                                    Đơn hàng cần xác nhận
                                </p>
                                <div class="order-content">
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
                                                Mã khách hàng
                                            </th>
                                            <th>
                                                Tổng tiền
                                            </th>
                                            <th>
                                                Xác nhận đơn hàng
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
                                                    ${i.cusid}
                                                <td>
                                                    <fmt:formatNumber pattern="##.#" value="${i.totalmoney}"/>
                                                </td>
                                                <td>
                                                    <a href='#' class="confirm" onclick="confirmOrder(event, ${i.id})">Xác nhận</a>
                                                    <a href='#' class="cancle" onclick="canceldOrder(event, ${i.id})">Hủy</a>
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
                        </div>
                    </div>
                </div>   
            </div>
        </div>
        <script src="js/admin/main.js">

        </script>
</body>
</html>


