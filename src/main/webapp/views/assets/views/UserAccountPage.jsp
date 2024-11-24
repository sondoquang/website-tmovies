<%-- 
    Document   : AccountUserPage
    Created on : Nov 15, 2024, 7:36:51 AM
    Author     : acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/styleIndex.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/styleDetail.css">
        <title>Account User</title>
    </head>

    <body>
        <c:url value="/homepage" var="url"/>
        <div class="container">
            <!--==================== HEADER ====================-->
            <header class="header" id="header">
                <nav class="nav container">
                    <a href="${url}/index" class="nav__logo"><img src="${pageContext.request.contextPath}/views/assets/images/logos/logo.png" alt=""></a>

                    <div class="nav__menu" id="nav-menu">
                        <ul class="nav__list">
                            <li class="nav__item">
                                <a href="#" class="nav__link">Home</a>
                            </li>

                            <li class="nav__item">
                                <a href="#" class="nav__link">About Us</a>
                            </li>

                            <li class="nav__item">
                                <a href="#" class="nav__link dropdown__link">Product<i
                                        class="ri-arrow-down-s-fill dropdown__icon"></i></a>
                                <ul class="submenu">
                                    <li><a href="#">Product 1</a></li>
                                    <li><a href="#">Product 2</a></li>
                                    <li><a href="#">Product 3</a></li>
                                </ul>
                            </li>

                            <li class="nav__item">
                                <a href="#" class="nav__link">Featured<i
                                        class="ri-arrow-down-s-fill dropdown__icon"></i></a>
                                <ul class="submenu">
                                    <li><a href="#">Services 1</a></li>
                                    <li><a href="#">Services 2</a></li>
                                    <li><a href="#">Services 3</a></li>
                                </ul>
                            </li>

                            <li class="nav__item">
                                <a href="#" class="nav__link">Contact Us</a>
                            </li>
                        </ul>

                        <!-- Close button -->
                        <div class="nav__close" id="nav-close">
                            <i class="ri-close-line"></i>
                        </div>
                    </div>

                    <div class="nav__actions">
                        <!-- Search button -->
                        <i class="ri-search-line nav__search" id="search-btn"></i>
						<c:url value="/logout" var="urlLogout" />
					<a href="${urlLogout}" class="btn btn-info" ${sessionScope.user != null?'':'hidden'}>Đăng xuất</a>
                        <!-- Login button -->
                        <i class="ri-user-line nav__login" id="login-btn" ${sessionScope.user != null?'hidden':''}></i>
                        <a href="${url}/useraccount" class="btn btn-warning text-dark" ${sessionScope.user != null?'':'hidden'}>Tài khoản</a>

                        <!-- Toggle button -->
                        <div class="nav__toggle" id="nav-toggle">
                            <i class="ri-menu-line"></i>
                        </div>
                    </div>
                </nav>
            </header>

            <!--==================== SEARCH ====================-->
            <div class="search" id="search">
                <form action="" class="search__form" method="get">
                    <i class="ri-search-line search__icon"></i>
                    <input type="search" placeholder="What are you looking for?" class="search__input">
                </form>
                <i class="ri-close-line search__close" id="search-close"></i>
            </div>
            <!--==================== MAIN ====================-->
            <section class="container-fluid p-0" style="position: relative;">
                <img src="${pageContext.request.contextPath}/views/assets/images/banners/full-banner.jpg" alt="banner" class="w-100 bannerFavorite">
                <h2 class="title_favourite">Manager Account</h2>
            </section>

            <section class="container pt-5">
                <div class="row list__v__item mx-auto">
                    <div class="col-lg-3 left__side">
                        <div class="row p-2">
                            <small class="btn btn-dark">Xem ngay nào</small>
                        </div>
                        <div class="row list_items">
                            <c:forEach var="item" items="${listTop10Videos}">
                                <div class="col-sm-12 mt-3 suggested__item">
                                    <div class="wrap__item" style="overflow: hidden;">
                                        <div class="item__image"><img src="${pageContext.request.contextPath}/views/assets/images/products/${item.poster}" alt=""></div>
                                        <div class="item__content">
                                            <div class="ct"><span>English</span> </div>
                                            <a href="${url}/detail/${item.id}">The Happy Nutcracker</a>
                                            <div class="duration__time"><i class="ri-time-line"></i><span>2 Hr 32 Mn</span></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <!-- Tiêu đề -->
                        <div class="row tmoves_hadding">
                            <h2>
                                <span class="col-md-12 text-uppercase">Quản lý tài khoản của tôi</span>
                            </h2>
                            <span class="border-bottom"></span>
                        </div>
                        <!-- Quản lý tài khoản cá nhân -->
                        <div class="row">
                            <div class="container p-5 rounded h-100">
                                <form action="${pageContext.request.contextPath}/update-profile" method="post" id="form">
                                    <div class="row ps-5 pe-5">
                                        <div class="col mb-3 input-control">
                                            <label for="username" class="form-label text-white">Username:</label>
                                            <input type="text" class="form-control" id="username" name="username"
                                                   placeholder="Id automatic" value="${sessionScope.user.username}" readonly>
                                        </div>
                                        <div class="col mb-3 input-control">
                                            <label for="pwd" class="form-label text-white">Password:</label>
                                            <input type="password" class="form-control" id="pwd" name="password"
                                                   placeholder="Enter Password" value="${sessionScope.user.password}" readonly>
                                        </div>
                                    </div>
                                    <div class="row ps-5 pe-5">
                                        <div class="col mb-3 input-control">
                                            <label for="fullname" class="form-label text-white">Fullname:</label>
                                            <input type="text" class="form-control" id="fullname" name="fullname"
                                                   placeholder="Enter fullmame" value="${sessionScope.user.fullname}">
                                        </div>
                                        <div class="col mb-3 input-control">
                                            <label for="email" class="form-label text-white" >Email:</label>
                                            <input type="email" class="form-control" id="email" name="email"
                                                   placeholder="Enter Email" value="${sessionScope.user.email}">
                                        </div>
                                    </div>
                                    <div class="row ps-5 pe-5">
                                        <div class="col mb -3 d-flex">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="true" name="admin"
                                                       id="admin" ${sessionScope.user.admin == true?'checked':''} disabled>
                                                <label class="form-check-label text-white" for="admin">
                                                    Admin
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="radio" value="false" name="admin"
                                                       id="user" ${sessionScope.user.admin == false?'checked':''} disabled>
                                                <label class="form-check-label text-white" for="user">
                                                    User
                                                </label>
                                            </div>
                                        </div>
                                        <div class="error"><p style="color: red;">${error}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 p-2 ps-5">
                                            <button type="submit" class="btn btn-info m-1 text-white">Update Profile</button>
                                            <!-- Button trigger model change password -->
                                            <button type="button" class="btn btn-info m-1 text-white" data-bs-toggle="modal"
                                                    data-bs-target="#changepass">Change Password</button>
                                        </div>
                                    </div>
                                </form>

                                <!-- Modal -->
                                <div class="modal fade" id="changepass" tabindex="-1" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <form action="${pageContext.request.contextPath}/change-pass" method="post" id="change-pass-form">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="col mb-3 input-control">
                                                        <label for="user" class="form-label">Username:</label>
                                                        <input type="text" class="form-control" id="user" name="username"
                                                               placeholder="Enter username" value="${sessionScope.user.username}" readonly>
                                                    </div>
                                                    <div class="col mb-3 input-control">
                                                        <label for="curpass" class="form-label">Current Password:</label>
                                                        <input type="password" class="form-control" id="curpass" name="password"
                                                               placeholder="Enter Password" value="${sessionScope.user.password }" readonly>
                                                    </div>
                                                    <div class="col mb-3 input-control">
                                                        <label class="form-label">New Password:</label>
                                                        <input type="password" class="form-control" id="newpwd" name="newpass"
                                                               placeholder="Enter new password">
                                                    </div>
                                                    <div class="col mb-3 input-control">
                                                        <label class="form-label">Confirm Password:</label>
                                                        <input type="password" class="form-control" id="confirmpwd" name="confirmpwd"
                                                               placeholder="Enter confirm Password">
                                                    </div>
                                                    <p style="color: red;" id="error"></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-warning" onclick="validateChangePass()">Change</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <!-- Tiêu đề -->
                            <div class="row tmoves_hadding">
                                <h2>
                                    <span class="col-md-12 text-uppercase">Danh sách video yêu thích</span>
                                </h2>
                                <span class="border-bottom"></span>
                            </div>
                            <c:forEach var="video" items="${videoFavourites}">
                                <div class="col-sm-12 col-lg-4 video__item gradient favourite border p-2 rounded"
                                     style="border: 2px solid #80dcf3 !important">
                                    <img src="${pageContext.request.contextPath}/views/assets/images/products/${video.poster}" class="rounded" alt="film">
                                    <div class="movies__content p-4">
                                        <a href="">${video.title}</a>
                                        <div class="v__tag">Romance, English, 2019</div>
                                        <div class="v__bottom">
                                            <div class="v__time"><i class="ri-time-line"></i><span>2 Hr 3 Min</span></div>
                                            <div class="likle_icon"><a href=""><i class="ri-dislike-line"></i></a></div>
                                            <div class="likle_icon"><a href="#2"><i class="ri-share-line" data-bs-toggle="modal"
                                                                                    data-bs-target="#share"></i></a></div>
                                        </div>
                                    </div>
                                    <div class="playbtn">
                                        <a href="${url}/detail/${video.id}"><img src="${pageContext.request.contextPath}/views/assets/images/logos/play-button.png" alt=""></a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade center" id="shares" tabindex="-1" aria-labelledby="share" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <form action="" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="share">Share Video</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="email" class="form-control" id="exampleFormControlInput1"
                                               placeholder="Nhập vào email muốn gửi">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Share</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <footer>
                <div class="contanter">
                    <div class="footer__top">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-lg-3">
                                    <img src="${pageContext.request.contextPath}/views/assets/images/footers/1.jpg" alt="footer">
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <img src="${pageContext.request.contextPath}/views/assets/images/footers/2.jpg" alt="footer">
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <img src="${pageContext.request.contextPath}/views/assets/images/footers/3.jpg" alt="footer">
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <img src="${pageContext.request.contextPath}/views/assets/images/footers/4.jpg" alt="footer">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer__center">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-lg-3">
                                    <div class="footer__title"><h2>Movies Categgory</h2></div>
                                    <div class="footer__content">
                                        <ul>
                                            <li><a href="">Movies</a></li>
                                            <li><a href="">Videos</a></li>
                                            <li><a href="">English Movies</a></li>
                                            <li><a href="">China Movies</a></li>
                                            <li><a href="">Trailer</a></li>
                                            <li><a href="">Upcoming Movies</a></li>
                                            <li><a href="">Contact Us</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="footer__title"><h2>Information</h2></div>
                                    <div class="footer__content">
                                        <ul>
                                            <li><a href="">Abount Us</a></li>
                                            <li><a href="">Song</a></li>
                                            <li><a href="">Forums</a></li>
                                            <li><a href="">Place</a></li>
                                            <li><a href="">Hot collection</a></li>
                                            <li><a href="">Upcoming events</a></li>
                                            <li><a href="">All movies</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="footer__title"><h2>Locations</h2></div>
                                    <div class="footer__content">
                                        <ul>
                                            <li><a href="">South Korea</a></li>
                                            <li><a href="">German</a></li>
                                            <li><a href="">English Movies</a></li>
                                            <li><a href="">China Movies</a></li>
                                            <li><a href="">Trailer</a></li>
                                            <li><a href="">Upcoming Movies</a></li>
                                            <li><a href="">Contact Us</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="footer__title"><h2>Newsleter</h2></div>
                                    <div class="footer__content">
                                        <p>Nếu bạn muốn nhận thông tin mới nhanh nhất và cập nhật mỗi
                                            ngày từ công ty chúng tôi bạn chỉ cần đăng kí tin tức bằng
                                            email mà không hề mất phí.</p>
                                        <div class="newsleter">
                                            <input type="text" name="newsleter" placeholder="Enter Address Email....">
                                            <form method="post">
                                                <span class="send__email"><i class="ri-send-plane-fill"></i></span>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="coby">
                    <div class="container">
                        <span>CopyRight 2019 Develop by SonDoIt. All Rights Reserved.</span>
                    </div>
                </div>
            </footer>
        </div>
            <!--=============== MAIN JS ===============-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/views/assets/js/UserAcount.js"></script>
            <script>
                const validateChangePass = ()=>{
                    const formChangePass = document.getElementById("change-pass-form");
                    formChangePass.addEventListener('submit',(e)=>{
                        const newPass = document.getElementById("newpwd").value,
                            confirmPass = document.getElementById("confirmpwd").value,
                            error = document.getElementById("error");
                        if(newPass != confirmPass){
                            error.innerText = 'Xác nhận mật khẩu không trùng khớp';
                            e.preventDefault();
                        }else if(newPass.length < 6 || newPass.length > 30){
                            error.innerText = 'Mật khẩu phải từ 6-30 kí tự !';
                            e.preventDefault();
                        }
                        else
                            e.submit();
                    })
                }
            </script>
    </body>
</html>
