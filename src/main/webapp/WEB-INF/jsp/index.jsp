<%-- 
    Document   : index
    Created on : 26-Oct-2021, 07:43:25
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
                <div class="col-12 col-lg-9 pb-2">
                    <jsp:include page="mainProduct.jsp"/>
                </div>
                <div class="col-12 col-lg-3">
                    <div class="row">                        
                        <c:if test="${sessionScope.currentAccount.role == 1}">
                            <div class="col-12 col-md-6 col-lg-12 mb-md-0 mb-lg-2">
                                <jsp:include page="adminDashboard.jsp"/>
                            </div>      
                        </c:if>
                        <div class="col-12 col-md-6 col-lg-12">
                            <jsp:include page="cart.jsp"/>
                        </div>
                        <div class="col-12 col-md-6 col-lg-12 mt-2 mt-md-0 mt-lg-2">
                            <jsp:include page="popularProduct.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
