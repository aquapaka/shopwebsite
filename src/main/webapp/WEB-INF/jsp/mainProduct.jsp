<%-- 
    Document   : mainProduct
    Created on : 26-Oct-2021, 17:06:04
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div id="mainContent">
    <h1>${searchMessage}</h1>
    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-2">
        <fmt:setLocale value="vi_VN" scope="session"/>    
        <c:forEach items="${products}" var="product">
        <div class="col">
            <div class="card">
                <a href="${pageContext.request.contextPath}/productInfo?id=${product.id}">
                    <img src="${product.img}" class="card-img-top" alt="${product.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <h6 class="card-subtitle">                           
                            <fmt:formatNumber value="${product.price}" type="currency"/>
                        </h6>
                    </div>
                </a>
                <div class="card-body">                
                    <pre class="overflow-hidden">Display: ${product.display}
CPU: ${product.cpu}
RAM: ${product.ram}
Storage: ${product.storage}</pre>
                </div>
            </div>
        </div>

        </c:forEach>
    </div>

    <!--page navigation-->
    <nav class="mt-2" aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>
