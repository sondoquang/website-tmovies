<%-- 
    Document   : HomePage
    Created on : Nov 12, 2024, 7:37:19 PM
    Author     : acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="movie" content="trailer film">
    <meta name="theater" content="action film">
    <meta name="movie" content="romantic film">

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- ==============RemixIcon=================== -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.4.0/remixicon.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/assets/css/styleIndex.css"/>
    <title>TMovies</title>
</head>

<body>
<c:url value="/homepage" var="url"/>
<div class="container">
    <!--==================== HEADER ====================-->
    <header class="header" id="header">
        <nav class="nav container">
            <a href="${url}/index" class="nav__logo"><img
                    src="${pageContext.request.contextPath}/views/assets/images/logos/logo.png"
                    alt=""></a>
            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list">
                    <li class="nav__item"><a href="#" class="nav__link">Home</a>
                    </li>

                    <li class="nav__item"><a href="#"
                                             class="nav__link dropdown__link">Product<i
                            class="ri-arrow-down-s-fill dropdown__icon"></i></a>
                        <ul class="submenu">
                            <li><a href="#">Product 1</a></li>
                            <li><a href="#">Product 2</a></li>
                            <li><a href="#">Product 3</a></li>
                        </ul>
                    </li>

                    <li class="nav__item"><a href="#" class="nav__link">About
                        Us</a></li>

                    <li class="nav__item"><a href="#" class="nav__link">Featured<i
                            class="ri-arrow-down-s-fill dropdown__icon"></i></a>
                        <ul class="submenu">
                            <li><a href="#">Services 1</a></li>
                            <li><a href="#">Services 2</a></li>
                            <li><a href="#">Services 3</a></li>
                        </ul>
                    </li>

                    <li class="nav__item"><a href="#" class="nav__link">Contact
                        Us</a></li>
                </ul>

                <!-- Close button -->
                <div class="nav__close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
            </div>

            <div class="nav__actions">
                <!-- Search button -->
                <i class="ri-search-line nav__search" id="search-btn"></i>
                <c:url value="/logout" var="urlLogout"/>
                <a href="${urlLogout}" class="btn btn-info" ${sessionScope.user != null?'':'hidden'}>Đăng xuất</a>

                <!-- Login button -->
                <i class="ri-user-line nav__login" id="login-btn"
                ${sessionScope.user != null?'hidden':''}></i> <a
                    href="${pageContext.request.contextPath}/account" class="btn btn-warning text-dark"
            ${sessionScope.user != null?'':'hidden'}>Tài khoản</a>
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
            <i class="ri-search-line search__icon"></i> <input type="search"
                                                               placeholder="Nhập vào tên film bạn muốn..."
                                                               class="search__input">
        </form>
        <i class="ri-close-line search__close" id="search-close"></i>
    </div>

    <!--==================== LOGIN ====================-->
    <c:url value="/login" var="urlLogin"/>
    <!--==================== LOGIN ====================-->
    <div class="login ${sessionScope.isLogin==true&&sessionScope.user==null?'show__login':''}" id="login"
    style="padding-top: 6rem">
    <form action="${urlLogin}" class="login__form" method="post">
        <h2 class="login__title">Log In</h2>

        <div class="login__group">
            <div>
                <label for="username" class="login__label">Username</label> <input
                    type="text" placeholder="Enter your username" id="username"
                    class="login__input" name="username" value="${param.username}">
            </div>

            <div>
                <label for="password" class="login__label">Password</label> <input
                    type="password" placeholder="Enter your password" id="password"
                    class="login__input" name="password" value="${param.password}">
            </div>
        </div>

        <div>
            <p>
                <label for="rememberMe" class="pt-3"> <input
                        type="checkbox" value="Remember me" id="rememberMe"
                        name="rememberMe"> Remember me
                </label>
            </p>
            <p style="color: red;" ${sessionScope.user == null && sessionScope.isLogin == true ?'':'hidden'}>Username or password incorrect</p>
            <p class="login__signup">
                You do not have an account? <a class="btn" id="forward_sigin">Sign
                up</a>
            </p>

            <a href="#" class="login__forgot"> You forgot your password </a>

            <button type="submit" class="login__button">Log In</button>
        </div>
    </form>
    <i class="ri-close-line login__close" id="login-close"
       style="top: 3rem;"></i>
</div>
<!--==================== End Login ====================-->

<!--==================== signin ====================-->
<div class="signin ${sessionScope.isSignin == true?'show__signin':''}" id="signin">
    <form action="${pageContext.request.contextPath}/signin" class="login__form" method="post">
        <h2 class="login__title">Sign in</h2>
		${param.username == null}
        <div class="login__group">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput"
                       placeholder="Username" name="username" value="${param.username}"> <label for="floatingInput">Username</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingInput"
                       placeholder="Password" name="password" value="${param.password}"> <label for="floatingInput">Password</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput"
                       placeholder="Fullname" name="fullname" value="${param.fullname}"> <label for="floatingInput">Fullname</label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInput"
                       placeholder="Email Address" name="email" value="${param.email}"> <label for="floatingInput">Email
                Address</label>
            </div>
        </div>


        <div>
        	<p style="color:red;" ${sessionScope.isSignin == true?'':'hidden '}>${sessionScope.error}</p>
            <p class="login__signup">
                You do have an account ?<a class="btn" id="forward_login">Login</a>
            </p>

            <button type="submit" class="login__button">Sign in</button>
        </div>
    </form>
    <i class="ri-close-line signin__close" id="signin-close"></i>
</div>
<!--==================== End signin ====================-->

<!-- ============= OTP sign in ======== -->
<div class="wrap-otp-card" id="form-otp">
    <div class="otp-card">
        <form action="" method="post">
            <h1>OTP verification</h1>
            <p>Code has been send to ****</p>
            <div class="otp-card-inputs">
                <input type="text" maxlength="1" name="" id="" autofocus>
                <input type="text" maxlength="1" name="" id=""> <input
                    type="text" maxlength="1" name="" id=""> <input
                    type="text" maxlength="1" name="" id=""> <input
                    type="text" maxlength="1" name="" id=""> <input
                    type="text" maxlength="1" name="" id="">
            </div>
            <p>
                Didn't get the otp <a href="#"">Resend</a>
            </p>
            <button disabled>Verify</button>
        </form>
    </div>
    <i class="ri-close-line otp__close" id="otp-close"></i>
</div>
</div>
<!--==================== MAIN ====================-->
<section class="main">
    <img
            src="${pageContext.request.contextPath}/views/assets/images/backgrounds/body.jpg"
            alt="image" class="main__bg">
    <div class="container body__side">
        <div class="row">
            <div class="col-sm-3 left__side">
                <button class="ctMenuBtn" id="btnMenuLeft">
                    <h2 id="title__top">
                        <span class="top__10movies">Top 10 Movies</span>
                    </h2>
                </button>
                <div class="ct_menu show__menuLeft" id="categoryMenu">
                    <ul>
                        <li class="active">
                            <button type="button" class="btnCTMenu">Home</button>
                        </li>
                        <li class="has_sub">
                            <button onclick="toggleSubmenu(this)"
                                    class="dropbtn">
                                Romantic Movies<i class="ri-arrow-down-s-fill dropdown__icon"></i>
                            </button>
                            <ul class="ct__submenu">
                                <div>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">Tamil</a></li>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">China</a></li>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">English</a></li>
                                </div>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <button onclick="toggleSubmenu(this)"
                                    class="dropbtn">
                                Top 10 Movies<i class="ri-arrow-down-s-fill dropdown__icon"></i>
                            </button>
                            <ul class="ct__submenu">
                                <div>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">Tamil</a></li>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">China</a></li>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">English</a></li>
                                </div>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <button onclick="toggleSubmenu(this)"
                                    class="dropbtn">
                                Rating Movies<i class="ri-arrow-down-s-fill dropdown__icon"></i>
                            </button>
                            <ul class="ct__submenu">
                                <div>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">Tamil</a></li>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">China</a></li>
                                    <li class="ct__submenu_item"><a href=""
                                                                    class="ct__submenu_link">English</a></li>
                                </div>
                            </ul>
                        </li>
                        <li>
                            <button type="button" class="btnCTMenu">New
                                Movies
                            </button>
                        </li>
                        <li>
                            <button type="button" class="btnCTMenu">TV
                                Seris
                            </button>
                        </li>
                        <li>
                            <button type="button" class="btnCTMenu">China
                                Movies
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-9 right__side">
                <div class="right_side_v1">
                    <img
                            src="${pageContext.request.contextPath}/views/assets/images/banners/1.jpg"
                            alt="banner_first" class="banner__film" width="100%">
                    <div class="container content">
                        <p class="title">Rebort Action Story 5</p>
                        <div class="cat">
                            <ul>
                                <li><span>Category : </span> <span class="name">"English
											movies - 2019"</span></li>
                                <li><span>Genre : </span> <span>Action, Drama</span></li>
                            </ul>
                        </div>
                        <div class="play__btn">
                            <a href="#" class="video_btn" style=""> <img
                                    src="${pageContext.request.contextPath}/views/assets/images/logos/play-button.png"
                                    alt="play"> <span>Play Trailer</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<div class="tmoves_new__arrivals">
    <div class="container">
        <div class="row tmoves_hadding">
            <h2>
					<span class="col-lg-3 col-md-6 text-uppercase">Suggested
						movies</span>
                <div class="col-lg-6 d-flex" id="select__sort">
                    <select class="form-select" aria-label="Default select example"
                            style="width: 40%;">
                        <option selected>Sort by</option>
                        <option value="1">Title</option>
                        <option value="2">View count</option>
                        <option value="3">Price</option>
                    </select> <select class="form-select ms-2"
                                      aria-label="Default select example" style="width: 40%;">
                    <option selected>Show</option>
                    <option value="1">15</option>
                    <option value="2">25</option>
                    <option value="3">50</option>
                </select>
                </div>
                <div class="col-lg-3 col-md-6 control">
                    <div class="btnPage">
                        <a href=""><i class="ri-arrow-left-s-line"></i></a>
                    </div>
                    <div class="btnPage">
                        <a href="">1</a>
                    </div>
                    <div class="btnPage">
                        <a href="">2</a>
                    </div>
                    <div class="btnPage">
                        <a href="">3</a>
                    </div>
                    <div class="btnPage">
                        <a href=""><i class="ri-arrow-right-s-line"></i></a>
                    </div>
                </div>

            </h2>

            <span class="border-bottom"></span>
        </div>


        <div class="row list__v__item">
            <c:forEach var="item" items="${list}">
                <div class="col-sm-12 col-lg-3 video__item gradient">
                    <img
                            src="${pageContext.request.contextPath}/views/assets/images/products/${item.poster}"
                            alt="film">
                    <div class="movies__content"
                         style="padding-bottom: 0.7rem; background-color: rgba(0, 0, 0, 0.6);">
                        <a href="">${item.title}</a>
                        <div class="v__tag">Romance, English, 2019</div>
                        <div class="v__bottom">
                            <div class="v__time">
                                <i class="ri-time-line"></i><span>2 Hr 3 Min</span>
                            </div>
                            <div class="likle_icon">
                                <a href=""><i class="ri-heart-line"></i></a>
                            </div>
                            <div class="likle_icon">
                                <a href=""><i class="ri-share-line"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="playbtn">
                        <a href="${url}/detail/${item.id}"><img
                                src="${pageContext.request.contextPath}/views/assets/images/logos/play-button.png"
                                alt=""></a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="container wrap__ct__items">
    <div class="row tmoves_hadding">
        <h2>
            <span class="col-sm-3 text-uppercase">Suggested movies</span>
            <div class="col-sm-6 d-flex" id="select__sort">
                <select class="form-select" aria-label="Default select example"
                        style="width: 40%;">
                    <option selected>Sort by</option>
                    <option value="1">Title</option>
                    <option value="2">View count</option>
                    <option value="3">Price</option>
                </select> <select class="form-select ms-2"
                                  aria-label="Default select example" style="width: 40%;">
                <option selected>Show</option>
                <option value="1">15</option>
                <option value="2">25</option>
                <option value="3">50</option>
            </select>
            </div>
            <div class="col-sm-3 control">
                <div class="btnPage">
                    <a href=""><i class="ri-arrow-left-s-line"></i></a>
                </div>
                <div class="btnPage">
                    <a href="">1</a>
                </div>
                <div class="btnPage">
                    <a href="">2</a>
                </div>
                <div class="btnPage">
                    <a href="">3</a>
                </div>
                <div class="btnPage">
                    <a href=""><i class="ri-arrow-right-s-line"></i></a>
                </div>
            </div>

        </h2>

        <span class="border-bottom"></span>
    </div>
    <div class="row list_items">
        <c:forEach var="item" items="${list}">
            <div class="col-xl-3 col-lg-4 col-sm-6 mt-3 suggested__item">
                <div class="wrap__item" style="overflow: hidden;">
                    <div class="item__image">
                        <img
                                src="${pageContext.request.contextPath}/views/assets/images/products/${item.poster}"
                                alt="">
                    </div>
                    <div class="item__content">
                        <div class="ct">
                            <span>English</span>
                        </div>
                        <a href="${url}/detail/${item.id}">${item.title}</a>
                        <div class="body d-flex">
                            <div class="duration__time">
                                <i class="ri-time-line"></i><span>2 Hr 32 Mn</span>
                            </div>
                            <div class="likle_icon">
                                <a href="#1"><i class="ri-heart-line"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<footer>
    <div class="contanter">
        <div class="footer__top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-3">
                        <img
                                src="${pageContext.request.contextPath}/views/assets/images/footers/1.jpg"
                                alt="footer">
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <img
                                src="${pageContext.request.contextPath}/views/assets/images/footers/2.jpg"
                                alt="footer">
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <img
                                src="${pageContext.request.contextPath}/views/assets/images/footers/3.jpg"
                                alt="footer">
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <img
                                src="${pageContext.request.contextPath}/views/assets/images/footers/4.jpg"
                                alt="footer">
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__center">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-3">
                        <div class="footer__title">
                            <h2>Movies Categgory</h2>
                        </div>
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
                        <div class="footer__title">
                            <h2>Information</h2>
                        </div>
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
                        <div class="footer__title">
                            <h2>Locations</h2>
                        </div>
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
                        <div class="footer__title">
                            <h2>Newsleter</h2>
                        </div>
                        <div class="footer__content">
                            <p>Nếu bạn muốn nhận thông tin mới nhanh nhất và cập nhật
                                mỗi ngày từ công ty chúng tôi bạn chỉ cần đăng kí tin tức bằng
                                email mà không hề mất phí.</p>
                            <div class="newsleter">
                                <input type="text" name="newsleter" id="newsleter"
                                       placeholder="Enter Address Email....">
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
<!--=============== MAIN JS ===============-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/Main.js"></script>
</body>
</html>
