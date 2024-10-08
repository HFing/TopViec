<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard</title>
                <link href="/recruiter/css/styles.css" rel="stylesheet" />
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    .alert-popup {
                        position: fixed;
                        top: 20px;
                        right: 20px;
                        z-index: 1050;
                        width: auto;
                        max-width: 300px;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <c:if test="${not empty message}">
                            <div class="alert alert-success alert-dismissible fade show alert-popup" role="alert">
                                ${message}
                            </div>
                        </c:if>
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Job</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Jobs</li>
                                </ol>

                                <div class="col-12 mx-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="badge badge-info mr-3"
                                            style="background-color: #17a2b8; color: white;">
                                            Job Posts Used: ${jobFeaturedUsed}
                                        </span>
                                        <span class="badge badge-success"
                                            style="background-color: #28a745; color: white;margin-left: 10px;">
                                            Total Featured Job Posts: ${jobFeaturedCount}
                                        </span>
                                    </div>
                                    <hr />
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Job Name</th>
                                                <th scope="col">Create At</th>
                                                <th scope="col">Deadline</th>
                                                <th scope="col">Views</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="jobPost" items="${jobPosts}">
                                                <tr>
                                                    <td>${jobPost.jobName}</td>
                                                    <td>${jobPost.formattedCreateAt}</td>
                                                    <td>${jobPost.deadline}</td>
                                                    <td>${jobPost.views}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${jobPost.status == 1}">
                                                                Approved
                                                            </c:when>
                                                            <c:when test="${jobPost.status == 2}">
                                                                Pending
                                                            </c:when>
                                                            <c:when test="${jobPost.status == 0}">
                                                                Rejected
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>

                                                        <a href="/recruiter/job/toggleHot?id=${jobPost.id}"
                                                            class="btn btn-info mx-2">
                                                            ${jobPost.isHot ? 'Unmark Hot' : 'Mark Hot'}
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/recruiter/js/scripts.js"></script>
                <script>
                    $(document).ready(function () {
                        // Tự động ẩn thông báo sau 5 giây
                        setTimeout(function () {
                            $(".alert-popup").alert('close');
                        }, 3000);
                    });
                </script>
            </body>

            </html>