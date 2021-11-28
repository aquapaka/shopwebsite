<%-- 
    Document   : index
    Created on : 26-Oct-2021, 07:43:25
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <div class="row">
                <h1>${product.name}</h1>
                <hr>
            </div>
            <div class="row">
                <div class="col-12 col-lg-6 pb-2">
                    <img class="img-fluid" src="${product.img}" alt="${product.name}">
                </div>
                <div class="col-12 col-lg-6">
                    <fmt:setLocale value="vi_VN" scope="session"/>
                    <h2><fmt:formatNumber value="${product.price}" type="currency"/></h2>
                    <form class="pb-2" action="${pageContext.request.contextPath}/cartAdd?id=${product.id}" method="post">
                        <button type="submit" class="btn btn-success">Add to cart</button>
                    </form>
                    <h2>Details</h2>
                    <ul>
                        <li>Brand: ${product.brand}</li>
                        <li>Display: ${product.display}</li>
                        <li>OS: ${product.os}</li>
                        <li>CPU: ${product.cpu}</li>
                        <li>GPU: ${product.gpu}</li>
                        <li>RAM: ${product.ram}</li>
                        <li>Storage: ${product.storage}</li>
                        <li>Battery: ${product.battery}</li>
                    </ul>
                    <h2>Description</h2>
                    <p>${product.description}</p>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
