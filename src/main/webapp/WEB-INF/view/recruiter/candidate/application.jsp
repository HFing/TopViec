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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css"
                    rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <!-- Quill CSS -->
                <link href="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.snow.css" rel="stylesheet" />
                <!-- Quill JS -->
                <script src="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.js"></script>
                <style>
                    .alert-popup {
                        position: fixed;
                        top: 20px;
                        right: 20px;
                        z-index: 1050;
                        width: auto;
                        max-width: 300px;
                    }

                    .modal-dialog-custom {
                        max-width: 800px;
                        /* Điều chỉnh chiều rộng theo ý bạn */
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
                                <h1 class="mt-4">Find Candidate</h1>

                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Find Candidate</li>
                                </ol>

                                <div class="col-12 mx-auto">
                                    <div class="d-flex justify-content-between align-items-center">

                                        <form class="w-100 ms-3" method="get"
                                            action="/recruiter/candidate/application/search">
                                            <div class="row g-2">
                                                <div class="col-md-6">
                                                    <select class="form-select" id="posted" name="posted">
                                                        <option value="" selected>Select Job Post</option>
                                                        <c:forEach var="jobPost" items="${jobPosts}">
                                                            <option value="${jobPost.id}">${jobPost.jobName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="status" name="status">
                                                        <option value="" selected>Select Status</option>
                                                        <option value="1">Pending Confirmation</option>
                                                        <option value="2">Contacted</option>
                                                        <option value="3">Tested</option>
                                                        <option value="4">Interviewed</option>
                                                        <option value="5">Hired</option>
                                                        <option value="0">Not Hired</option>
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
                                    <hr />
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Profile Name</th>
                                                <th>Job Position</th>
                                                <th>Submission Date</th>
                                                <th>Resume Type</th>
                                                <th>Recruitment Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="jobPostActivity" items="${jobPostActivities}">
                                                <tr>
                                                    <td>${jobPostActivity.resume.title} <br>
                                                        (${jobPostActivity.resume.user.fullName})
                                                    </td>
                                                    <td>${jobPostActivity.resume.position.displayName}</td>
                                                    <td>${jobPostActivity.createAt}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${jobPostActivity.resume.fileUrl == null}">
                                                                Online Resume
                                                            </c:when>
                                                            <c:otherwise>
                                                                Attached Resume
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <form action="/recruiter/candidate/updateStatus" method="post">
                                                            <input type="hidden" name="activityId"
                                                                value="${jobPostActivity.id}" />
                                                            <select name="status" onchange="this.form.submit()">
                                                                <option value="1" ${jobPostActivity.status==1
                                                                    ? 'selected' : '' }>Pending Confirmation</option>
                                                                <option value="2" ${jobPostActivity.status==2
                                                                    ? 'selected' : '' }>Contacted</option>
                                                                <option value="3" ${jobPostActivity.status==3
                                                                    ? 'selected' : '' }>Tested</option>
                                                                <option value="4" ${jobPostActivity.status==4
                                                                    ? 'selected' : '' }>Interviewed</option>
                                                                <option value="5" ${jobPostActivity.status==5
                                                                    ? 'selected' : '' }>Hired</option>
                                                                <option value="0" ${jobPostActivity.status==0
                                                                    ? 'selected' : '' }>Not Hired</option>
                                                            </select>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <a href="/recruiter/candidate/${jobPostActivity.resume.id}"
                                                            class="btn btn-primary btn-sm">
                                                            <i class="bi bi-eye"></i>
                                                        </a>



                                                        <a href="#" class="btn btn-secondary btn-sm"
                                                            data-bs-toggle="modal" data-bs-target="#sendMailModal"
                                                            data-resume-id="${jobPostActivity.resume.id}"
                                                            data-user-name="${jobPostActivity.resume.user.fullName}"
                                                            data-user-email="${jobPostActivity.resume.user.email}">
                                                            <i class="bi bi-envelope"></i> Send Mail
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

                <!-- Modal -->
                <div class="modal fade" id="sendMailModal" tabindex="-1" aria-labelledby="sendMailModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-custom">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="sendMailModalLabel">Send Mail</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="sendMailForm" method="post" action="/recruiter/candidate/sendMail">
                                    <div class="mb-3">
                                        <label for="recipientName" class="form-label">Recipient Name</label>
                                        <input type="text" class="form-control" id="recipientName" name="recipientName"
                                            readonly="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="recipientEmail" class="form-label">Recipient Email</label>
                                        <input type="email" class="form-control" id="recipientEmail"
                                            name="recipientEmail" readonly="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="emailSubject" class="form-label">Subject</label>
                                        <input type="text" class="form-control" id="emailSubject" name="emailSubject"
                                            required="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="emailContent" class="form-label">Content</label>
                                        <div id="emailContent" style="height: 200px;"></div>
                                        <input type="hidden" id="hiddenEmailContent" name="emailContent" />
                                    </div>
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quill CSS -->
                <link href="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.snow.css" rel="stylesheet" />
                <!-- Quill JS -->
                <script src="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.js"></script>

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


                    document.addEventListener('DOMContentLoaded', function () {
                        // Initialize Quill editor
                        var quill = new Quill('#emailContent', {
                            theme: 'snow'
                        });

                        // Handle modal show event
                        var sendMailModal = document.getElementById('sendMailModal');
                        sendMailModal.addEventListener('show.bs.modal', function (event) {
                            var button = event.relatedTarget;
                            var resumeId = button.getAttribute('data-resume-id');
                            var userName = button.getAttribute('data-user-name');
                            var userEmail = button.getAttribute('data-user-email');

                            var recipientNameInput = sendMailModal.querySelector('#recipientName');
                            var recipientEmailInput = sendMailModal.querySelector('#recipientEmail');

                            recipientNameInput.value = userName;
                            recipientEmailInput.value = userEmail;
                        });

                        var sendMailForm = document.getElementById('sendMailForm');
                        sendMailForm.addEventListener('submit', function (event) {
                            var hiddenEmailContent = document.getElementById('hiddenEmailContent');
                            hiddenEmailContent.value = quill.root.innerHTML;
                        });
                    });

                </script>


            </body>

            </html>