<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 11/12/2024
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ==============RemixIcon=================== -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.4.0/remixicon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/styleAdmin.css"/>
    <title>Admin</title>
    <style>
        table tr td,
        table tr th{
            user-select: none;
        }
    </style>
</head>

<body>
<c:url value="/mngmt/reports" var="url"/>
<div class="wrapper">
    <%--Include side bar--%>
    <jsp:include page="NavbarAdmin.jsp"/>

    <!-- CONTROL - TAB-PANES -->
    <div class="main p-2"> <!-- div bọc cao nhất của main-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 align-content-center p-0"><h3 class="title rounded">Management Reports</h3></div>
            </div>
        </div>
        <%--Control tab-pane--%>
        <div class="container p-0 container-tabs">
            <div class="tabs d-flex">
                <div class="tab-item ${tabActive==0?'active_tab':''} p-2 d-flex">
                    <i class="ri-video-add-fill"></i>
                    <a href="${url}/favouritesSigle" class="ms-1 text-dark">Favorites</a>
                </div>
                <div class="tab-item p-2 ${tabActive==1?'active_tab':''}">
                    <i class="ri-film-line "></i>
                    <a href="${url}/favouritesUser" class="ms-1 text-dark">Favorite Users</a>
                </div>
                <div class="tab-item p-2 ${tabActive==2?'active_tab':''} ">
                    <i class="ri-share-line"></i>
                    <a href="${url}/favouritesShare" class="ms-1 text-dark">Shares Friends </a>
                </div>
            </div>
            <!-- Line  -->
            <div class="line"></div>
        </div>

        <!-- Tab-content -->
        <div class="tab-content">
            <div class="tab-pane ${tabActive==0?'active_pane':''}">
                <div class="container p-5 rounded">
                    <h2 class="pb-2">Danh sách tất cả các Favourites:</h2>
                    <div class="row mb-2">
                        <div class="col-sm-5 d-flex ">
                            <input type="text" class="form-control-sm w-100 border"
                                   placeholder="Nhập title video bạn muốn"
                                   aria-label="Recipient's username" aria-describedby="basic-addon2">
                            <form method="post" action="">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-info" type="button">Search</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-7 d-flex">
                            <input class="form-control me-2" type="date" placeholder="Start Date:&nbsp;">
                            <input class="form-control" type="date" placeholder="End Date:&nbsp;">
                        </div>
                    </div>
                    <div class="row">
                        <table class="table">
                            <thead>
                            <tr class="table-info">
                                <th scope="col">#</th>
                                <th scope="col">VIDEO TITLE</th>
                                <th scope="col">FAVORITE COUNT</th>
                                <th scope="col">LASTEST DATE</th>
                                <th scope="col">OLDEST DATE</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${list}" varStatus="vs">
                                <tr>
                                    <th scope="row">${vs.count}</th>
                                    <td>${item[0]}</td>
                                    <td>${item[1]}</td>
                                    <td>${item[2]}</td>
                                    <td class="rtblemail">${item[3]}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style=" align-items: center;">
                        <ul class="pagination col-sm-12 justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link " href="#">1</a></li>
                            <li class="page-item"><a class="page-link " href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link active" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-pane ${tabActive==1?'active_pane':''}">
                <div class="container p-5 rounded">
                    <h2 class="pb-2">Danh sách tất cả các Favourite Users:</h2>
                    <div class="row mb-2">
                        <div class="col-sm-5">
                            <form method="post" action="" class="d-flex">
                                <input type="text" class="form-control-sm w-100 border"
                                       placeholder="Nhập name user bạn muốn"
                                       aria-label="Recipient's username" aria-describedby="basic-addon2" name="title" value="">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-info" type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-7">
                            <form action="./Detail.html" method="post">
                                <select class="form-select" name="selectOption" aria-label="Default select example"
                                        onchange="this.form.submit()">
                                    <option value="" selected>Lọc theo tên video</option>
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <table class="table">
                            <thead>
                            <tr class="table-info">
                                <th scope="col">#</th>
                                <th scope="col">USERNAME</th>
                                <th scope="col">FULLNAME</th>
                                <th scope="col">EMAIL</th>
                                <th scope="col">FAVOURITE DATE</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${list}" varStatus="vs">
                                <tr>
                                    <th scope="row">${vs.count}</th>
                                    <td>${item[0]}</td>
                                    <td>${item[1]}</td>
                                    <td>${item[2]}</td>
                                    <td class="rtblemail">${item[3]}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style=" align-items: center;">
                        <ul class="pagination col-sm-12 justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link " href="#">1</a></li>
                            <li class="page-item"><a class="page-link " href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link active" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-pane ${tabActive==2?'active_pane':''}">
                <div class="container p-5 rounded">
                    <h2 class="pb-2">Danh sách tất cả video shares:</h2>
                    <div class="row mb-2">
                        <div class="col-sm-5  ">
                            <form method="post" action="${url}/favouritesShare" class="d-flex">
                            <input type="text" class="form-control-sm w-100 border"
                                   placeholder="Nhập name user bạn muốn"
                                   aria-label="Recipient's username" aria-describedby="basic-addon2" name="search" value="${param.search}">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-info" type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-7">
                            <form action="./Detail.html" method="post">
                                <select class="form-select" name="selectOption" aria-label="Default select example"
                                        onchange="this.form.submit()">
                                    <option value="" selected>Lọc theo tên video</option>
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <table class="table">
                            <thead>
                            <tr class="table-info">
                                <th scope="col">#</th>
                                <th scope="col">Video Title</th>
                                <th scope="col">Người Thích</th>
                                <th scope="col">Ngày Thích</th>
<%--                                <th scope="col">SEND DATE</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${list}" varStatus="vs">
                                <tr>
                                    <th scope="row">${vs.count}</th>
                                    <td>${item[0]}</td>
                                    <td>${item[1]}</td>
                                    <td>${item[2]}</td>
<%--                                    <td class="rtblemail">${item[3]}</td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style=" align-items: center;">
                        <ul class="pagination col-sm-12 justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link " href="#">1</a></li>
                            <li class="page-item"><a class="page-link " href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link active" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--=============== MAIN JS ===============-->
    <script src="${pageContext.request.contextPath}/views/assets/js/Admin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
