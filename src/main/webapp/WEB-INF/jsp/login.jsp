<%-- 
    Document   : login
    Created on : 27-Oct-2021, 00:39:39
    Author     : aquapaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <title>Login</title>
    </head>
    <body>
        <main class="container-fluid vh-100">
            <div class="d-flex flex-row justify-content-center align-items-center h-100">
                <form id="loginForm" class="border" action="${pageContext.request.contextPath}/login" method="POST">
                    <h1 class="mb-3 text-center">Login</h1>
                    <div class="form-floating mb-3">
                        <input type="text" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <div class="text-center mb-5">
                        <input type="submit" value="Login" class="btn btn-primary">
                    </div>
                    <i style="color: red">${message}</i>
                    <i style="color: green">${successMessage}</i>
                    <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a></p>
                </form>
            </div>
        </main>
    </body>
</html>
