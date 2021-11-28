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
            <form class="row g-3" action="${pageContext.request.contextPath}/addProduct" method="post">
                <h1 class="text-center">Add new product</h1>
                <div class="col-md-8">
                    <label for="name" class="form-label">Product name</label>
                    <input type="text" name="name" class="form-control" id="name">
                </div>
                <div class="col-md-4">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" name="price" class="form-control" id="price">
                </div>
                <div class="col-12">
                    <label for="description">Description</label>
                    <textarea name="description" class="form-control" id="description" style="height: 100px"></textarea>
                </div>
                <div class="col-md-3">
                    <label for="brand" class="form-label">Brand</label>
                    <input type="text" name="brand" class="form-control" id="brand">
                </div>
                <div class="col-md-5">
                    <label for="display" class="form-label">Display</label>
                    <input type="text" name="display" class="form-control" id="display">
                </div>
                <div class="col-md-4">
                    <label for="os" class="form-label">OS</label>
                    <input type="text" name="os" class="form-control" id="os">
                </div>
                <div class="col-md-3">
                    <label for="cpu" class="form-label">CPU</label>
                    <input type="text" name="cpu" class="form-control" id="cpu">
                </div>
                <div class="col-md-3">
                    <label for="gpu" class="form-label">GPU</label>
                    <input type="text" name="gpu" class="form-control" id="gpu">
                </div>
                <div class="col-lg-2">
                    <label for="ram" class="form-label">RAM</label>
                    <input type="text" name="ram" class="form-control" id="ram">
                </div>
                <div class="col-lg-2">
                    <label for="storage" class="form-label">Storage</label>
                    <input type="text" name="storage" class="form-control" id="storage">
                </div>
                <div class="col-lg-2">
                    <label for="battery" class="form-label">Battery</label>
                    <input type="text" name="battery" class="form-control" id="battery">
                </div>
                <div class="col-12">
                    <label for="img" class="form-label">Image URL</label>
                    <input type="text" name="img" class="form-control" id="img">
                </div>
                
                <div class="col-12">
                    <button type="submit" class="btn btn-success">Add product</button>
                </div>
            </form>
        </main>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
