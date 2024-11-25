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
        <c:url value="/homepage" var="url" />
        <jsp:include page="assets/views/Header.jsp"/>
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
                                        <a href="${pageContext.request.contextPath}/videos/like/${item.id}"><i class="ri-heart-line"></i></a>
                                    </div>
                                    <div class="likle_icon">
                                        <button type="button" class="text-white" style="background-color: transparent;"><i class="ri-share-line" data-bs-toggle="modal" data-bs-target="#share"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="playbtn">
                                <a href="${pageContext.request.contextPath}/videos/detail/${item.id}"><img
                                        src="${pageContext.request.contextPath}/views/assets/images/logos/play-button.png"
                                        alt=""></a>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- Modal -->
                    <div class="modal fade center" id="share" tabindex="-1" aria-labelledby="share"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <form action="${pageContext.request.contextPath}/videos/share/${item.id}" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="share">Share Video</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Nhập vào email muốn gửi">
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
                                <a href="${pageContext.request.contextPath}/videos/detail/${item.id}">${item.title}</a>
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
        <jsp:include page="./assets/views/Footer.jsp"/>
        <!--=============== MAIN JS ===============-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/views/assets/js/Main.js"></script>
    </body>
</html>
