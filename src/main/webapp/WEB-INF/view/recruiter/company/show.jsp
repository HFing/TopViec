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
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                </style>
                <script>
                    $(document).ready(() => {
                        // Company Image Preview
                        const companyImage = $("#companyImage");
                        const existingCompanyImage = "${existingCompany.companyImageUrl}";
                        if (existingCompanyImage) {
                            const imgURL = "/images/company/" + existingCompanyImage;
                            $("#companyImagePreview").attr("src", imgURL);
                            $("#companyImagePreview").css({ "display": "block" });
                        }
                        companyImage.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#companyImagePreview").attr("src", imgURL);
                            $("#companyImagePreview").css({ "display": "block" });
                        });

                        // Company Cover Image Preview
                        const companyCover = $("#companyCover");
                        const existingCompanyCoverImage = "${existingCompany.companyCoverImageUrl}";
                        if (existingCompanyCoverImage) {
                            const imgURL = "/images/companycover/" + existingCompanyCoverImage;
                            $("#companyCoverPreview").attr("src", imgURL);
                            $("#companyCoverPreview").css({ "display": "block" });
                        }
                        companyCover.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#companyCoverPreview").attr("src", imgURL);
                            $("#companyCoverPreview").css({ "display": "block" });
                        });
                    });


                    $(document).ready(function () {
                        setTimeout(function () {
                            $(".alert-popup").alert('close');
                        }, 3000);
                    });

                </script>
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
                                <h1 class="mt-4">Manage Company</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/recruiter">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/recruiter/company">Company</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Your Company</h3>
                                            <hr />
                                            <form:form method="post" action="/recruiter/company/update"
                                                modelAttribute="existingCompany" class="row"
                                                enctype="multipart/form-data">

                                                <input type="hidden" name="id" value="${existingCompany.id}" />
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="companyName" class="form-label">Company
                                                            Name:</label>
                                                        <form:input path="companyName" cssClass="form-control"
                                                            id="companyName" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="taxCode" class="form-label">Tax Code:</label>
                                                        <form:input path="taxCode" cssClass="form-control"
                                                            id="taxCode" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="companyEmail" class="form-label">Company
                                                            Email:</label>
                                                        <form:input path="companyEmail" cssClass="form-control"
                                                            id="companyEmail" type="email" required="true" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="companyPhone" class="form-label">Company
                                                            Phone:</label>
                                                        <form:input path="companyPhone" cssClass="form-control"
                                                            id="companyPhone" required="true" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label for="since" class="form-label">Since:</label>
                                                        <form:input path="since" cssClass="form-control" id="since"
                                                            type="date" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="fieldOperation" class="form-label">Field of
                                                            Operation:</label>
                                                        <form:input path="fieldOperation" cssClass="form-control"
                                                            id="fieldOperation" />
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="websiteUrl" class="form-label">Website URL:</label>
                                                    <form:input path="websiteUrl" cssClass="form-control"
                                                        id="websiteUrl" type="url" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="facebookUrl" class="form-label">Facebook URL:</label>
                                                    <form:input path="facebookUrl" cssClass="form-control"
                                                        id="facebookUrl" type="url" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="youtubeUrl" class="form-label">YouTube URL:</label>
                                                    <form:input path="youtubeUrl" cssClass="form-control"
                                                        id="youtubeUrl" type="url" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="linkedinUrl" class="form-label">LinkedIn URL:</label>
                                                    <form:input path="linkedinUrl" cssClass="form-control"
                                                        id="linkedinUrl" type="url" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="employeeSize" class="form-label">Company Size:</label>
                                                    <form:select path="employeeSize.id" cssClass="form-control"
                                                        id="employeeSize" required="true">
                                                        <option value="" disabled>Select your company size</option>
                                                        <c:forEach var="size" items="${employeeSizes}">
                                                            <option value="${size.id}" <c:if
                                                                test="${size.id == existingCompany.employeeSize.id}">
                                                                selected</c:if>>${size.sizeDescription}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label for="city" class="form-label">City:</label>
                                                        <select id="city" name="city" class="form-control">
                                                            <option value="" disabled>Select your city</option>
                                                            <c:forEach var="city" items="${cities}">
                                                                <option value="${city.id}" <c:if
                                                                    test="${city.id == existingCompany.location.city.id}">
                                                                    selected</c:if>>${city.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="district" class="form-label">District:</label>
                                                        <select id="district" name="district" class="form-control"
                                                            data-selected-id="${existingCompany.location.district.id}">
                                                            <option value="" disabled>Select your district</option>
                                                            <c:forEach var="district" items="${districts}">
                                                                <option value="${district.id}" <c:if
                                                                    test="${district.id == existingCompany.location.district.id}">
                                                                    selected</c:if>>${district.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="companyImage" class="form-label">Company Image:</label>
                                                    <input class="form-control" type="file" id="companyImage"
                                                        accept=".png, .jpg, .jpeg" name="companyImage" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; max-width: 50%;"
                                                        alt="companyImage preview" id="companyImagePreview"
                                                        src="/images/company/${existingCompany.companyImageUrl}" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="companyCover" class="form-label">Company Cover
                                                        Image:</label>
                                                    <input class="form-control" type="file" id="companyCover"
                                                        accept=".png, .jpg, .jpeg" name="companyCover" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 350px; max-width: 80%;"
                                                        alt="companyCover preview" id="companyCoverPreview"
                                                        src="/images/companycover/${existingCompany.companyCoverImageUrl}" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="description" class="form-label">Description:</label>
                                                    <form:textarea path="description" cssClass="form-control"
                                                        id="description" rows="3"></form:textarea>
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Update</button>
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
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // Replace textarea with Quill editor
                        const textarea = document.getElementById('description');
                        const quillContainer = document.createElement('div');
                        quillContainer.style.height = '200px';
                        textarea.parentNode.insertBefore(quillContainer, textarea);
                        textarea.style.display = 'none';

                        const quill = new Quill(quillContainer, {
                            theme: 'snow'
                        });

                        // Set initial content from textarea
                        quill.root.innerHTML = textarea.value;

                        // Sync Quill content with textarea
                        quill.on('text-change', function () {
                            textarea.value = quill.root.innerHTML;
                        });

                        // Submit content
                        document.querySelector('form').onsubmit = function () {
                            textarea.value = quill.root.innerHTML;
                        };
                    });
                </script>
                <script>
                    $(document).ready(() => {
                        const companyImageUrl = $("#companyImageUrl");
                        companyImageUrl.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#companyImageUrlPreview").attr("src", imgURL);
                            $("#companyImageUrlPreview").css({ "display": "block" });
                        });

                        const companyCoverImageUrl = $("#companyCoverImageUrl");
                        companyCoverImageUrl.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#companyCoverImageUrlPreview").attr("src", imgURL);
                            $("#companyCoverImageUrlPreview").css({ "display": "block" });
                        });
                    });
                </script>

                <script>
                    function fetchDistricts(cityId, selectedDistrictId = null) {
                        if (!cityId) {
                            console.error('City ID is required');
                            return;
                        }

                        const url = `/api/districts?cityId=` + cityId;
                        fetch(url)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                const districtSelect = document.getElementById('district');
                                districtSelect.innerHTML = '<option value="" disabled>Select your district</option>';
                                data.forEach(district => {
                                    const option = document.createElement('option');
                                    option.value = district.id;
                                    option.textContent = district.name;
                                    if (selectedDistrictId && district.id === parseInt(selectedDistrictId)) {
                                        option.selected = true;
                                    }
                                    districtSelect.appendChild(option);
                                });
                            })
                            .catch(error => console.error('Error fetching districts:', error));
                    }

                    document.addEventListener('DOMContentLoaded', function () {
                        const cityDropdown = document.getElementById('city');
                        const districtDropdown = document.getElementById('district');

                        if (!cityDropdown) {
                            console.error('City dropdown not found');
                            return;
                        }

                        cityDropdown.addEventListener('change', function () {
                            const cityId = this.value;
                            fetchDistricts(cityId);
                        });

                        // Fetch districts for the initially selected city if any
                        const initialCityId = cityDropdown.value;
                        const initialDistrictId = districtDropdown.getAttribute('data-selected-id');
                        if (initialCityId) {
                            fetchDistricts(initialCityId, initialDistrictId);
                        }
                    });
                </script>
            </body>

            </html>