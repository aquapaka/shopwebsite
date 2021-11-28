<%-- 
    Document   : popularProduct
    Created on : 26-Oct-2021, 09:10:12
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div id="popularProduct">
    <h1>Popular products</h1>
    <div id="carousePopuparProduct" class="carousel carousel-dark slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:forEach items="${products}" var="product" varStatus="status">
                <div class="carousel-item ${status.first ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/productInfo?id=${product.id}">
                        <img src="${product.img}" class="d-block w-100" alt="${product.name}">
                        <p class="text-center">${product.name}<p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

