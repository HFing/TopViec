<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard</title>
                <link href="/admin/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/user">User</a></li>
                                    <li class="breadcrumb-item active">Detail</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-8 col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>User Detail</h3>
                                            </div>

                                            <hr />
                                            <div class="card" style="width: 80%">
                                                <div class="card-header text-center">
                                                    User Information
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item text-center">
                                                        <img src="/images/avatar/${user.avatarUrl}" alt="User Image"
                                                            style="max-width: 50%; height: auto;">
                                                    </li>
                                                    <li class="list-group-item">ID: ${user.id}</li>
                                                    <li class="list-group-item">Email: ${user.email}</li>
                                                    <li class="list-group-item">FullName: ${user.fullName}</li>
                                                    <li class="list-group-item">Phone: ${user.phone}</li>
                                                    <li class="list-group-item">Password: ${user.password}</li>
                                                    <li class="list-group-item">Active:
                                                        <c:choose>
                                                            <c:when test="${user.isActive}">
                                                                Có
                                                            </c:when>
                                                            <c:otherwise>
                                                                Không
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                    <li class="list-group-item">Created At: ${formattedCreateAt}</li>
                                                    <li class="list-group-item">Updated At: ${formattedUpdateAt}</li>
                                                    <li class="list-group-item">Avatar URL: ${user.avatarUrl}</li>
                                                    <li class="list-group-item">Email Notification Active:
                                                        <c:choose>
                                                            <c:when test="${user.emailNotificationActive}">
                                                                Có
                                                            </c:when>
                                                            <c:otherwise>
                                                                Không
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                    <li class="list-group-item">Has Company:
                                                        <c:choose>
                                                            <c:when test="${user.hasCompany}">
                                                                Có
                                                            </c:when>
                                                            <c:otherwise>
                                                                Không
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                    <li class="list-group-item">Email Verified:
                                                        <c:choose>
                                                            <c:when test="${user.isVerifyEmail}">
                                                                Có
                                                            </c:when>
                                                            <c:otherwise>
                                                                Không
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                    <li class="list-group-item">Role Name: ${user.roleName}</li>
                                                </ul>
                                            </div>
                                            <a href="/admin/user" class="btn btn-success mt-3">Back</a>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/scripts.js"></script>
            </body>

            </html>