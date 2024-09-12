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
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Job Posts</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/jobpost">Job Posts</a></li>
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a Job Post</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/jobpost/create"
                                                modelAttribute="newJobPost" class="row" enctype="multipart/form-data">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="jobName" class="form-label">Job Name:</label>
                                                        <form:input path="jobName" cssClass="form-control" id="jobName"
                                                            required="true" />
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="career" class="form-label">Career:</label>
                                                        <form:select path="career.id" cssClass="form-control"
                                                            id="career" required="true">
                                                            <option value="" disabled selected>Select your career
                                                            </option>
                                                            <c:forEach var="career" items="${careers}">
                                                                <option value="${career.id}">${career.name}</option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>

                                                    <div class="col">
                                                        <label for="deadline" class="form-label">Deadline:</label>
                                                        <form:input path="deadline" cssClass="form-control"
                                                            id="deadline" type="date" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="quantity" class="form-label">Quantity:</label>
                                                        <form:input path="quantity" cssClass="form-control"
                                                            id="quantity" type="number" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="gender" class="form-label">Gender:</label>
                                                        <form:select path="gender" cssClass="form-control" id="gender">
                                                            <option value="0">Any</option>
                                                            <option value="1">Male</option>
                                                            <option value="2">Female</option>
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="jobDescription" class="form-label">Job
                                                        Description:</label>
                                                    <form:textarea path="jobDescription" cssClass="form-control"
                                                        id="jobDescription" rows="3" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="jobRequirement" class="form-label">Job
                                                        Requirement:</label>
                                                    <form:textarea path="jobRequirement" cssClass="form-control"
                                                        id="jobRequirement" rows="3" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="benefitsEnjoyed" class="form-label">Benefits
                                                        Enjoyed:</label>
                                                    <form:textarea path="benefitsEnjoyed" cssClass="form-control"
                                                        id="benefitsEnjoyed" rows="3" />
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="position" class="form-label">Position:</label>
                                                        <form:input path="position" cssClass="form-control"
                                                            id="position" type="number" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="typeOfWorkplace" class="form-label">Type of
                                                            Workplace:</label>
                                                        <form:input path="typeOfWorkplace" cssClass="form-control"
                                                            id="typeOfWorkplace" type="number" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="experience" class="form-label">Experience:</label>
                                                        <form:input path="experience" cssClass="form-control"
                                                            id="experience" type="number" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="academicLevel" class="form-label">Academic
                                                            Level:</label>
                                                        <form:input path="academicLevel" cssClass="form-control"
                                                            id="academicLevel" type="number" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="jobType" class="form-label">Job Type:</label>
                                                        <form:input path="jobType" cssClass="form-control" id="jobType"
                                                            type="number" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="salaryMin" class="form-label">Salary Min:</label>
                                                        <form:input path="salaryMin" cssClass="form-control"
                                                            id="salaryMin" type="number" step="0.01" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="salaryMax" class="form-label">Salary Max:</label>
                                                        <form:input path="salaryMax" cssClass="form-control"
                                                            id="salaryMax" type="number" step="0.01" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="isHot" class="form-label">Is Hot:</label>
                                                        <form:checkbox path="isHot" cssClass="form-check-input"
                                                            id="isHot" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="isUrgent" class="form-label">Is Urgent:</label>
                                                        <form:checkbox path="isUrgent" cssClass="form-check-input"
                                                            id="isUrgent" />
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="contactPersonName" class="form-label">Contact Person
                                                        Name:</label>
                                                    <form:input path="contactPersonName" cssClass="form-control"
                                                        id="contactPersonName" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="contactPersonPhone" class="form-label">Contact Person
                                                        Phone:</label>
                                                    <form:input path="contactPersonPhone" cssClass="form-control"
                                                        id="contactPersonPhone" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="contactPersonEmail" class="form-label">Contact Person
                                                        Email:</label>
                                                    <form:input path="contactPersonEmail" cssClass="form-control"
                                                        id="contactPersonEmail" type="email" />
                                                </div>



                                                <div class="mb-3">
                                                    <label for="company" class="form-label">Company:</label>
                                                    <form:select path="company.id" cssClass="form-control" id="company"
                                                        required="true">
                                                        <option value="" disabled selected>Select your company</option>
                                                        <c:forEach var="company" items="${companies}">
                                                            <option value="${company.id}">${company.name}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="location" class="form-label">Location:</label>
                                                    <form:select path="location.id" cssClass="form-control"
                                                        id="location" required="true">
                                                        <option value="" disabled selected>Select your location</option>
                                                        <c:forEach var="location" items="${locations}">
                                                            <option value="${location.id}">${location.name}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="user" class="form-label">User:</label>
                                                    <form:select path="user.id" cssClass="form-control" id="user"
                                                        required="true">
                                                        <option value="" disabled selected>Select your user</option>
                                                        <c:forEach var="user" items="${users}">
                                                            <option value="${user.id}">${user.name}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="status" class="form-label">Status:</label>
                                                    <form:input path="status" cssClass="form-control" id="status"
                                                        type="number" />
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Create</button>
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