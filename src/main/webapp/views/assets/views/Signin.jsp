<%-- 
    Document   : Signin
    Created on : Nov 24, 2024, 2:59:12 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="movie" content="trailer film">
        <meta name="theater" content="action film">
        <meta name="movie" content="romantic film">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <!-- ==============RemixIcon=================== -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.4.0/remixicon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/styleIndex.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/login.css">
        <title>TMovies</title>
    </head>

    <body>
        <jsp:include page="Header.jsp"/>
        <!--==================== MAIN ====================-->
        <section class="container-fluid p-0" style="position: relative; height: 350px;">
            <img src="${pageContext.request.contextPath}/views/assets/images/backgrounds/1.jpg" alt="banner" class="w-100 bannerFavorite"
                 style="height: 100%; object-fit: cover;">
            <h2 class="title_favourite">Sign In</h2>
        </section>

        <section class="container pt-5" style="justify-items: center;">
            <form action="/action_page.php" class="login-form">
                <div class="mb-3 mt-3">
                    <label for="usr" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="usr" placeholder="Enter username" name="username">
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
                </div>
                <div class="mb-3 mt-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
                <div class="mb-3 mt-3">
                    <label for="fullname" class="form-label">Email:</label>
                    <input type="text" class="form-control" id="fullname" placeholder="Enter fullname" name="fullname">
                </div>
                <div class="mb-3 text-center text-danger">
                    <p>Nhập lỗi</p>
                </div>
                <div class="mb-3 text-center">
                    <p class="mt-2"><a href="#" style="color: #828fcc;">Log in ?</a></p>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-info text-white ps-5 pe-5 btnLogin">SIGN IN</button>
                </div>
            </form>
        </section>

        <jsp:include page="Footer.jsp"/>
        <!--=============== MAIN JS ===============-->
        <script src="../js/Detail.js"></script>
        <script src="../js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>