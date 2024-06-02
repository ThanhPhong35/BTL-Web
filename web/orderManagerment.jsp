
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
                <div id="tab5" class="tab-content">
                   
<!--                    Bảng Order-->
                    <div class="result">
                        <table>
                            <tr>
                                <th class="center">
                                    STT
                                </th>
                                <th class="center">
                                    Mã đơn hàng
                                </th>
                                <th class="center">
                                    Ngày đặt hàng
                                </th>
                                <th class="center">
                                    Mã khách hàng
                                </th>
                                
                                <th>
                                    Tổng tiền
                                </th>
                                <th class="center">
                                    Trạng thái đơn hàng
                                </th>
                                <th class="center">
                                    Xác nhận đơn hàng
                                </th>
                                <th>
                                    
                                </th>
                            </tr>
                            <c:set var="t" value="0"/>
                            <c:forEach items="${listO}" var="o">
                                <c:set var="t" value="${t+1}"/>
                                <tr>
                                    <td class="center">
                                        ${t}
                                    </td>
                                    <td class="center">
                                        ${o.id}
                                    </td>
                                    <td class="center">
                                        ${o.date}
                                    </td>
                                    <td class="center">
                                        <span class="cusid" onclick="openView()"> ${o.cusid} </span>
                                    </td>
                                    <td>
                                        ${o.totalmoney}
                                    </td>
                                    <td class="center">
                                        <c:if test="${o.status==0}">
                                            <span class="">
                                                Chờ xác nhận
                                            </span>
                                        </c:if>
                                        <c:if test="${o.status==1}">
                                            Đã xác nhận
                                        </c:if>
                                        <c:if test="${o.status==2}">
                                            Đã hủy
                                        </c:if>    
                                    </td>
                                    <td class="center">
                                        <c:if test="${o.status==0}">
                                            <a href='#' class="confirm" onclick="confirmOrder(event, ${o.id})">Xác nhận</a>
                                            <a href='#' class="cancle" onclick="canceldOrder(event, ${o.id})">Hủy</a>
                                        </c:if>
                                        <c:if test="${o.status!=0}">
                                            <p class="confirm action">Xác nhận</p>
                                            <p class="cancle action">Hủy</p>
                                        </c:if>
                                    </td>
                                    <td>
                                        <a href="order-detail?oid=${o.id}">
                                            Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                            
<!--                    End table-->

            </div>   
        </div>
    </div>
    <script src="js/admin/main.js">

    </script>
</body>
</html>


