<%-- 
    Document   : header
    Created on : 26-Oct-2021, 08:30:36
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!--Header-->
<header>
    <!--Banner-->
    <div class="row">
        <div class="container">
            <img id="banner" src="img/banner.jpg"/>
        </div>
    </div>
    <%-- Login/register --%>
    <div id="welcomeTab" class="d-flex justify-content-end align-items-center text-light bg-dark pe-3">
        <c:if test="${sessionScope.isLoggedIn}">
            <span>Welcome ${sessionScope.currentAccount.role == 1 ? "admin" : ""} <b>${sessionScope.currentAccount.email}</b></span>
            <a class="p-1" href="${pageContext.request.contextPath}/logout">LOGOUT</a>
        </c:if>
        <c:if test="${!sessionScope.isLoggedIn}">
            <a class="p-1" href="${pageContext.request.contextPath}/login">LOGIN</a>
            <a class="p-1" href="${pageContext.request.contextPath}/register">REGISTER</a>
        </c:if>
    </div>
    <!--Nav bar-->
    <div class="row">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand d-flex align-items-end" href="${pageContext.request.contextPath}/">
                        <img id="logo" src="img/logo.png" alt="logo">
                        <strong class="ps-1">MOBILESHOP</strong>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">All products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/aboutus">About us</a>
                            </li>
                        </ul>
                        <form class="d-flex" action="${pageContext.request.contextPath}/search" method="GET">
                            <input name="search" class="form-control" type="search" placeholder="Search for product" aria-label="Search">
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>

