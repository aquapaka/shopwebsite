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
            <h1 class="text-center">Order</h1>
            <table class="table table-bordered">
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                </tr>
                <c:forEach items="${cart.getProducts()}" var="product" varStatus="status">
                    <tr>
                        <td>${status.index + 1}. ${product.name} (ID: ${product.id})</td>
                        <td><fmt:formatNumber value="${product.price}" type="currency"/></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td><b>Total</b></td>
                    <td><b><fmt:formatNumber value="${not empty cart.totalPrice() ? cart.totalPrice() : '0'}" type="currency"/></b></td>
                </tr>
            </table>
            <i class="text-danger">${cartMessage}</i>
            <form class="row g-3" action="${pageContext.request.contextPath}/submitOrder" method="post">
                <div class="col-md-8">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" id="name" value="${name}">
                    <i class="text-danger">${nameMessage}</i>
                </div>
                <div class="col-md-4">
                    <label for="phone" class="form-label">Phone number</label>
                    <input type="text" name="phone" class="form-control" id="phone" value="${phone}">
                    <i class="text-danger">${phoneMessage}</i>
                </div>
                <div class="col-12">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" name="email" class="form-control" id="email" value="${email}">
                    <i class="text-danger">${emailMessage}</i>
                </div>
                <div class="col-12">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" name="address" class="form-control" id="address" value="${address}">
                    <i class="text-danger">${addressMessage}</i>
                </div>
                
                <div class="col-12">
                    <c:choose>
                        <c:when test="${submited}">
                            <i class="text-success">Order submited</i>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn btn-success">Submit order</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </form>
        </main>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
