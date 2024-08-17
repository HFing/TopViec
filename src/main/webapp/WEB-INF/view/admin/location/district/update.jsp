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
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Districts</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/location/district">District</a>
                                    </li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update District</h3>
                                            <hr />
                                            <c:if test="${not empty error}">
                                                <div class="alert alert-danger">${error}</div>
                                            </c:if>
                                            <form:form method="post"
                                                action="/admin/location/district/update/${district.id}"
                                                modelAttribute="district" class="row" enctype="multipart/form-data">
                                                <div class="mb-3 col-12">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">District Name:</label>
                                                    <form:input type="text" class="form-control" required="true"
                                                        path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <c:set var="errorCity">
                                                        <form:errors path="city.id" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">City:</label>
                                                    <form:select path="city.id"
                                                        class="form-control ${not empty errorCity? 'is-invalid':''}">
                                                        <form:option value="" label="Select a city" />
                                                        <form:options items="${cities}" itemValue="id"
                                                            itemLabel="name" />
                                                    </form:select>
                                                    ${errorCity}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/scripts.js"></script>
            </body>

            </html>