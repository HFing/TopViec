<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Invoices</title>
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
                                <h1 class="mt-4">Manage Invoices</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Invoices</li>
                                </ol>

                                <div class="col-12 mx-auto">
                                    <div class="d-flex justify-content-between">
                                        <h3>Table Invoices</h3>
                                        <a href="/admin/invoice/create" class="btn btn-primary">Create</a>
                                    </div>

                                    <hr />
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Invoice ID</th>
                                                <th scope="col">User Name</th>
                                                <th scope="col">Amount</th>
                                                <th scope="col">Featured Count</th>
                                                <th scope="col">Created At</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="invoice" items="${invoices}">
                                                <tr>
                                                    <td>${invoice.id}</td>
                                                    <td>${invoice.userId}</td>
                                                    <td>${invoice.amount} $</td>
                                                    <td>${invoice.featuredCount}</td>
                                                    <td>${invoice.formattedCreatedAt}</td>
                                                    <td>

                                                        <a href="/admin/invoice/delete?id=${invoice.id}"
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