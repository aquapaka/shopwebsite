<%-- 
    Document   : cart
    Created on : 26-Oct-2021, 09:09:31
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN" scope="session"/>
<div id="cart">
    <h1>Your cart</h1>
    <c:if test="${empty cart || cart.getProducts().isEmpty()}">
        <i>Your cart is empty</i>
    </c:if>
    <ol class="cart-list">
        <c:forEach items="${cart.getProducts()}" var="product" varStatus="status">
            <li class="cart-item d-flex justify-content-between align-items-center mb-1">
                <a href="${pageContext.request.contextPath}/productInfo?id=${product.id}" class="d-flex align-items-start">
                    <img class="cart-item-img" src="${product.img}" alt="${product.name}">
                    <div class="d-inline-block">
                        <b>${product.name}</b><br>
                        <span><fmt:formatNumber value="${product.price}" type="currency"/></span>
                    </div> 
                </a>     
                <form action="${pageContext.request.contextPath}/cartRemove?index=${status.index}" method="post">
                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                </form>
            </li>
        </c:forEach>
        <hr>
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <span>Total: </span><b><fmt:formatNumber value="${not empty cart.totalPrice() ? cart.totalPrice() : '0'}" type="currency"/></b>
            </div>
            <button class="btn btn-success btn-sm ">Purchase</button>
        </div>
    </ol>
</div>

