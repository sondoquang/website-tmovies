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
    <style>
        .pageActive {
            background-color: #0eb5df;
            color: #fff;
            border-radius: 4px;

            a {
                color: #fff;
            }
        }
    </style>
</head>

<body>
<c:url value="/home" var="url"/>
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
                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <c:forEach var="video" items="${listTopFavourite}" varStatus="vs">
                                <button type="button" data-bs-target="#carouselExampleCaptions"
                                        data-bs-slide-to="${vs.count-1}"
                                        class="${vs.count == 1?'active':''}"></button>
                            </c:forEach>
                        </div>
                        <div class="carousel-inner">
                            <c:forEach var="video" items="${listTopFavourite}" varStatus="vs">
                                <div class="carousel-item ${vs.count==1?'active':''}">
                                    <img src="${pageContext.request.contextPath}/views/assets/images/banners/${video.poster}"
                                         class="d-block w-100 rounded"
                                         style="height: 580px; object-fit: cover;" alt="...">
                                    <div class="carousel-caption d-none d-md-block rounded"
                                         style="background-color:rgba(0, 0, 0, 0.5);">
                                        <h2 class="title">${video.title}</h2>
                                        <div class="cat">
                                            <ul>
                                                <li>
                                                    <span>Category : </span>
                                                    <span class="name">"English movies - 2019"</span>
                                                </li>
                                                <li>
                                                    <span>Genre : </span>
                                                    <span>Action, Drama</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="play__btn">
                                            <a href="${pageContext.request.contextPath}/videos/detail/${video.id}"
                                               class="video_btn justify-content-center" style="cursor: poiter;">
                                                <img src="${pageContext.request.contextPath}/views/assets/images/logos/play-button.png"
                                                     alt="play">
                                                <span>Play Trailer</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <button class="carousel-control-prev" type="button"
                                data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button"
                                data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
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
                <form action="" method="post" class="col-lg-6 d-flex" id="select__sort">
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
                    <button type="submit" class="btn btn-info ms-2 text-white">Filter</button>
                </form>
                <div class="col-lg-3 col-md-6 control">
                    <div class="btnPage">
                        <a href="${url}/index/?page1=${page1Active<2?1:page1Active-1}"><i
                                class="ri-arrow-left-s-line"></i></a>
                    </div>
                    <c:forEach var="page" begin="1" end="${sumPage}" step="1">
                        <div class="btnPage ${page == page1Active?'pageActive':''}">
                            <a href="${url}/index/?page1=${page}">${page}</a>
                        </div>
                    </c:forEach>
                    <div class="btnPage">
                        <a href="${url}/index/?page1=${page1Active<sumPage-1?page1Active+1:sumPage}"><i
                                class="ri-arrow-right-s-line"></i></a>
                    </div>
                </div>

            </h2>

            <span class="border-bottom"></span>
        </div>


        <div class="row list__v__item">

            <c:forEach var="item" items="${list01}">
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
                                <a href="${pageContext.request.contextPath}/videos/like/${item.id}"><i
                                        class="ri-heart-line"></i></a>
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
                    <a href="${url}/index/?page2=${page2Active<2?1:page2Active-1}&page1=${page1Active}"><i
                            class="ri-arrow-left-s-line"></i></a>
                </div>
                <c:forEach var="page" begin="1" end="${sumPage}" step="1">
                    <div class="btnPage ${page == page2Active?'pageActive':''}">
                        <a href="${url}/index/?page2=${page}&page1=${page1Active}">${page}</a>
                    </div>
                </c:forEach>
            </div>
            <div class="btnPage">
                <a href="${url}/index/?page2=${page2Active<sumPage-1?page2Active+1:sumPage}&page1=${page1Active}"><i
                        class="ri-arrow-right-s-line"></i></a>
            </div>

        </h2>

        <span class="border-bottom"></span>
    </div>
    <div class="row list_items">
        <c:forEach var="item" items="${list02}">
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
                                <a href="${pageContext.request.contextPath}/videos/like/${item.id}" onclick="likeApi(this)"><i
                                        class="ri-heart-line"></i></a>
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
<script>
    // Lắng nghe sự kiện nhấn nút "Like"
    function likeApi(button) {
        // Thông tin dữ liệu cần gửi. Giả sử bạn cần gửi ID bài viết hoặc ID người dùng thích bài viết
        var likeData = button.value// ID bài viết
        // Gửi yêu cầu POST đến RESTful API sử dụng Fetch
        fetch("http://localhost:3979/WebsiteTMovies/api/videos/like", {
            method: 'POST',  // Hoặc PUT nếu bạn cập nhật dữ liệu hiện có
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(likeData)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Like successful:', data);
            })
            .catch(error => {
            });
    }
</script>
</body>
</html>
