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
                <link href="/admin/css/styles.css" rel="stylesheet" />
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
                                    <div class="d-flex justify-content-between">
                                        <form class="w-100 ms-3" method="get" action="/admin/job/search">
                                            <div class="row g-2">
                                                <div class="col-md-4">
                                                    <select class="form-select" id="company" name="company">
                                                        <option value="" selected>Select Company</option>
                                                        <c:forEach var="company" items="${companies}">
                                                            <option value="${company.id}">${company.companyName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="status" name="status">
                                                        <option value="" selected>Select Status</option>
                                                        <option value="1">Approved</option>
                                                        <option value="2">Pending</option>
                                                        <option value="0">Rejected</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                    <button class="btn btn-warning w-100" type="submit">
                                                        <i class="bi bi-search"></i> Search
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    </br>
                                    <div class="d-flex justify-content-between">
                                        <h3>Table Jobs</h3>
                                        <a href="/admin/job/create" class="btn btn-primary">Create</a>
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
                                            <c:forEach var="jobPost" items="${jobList}">
                                                <tr>
                                                    <td>${jobPost.jobName}</td>
                                                    <td>${jobPost.formattedCreateAt}</td>

                                                    <td>${jobPost.deadline}</td>
                                                    <td>${jobPost.views}</td>
                                                    <td>
                                                        <form:form modelAttribute="jobPost"
                                                            action="/admin/job/updateStatus" method="post"
                                                            class="form-inline">
                                                            <form:hidden path="id" value="${jobPost.id}" />
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <div class="form-group">
                                                                <select name="status" class="form-control"
                                                                    onchange="this.form.submit()">
                                                                    <option value="1" ${jobPost.status==1 ? 'selected'
                                                                        : '' }>Approved</option>
                                                                    <option value="2" ${jobPost.status==2 ? 'selected'
                                                                        : '' }>Pending</option>
                                                                    <option value="0" ${jobPost.status==0 ? 'selected'
                                                                        : '' }>Rejected</option>
                                                                </select>
                                                            </div>
                                                        </form:form>
                                                    </td>
                                                    <td>
                                                        <a href="/admin/job/${jobPost.id}"
                                                            class="btn btn-success">View</a>
                                                        <a href="/admin/job/delete?id=${jobPost.id}"
                                                            class="btn btn-danger">Delete</a>
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
                <script src="/admin/js/scripts.js"></script>
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