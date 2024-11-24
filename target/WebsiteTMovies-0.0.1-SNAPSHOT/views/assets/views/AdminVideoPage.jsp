<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 11/12/2024
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Nhúng thư viện bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- ==============Nhúng RemixIcon=================== -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.4.0/remixicon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/styleAdmin.css"/>

        <title>Admin</title>
    </head>

    <body>
        <div class="wrapper">
            <!--==== Include sidebar ====-->
            <jsp:include page="NavbarAdmin.jsp"/>
            <!--  CONTROL - TAB-PANES -->
            <div class="main p-2"> <!-- div bọc cao nhất của main-->
                <div class="container">
                    <!--Phần title không thay đổi nhiều-->
                    <div class="row">
                        <div class="col-sm-12 align-content-center p-0"><h3 class="title rounded">Management Videos</h3></div>
                    </div>
                </div>
                
                <!--Phần control tab-pane-->
                <div class="container p-0 container-tabs">
                    <div class="tabs d-flex">
                        <div class="tab-item active_tab p-2 ">
                            <i class="ri-video-add-fill"></i>
                            Video Edition
                        </div>
                        <div class="tab-item p-2">
                            <i class="ri-film-line"></i>
                            Video List
                        </div>
                    </div>
                    <!-- Line  -->
                    <div class="line"></div>
                </div>

                <!-- Tab-content -->
                <div class="tab-content">
                    <div class="tab-pane active_pane">
                        <div class="container p-5 rounded h-100">
                            <form method="post" id="form">
                                <div class="col-12">
                                    <h3 class="text-center pb-4 m-0">FORM DETAIL INFORMATION VIDEO</h3>
                                </div>
                                <div class="row ps-5 pe-5">
                                    <div class="col-sm-4 p-2 pb-3">
                                        <img src="${pageContext.request.contextPath}/views/assets/images/products/10.jpg" class="rounded img-thumbnail w-100" style="height: 300px; object-fit: cover;" alt="Cinque Terre">
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="col mb-3 input-control">
                                            <label for="id" class="form-label">VIDEO ID:</label>
                                            <input type="text" class="form-control" id="id" name="id"
                                                   placeholder="Id automatic">
                                            <div class="error"></div>
                                        </div>
                                        <div class="col mb-3 input-control">
                                            <label for="pwd" class="form-label">VIDEO TITLE:</label>
                                            <input type="text" class="form-control" id="pwd" name="password"
                                                   placeholder="Enter title video">
                                            <div class="error"></div>
                                        </div>
                                        <div class="col mb-3 input-control">
                                            <label for="fullname" class="form-label">VIEW COUNT:</label>
                                            <input type="text" class="form-control" id="fullname" name="fullname"
                                                   placeholder="View count" readonly>
                                            <div class="error"></div>
                                        </div>
                                        <div class="col mb -3 d-flex">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="true" name="admin"
                                                       id="admin">
                                                <label class="form-check-label" for="admin">
                                                    ACTIVE
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="radio" value="false" name="admin"
                                                       id="user">
                                                <label class="form-check-label" for="user">
                                                    INACTIVE
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Enter description" id="floatingTextarea2" style="min-height: 100px"></textarea>
                                            <label for="floatingTextarea2">Description</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col-12 p-2 " style="text-align: center;">
                                        <button type="submit" class="btn btn-color m-1" onclick="submitForm(this)"
                                                value="0">Create</button>
                                        <button type="submit" class="btn btn-color m-1" onclick="submitForm(this)"
                                                value="1">Insert</button>
                                        <button type="submit" class="btn btn-color m-1" value="reset"
                                                onclick="clickReset()">Reset</button>
                                        <button type="submit" class="btn btn-color m-1" formaction="./Detail.html"
                                                onclick="clickDelete(this)" value="delete">Delete</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--tab-pane list-->
                    <div class="tab-pane">
                        <div class="container p-5 rounded">
                            <h2 class="pb-2">Danh sách tất cả các video của hệ thống:</h2>
                            <div class="row mb-2">
                                <div class="col-sm-5 d-flex ">
                                    <input type="text" class="form-control-sm w-100 border" placeholder="Nhập title video bạn muốn"
                                           aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    <form method="post" action="">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-info" type="button">Search</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-7">
                                    <form action="./Detail.html" method="post">
                                        <select class="form-select" name="selectOption" aria-label="Default select example"
                                                onchange="this.form.submit()">
                                            <option value="" selected>Lọc theo trạng thái</option>
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
                                            <th scope="col">VIDEO ID</th>
                                            <th scope="col">VIDEO TITLE</th>
                                            <th scope="col">VIEW COUNT</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">ACTION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                            <td class="rtblemail">@mdo</td>
                                            <td><a href=""><i class="ri-edit-2-line"></i></a></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                            <td class="rtblemail">@mdo</td>
                                            <td><a href=""><i class="ri-edit-2-line"></i></a></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                            <td class="rtblemail"> @mdo</td>
                                            <td><a href=""><i class="ri-edit-2-line"></i></a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row" style=" align-items: center;">
                                <ul class="pagination col-sm-12">
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
        </div>
        <!--=============== MAIN JS ===============-->
        <script src="${pageContext.request.contextPath}/views/assets/js/Admin.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
