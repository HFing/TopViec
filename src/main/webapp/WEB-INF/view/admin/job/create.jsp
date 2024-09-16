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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <!-- Quill CSS -->
                <link href="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.snow.css" rel="stylesheet" />
                <!-- Quill JS -->
                <script src="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.js"></script>

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
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/job">Jobs</a></li>
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a Job</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/job/create"
                                                modelAttribute="newJobPost" class="row" enctype="multipart/form-data">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="jobName" class="form-label">Job Name:</label>
                                                        <form:input path="jobName" cssClass="form-control" id="jobName"
                                                            required="true" />
                                                    </div>
                                                </div>

                                                <!-- Add company selection -->
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="company" class="form-label">Company:</label>
                                                        <form:select path="company.id" cssClass="form-control"
                                                            id="company" required="true">
                                                            <option value="" disabled selected>Select your company
                                                            </option>
                                                            <c:forEach var="company" items="${companies}">
                                                                <option value="${company.id}">${company.companyName}
                                                                </option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
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
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="position" class="form-label">Desired Level:</label>
                                                        <form:select path="position" id="position"
                                                            cssClass="form-control" required="true">
                                                            <option value="" disabled selected>Select desired level
                                                            </option>
                                                            <form:options items="${positions}" itemValue="name"
                                                                itemLabel="displayName" />
                                                        </form:select>
                                                    </div>

                                                    <div class="col">
                                                        <label for="experience" class="form-label">Experience:</label>
                                                        <form:select path="experience" id="experience"
                                                            cssClass="form-control" required="true">
                                                            <option value="" disabled selected>Select experience
                                                            </option>
                                                            <form:options items="${experiences}" itemValue="name"
                                                                itemLabel="displayName" />
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="jobType" class="form-label">Job Type:</label>
                                                        <form:select path="jobType" id="jobType" cssClass="form-control"
                                                            required="true">
                                                            <option value="" disabled selected>Select job type</option>
                                                            <form:options items="${jobTypes}" itemValue="name"
                                                                itemLabel="displayName" />
                                                        </form:select>
                                                    </div>

                                                    <div class="col">
                                                        <label for="typeOfWorkplace" class="form-label">Type of
                                                            Workplace:</label>
                                                        <form:select path="typeOfWorkplace" id="typeOfWorkplace"
                                                            cssClass="form-control" required="true">
                                                            <option value="" disabled selected>Select type of workplace
                                                            </option>
                                                            <form:options items="${typeOfWorkplaces}" itemValue="name"
                                                                itemLabel="displayName" />
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
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
                                                        <label for="academicLevel" class="form-label">Academic
                                                            Level:</label>
                                                        <form:select path="academicLevel" id="academicLevel"
                                                            cssClass="form-control" required="true">
                                                            <option value="" disabled selected>Select academic level
                                                            </option>
                                                            <form:options items="${academicLevels}" itemValue="name"
                                                                itemLabel="displayName" />
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

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="city" class="form-label">City:</label>
                                                        <form:select path="location.city.id" id="city"
                                                            cssClass="form-control" onchange="fetchDistricts()">
                                                            <option value="" disabled selected>Select your city</option>
                                                            <form:options items="${cities}" itemValue="id"
                                                                itemLabel="name" />
                                                        </form:select>
                                                    </div>

                                                    <div class="col">
                                                        <label for="district" class="form-label">District:</label>
                                                        <form:select path="location.district.id" id="district"
                                                            cssClass="form-control">
                                                            <option value="" disabled selected>Select your district
                                                            </option>
                                                            <!-- Options will be populated by JavaScript -->
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="jobDescription" class="form-label">Job
                                                        Description:</label>
                                                    <div id="jobDescriptionEditor" class="form-control"
                                                        style="height: 200px;"></div>
                                                    <form:textarea path="jobDescription" cssClass="form-control"
                                                        id="jobDescription" style="display:none;" rows="3" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="jobRequirement" class="form-label">Job
                                                        Requirement:</label>
                                                    <div id="jobRequirementEditor" class="form-control"
                                                        style="height: 200px;"></div>
                                                    <form:textarea path="jobRequirement" cssClass="form-control"
                                                        id="jobRequirement" style="display:none;" rows="3" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="benefitsEnjoyed" class="form-label">Benefits
                                                        Enjoyed:</label>
                                                    <div id="benefitsEnjoyedEditor" class="form-control"
                                                        style="height: 200px;"></div>
                                                    <form:textarea path="benefitsEnjoyed" cssClass="form-control"
                                                        id="benefitsEnjoyed" style="display:none;" rows="3" />
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

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="isUrgent" class="form-label">Urgent:</label>
                                                        <form:checkbox path="isUrgent" cssClass="form-check-input"
                                                            id="isUrgent" />
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label for="isHot" class="form-label">Hot:</label>
                                                            <form:checkbox path="isHot" cssClass="form-check-input"
                                                                id="isHot" />
                                                        </div>
                                                    </div>
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
                <script src="/admin/js/scripts.js"></script>
                <script>
                    function fetchDistricts() {
                        var cityId = document.getElementById("city").value;
                        var districtSelect = document.getElementById("district");

                        // Clear existing options
                        districtSelect.innerHTML = '<option value="" disabled selected>Select your district</option>';

                        // Fetch districts based on cityId
                        fetch('/api/districts?cityId=' + cityId)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                data.forEach(district => {
                                    var option = document.createElement("option");
                                    option.value = district.id;
                                    option.text = district.name;
                                    districtSelect.appendChild(option);
                                });
                            })
                            .catch(error => console.error('Error fetching districts:', error));
                    }
                </script>

                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // Initialize Quill editors
                        const jobDescriptionEditor = new Quill('#jobDescriptionEditor', { theme: 'snow' });
                        const jobRequirementEditor = new Quill('#jobRequirementEditor', { theme: 'snow' });
                        const benefitsEnjoyedEditor = new Quill('#benefitsEnjoyedEditor', { theme: 'snow' });

                        // Set initial content from textareas
                        jobDescriptionEditor.root.innerHTML = document.getElementById('jobDescription').value;
                        jobRequirementEditor.root.innerHTML = document.getElementById('jobRequirement').value;
                        benefitsEnjoyedEditor.root.innerHTML = document.getElementById('benefitsEnjoyed').value;

                        // Sync Quill content with textareas
                        jobDescriptionEditor.on('text-change', function () {
                            document.getElementById('jobDescription').value = jobDescriptionEditor.root.innerHTML;
                        });

                        jobRequirementEditor.on('text-change', function () {
                            document.getElementById('jobRequirement').value = jobRequirementEditor.root.innerHTML;
                        });

                        benefitsEnjoyedEditor.on('text-change', function () {
                            document.getElementById('benefitsEnjoyed').value = benefitsEnjoyedEditor.root.innerHTML;
                        });

                        // Submit content
                        document.querySelector('form').onsubmit = function () {
                            document.getElementById('jobDescription').value = jobDescriptionEditor.root.innerHTML;
                            document.getElementById('jobRequirement').value = jobRequirementEditor.root.innerHTML;
                            document.getElementById('benefitsEnjoyed').value = benefitsEnjoyedEditor.root.innerHTML;
                        };
                    });
                </script>






            </body>

            </html>