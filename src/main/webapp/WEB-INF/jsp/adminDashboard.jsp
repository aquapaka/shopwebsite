<%-- 
    Document   : adminDashboard
    Created on : 01-Nov-2021, 14:50:46
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="adminDashboard">
    <div class="row">
        <div class="col-12 col-md-6 col-lg-12">
            <h1>Admin dashboard</h1>
            <i style="color: green">${adminMessage}</i>
            <ul>
                <li><a href="${pageContext.request.contextPath}/addProduct"><button class="btn btn-success btn-sm mb-2">Add new product</button></a></li>
                <li><a href="${pageContext.request.contextPath}/viewOrders"><button class="btn btn-success btn-sm mb-2">View orders</button></a></li>
            </ul>
        </div>
    </div>
</div>
