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
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script
                    src="https://cdn.tiny.cloud/1/ztsvbvwzg98dnem4joz89sswtejc3e1fafotcd7lpy6osf11/tinymce/7/tinymce.min.js"
                    referrerpolicy="origin"></script>
                referrerpolicy="origin"></script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Company</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/recruiter">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/recruiter/company">Company</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Image Company</h3>
                                            <hr />
                                            <div class="mb-3">
                                                <h4>Existing Images</h4>
                                                <div class="row">
                                                    <c:forEach var="image" items="${existingCompany.images}">
                                                        <div class="col-md-4 mb-3">
                                                            <div class="card">
                                                                <img src="/images/companyimg/${image.imageUrl}"
                                                                    alt="Company Image"
                                                                    class="card-img-top img-fluid" />
                                                                <div class="card-body">
                                                                    <p class="card-text">Uploaded on: ${image.createAt}
                                                                    </p>
                                                                    <form:form method="post"
                                                                        action="/recruiter/company/image/delete"
                                                                        class="d-inline">
                                                                        <input type="hidden" name="imageId"
                                                                            value="${image.id}" />
                                                                        <button type="submit"
                                                                            class="btn btn-danger btn-sm">Delete</button>
                                                                    </form:form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <form:form method="post" action="/recruiter/company/image"
                                                enctype="multipart/form-data" class="row">
                                                <div class="mb-3">
                                                    <label for="companyImage" class="form-label">Add New
                                                        Images:</label>
                                                    <input class="form-control" type="file" id="companyImage"
                                                        name="companyImage" multiple accept=".png, .jpg, .jpeg"
                                                        required />
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Upload Images</button>
                                                </div>
                                            </form:form>
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
                <script src="/recruiter/js/scripts.js"></script>


            </body>

            </html>