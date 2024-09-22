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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css"
                    rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Find Candidate</h1>

                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Find Candidate</li>
                                </ol>

                                <div class="col-12 mx-auto">
                                    <div class="d-flex justify-content-between align-items-center">

                                        <form class="w-100 ms-3">
                                            <div class="row g-2">
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <span class="input-group-text">
                                                            <i class="bi bi-search"></i>
                                                        </span>
                                                        <input type="text" class="form-control"
                                                            placeholder="Tìm kiếm..." aria-label="Search">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <select class="form-select" aria-label="Chọn Tỉnh/Thành phố">
                                                        <option selected>Chọn Tỉnh/Thành phố</option>
                                                        <option value="1">Hà Nội</option>
                                                        <option value="2">Tp.HCM</option>
                                                        <option value="3">Đà Nẵng</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                    <button class="btn btn-warning w-100" type="submit">
                                                        <i class="bi bi-search"></i> Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <hr />
                                    <c:forEach var="candidate" items="${infoResumes}">
                                        <div class="col-12 mx-auto">
                                            <div class="card mb-4" style="height: 120px; overflow: hidden;">
                                                <!-- Thêm height và overflow -->
                                                <div class="card-body">
                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <h5 class="card-title">${candidate.user.fullName}
                                                            (${candidate.title})</h5>
                                                        <div class="icons">
                                                            <i class="bi bi-heart"></i>
                                                            <a href="/recruiter/candidate/${candidate.id}">
                                                                <i class="bi bi-eye"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <p class="card-text mb-0">${candidate.position.displayName} -
                                                            <span class="badge bg-secondary">${candidate.salaryMin} -
                                                                ${candidate.salaryMax} triệu</span>
                                                        </p>
                                                        <span
                                                            class="badge bg-light text-muted">${candidate.experience.displayName}</span>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <p class="card-text mb-0"><i class="bi bi-geo-alt"></i>
                                                            ${candidate.city.name} -
                                                            <i class="bi bi-building"></i>
                                                            ${candidate.typeOfWorkplace.displayName}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>



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