<%-- 
    Document   : index
    Created on : 26-Oct-2021, 07:43:25
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>Mobile Store ${message}</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main class="container">
            <h1 class="text-center">View Orders</h1>
            <c:forEach items="${userOrders}" var="userOrder" varStatus="status">
                <div class="row">
                    <h2>Order #${status.index+1}</h2>
                    <ul>
                        <li>Date: ${userOrder.date}</li>
                        <li>Name: ${userOrder.name}</li>
                        <li>Phone number: ${userOrder.phone}</li>
                        <li>Email: ${userOrder.email}</li>
                        <li>Address: ${userOrder.address}</li>
                        <li>Status: ${userOrder.status == 0 ? "Pending" : "Approved"}</li>
                    </ul>
                    <table class="table table-bordered">
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                        </tr>
                        <c:forEach items="${userOrder.orderDetails}" var="orderDetail" varStatus="detailStatus">
                            <tr>
                                <td>${detailStatus.index + 1}. ${orderDetail.product.name} (ID: ${orderDetail.product.id})</td>
                                <td><fmt:formatNumber value="${orderDetail.product.price}" type="currency"/></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><b>Total</b></td>
                            <td><b><fmt:formatNumber value="${userOrder.totalPrice}" type="currency"/></b></td>
                        </tr>
                    </table>
                    <hr>
                </div>
            </c:forEach>
        </main>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
