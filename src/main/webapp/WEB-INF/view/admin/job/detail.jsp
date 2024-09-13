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
                                <h1 class="mt-4">Manage Companies</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/job">Jobs</a></li>
                                    <li class="breadcrumb-item active">Detail</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-8 col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Job Detail</h3>
                                            </div>

                                            <hr />
                                            <div class="card" style="width: 80%">
                                                <div class="card-header text-center">
                                                    Job Information
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">
                                                        <strong>Job Name:</strong> ${jobPost.jobName}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Description:</strong> ${jobPost.jobDescription}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Requirements:</strong> ${jobPost.jobRequirement}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Benefits:</strong> ${jobPost.benefitsEnjoyed}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Salary:</strong> ${jobPost.salaryMin} -
                                                        ${jobPost.salaryMax}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Location:</strong> ${cityname}, ${districtname}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Deadline:</strong> ${jobPost.deadline}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Career:</strong> ${careername}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Experience:</strong> ${jobPost.experience}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Position:</strong> ${jobPost.position}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Academic Level:</strong> ${jobPost.academicLevel}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Type of Workplace:</strong> ${jobPost.typeOfWorkplace}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Job Type:</strong> ${jobPost.jobType}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Contact Person:</strong> ${jobPost.contactPersonName}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Contact Phone:</strong> ${jobPost.contactPersonPhone}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Contact Email:</strong> ${jobPost.contactPersonEmail}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>User:</strong> ${user}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Company:</strong> ${companyname}
                                                    </li>
                                                    <li class="list-group-item">
                                                        <strong>Urgent:</strong> ${jobPost.isUrgent ? 'Yes' : 'No'}
                                                    </li>
                                                </ul>
                                            </div>
                                            <a href="/admin/job" class="btn btn-success mt-3">Back</a>
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