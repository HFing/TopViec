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
                                <h1 class="mt-4">Save Candidate</h1>

                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Save Candidate</li>
                                </ol>

                                <div class="col-12 mx-auto">

                                    <hr />

                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Profile Name</th>
                                                <th>Candidate Name</th>
                                                <th>Salary</th>
                                                <th>Experience</th>
                                                <th>City/Province</th>
                                                <th>Saved Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="infoResume" items="${infoResumes}">
                                                <tr>
                                                    <td>${infoResume.resume.title}</td>
                                                    <td>${infoResume.resume.user.fullName}</td>
                                                    <td>${infoResume.resume.formattedSalary} (VND)</td>
                                                    <td>${infoResume.resume.experience.displayName}</td>
                                                    <td>${infoResume.resume.city.name}</td>
                                                    <td>${infoResume.savedAt}</td>
                                                    <td>

                                                        <a href="/recruiter/candidate/${infoResume.resume.id}"
                                                            class="btn btn-primary btn-sm">
                                                            <i class="bi bi-eye"></i> View
                                                        </a>

                                                        <form action="/recruiter/candidate/unsave/${infoResume.id}"
                                                            method="post" style="display:inline;">
                                                            <input type="hidden" name="_method" value="delete" />
                                                            <button type="submit" class="btn btn-danger btn-sm">
                                                                <i class="bi bi-x-circle"></i> Unsave
                                                            </button>
                                                        </form>
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


            </body>

            </html>