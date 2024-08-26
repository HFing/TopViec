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
                                    <li class="breadcrumb-item active"><a href="/admin/company">Companies</a></li>
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a company</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/company/create"
                                                modelAttribute="newCompany" class="row" enctype="multipart/form-data">
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
                                                        <option value="" disabled selected>Select your company size
                                                        </option>
                                                        <c:forEach var="size" items="${employeeSizes}">
                                                            <option value="${size.id}">${size.sizeDescription}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>




                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label for="city" class="form-label">City:</label>
                                                        <select id="city" name="city" class="form-control">
                                                            <option value="" disabled selected>Select your city</option>
                                                            <c:forEach var="city" items="${cities}">
                                                                <option value="${city.id}">${city.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="district" class="form-label">District:</label>
                                                        <select id="district" name="district" class="form-control">
                                                            <option value="" disabled selected>Select your district
                                                            </option>
                                                            <c:forEach var="district" items="${districts}">
                                                                <option value="${district.id}">${district.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>



                                                <!-- <div class="mb-3">
                                                    <label for="companyImageUrl" class="form-label">Company
                                                        Image:</label>
                                                    <form:input path="companyImageUrl" cssClass="form-control"
                                                        id="companyImageUrl" type="file" accept=".png, .jpg, .jpeg"
                                                        name="companyImageUrl" />
                                                </div>

                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;"
                                                        alt="companyImageUrl preview" id="companyImageUrlPreview" />
                                                </div>




                                                <div class="mb-3">
                                                    <label for="companyCoverImageUrl" class="form-label">Company Cover
                                                        Image:</label>
                                                    <form:input path="companyCoverImageUrl" cssClass="form-control"
                                                        id="companyCoverImageUrl" type="file" accept=".png, .jpg, .jpeg"
                                                        name="companyCoverImageUrl" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;"
                                                        alt="companyCoverImageUrl preview"
                                                        id="companyCoverImageUrlPreview" />
                                                </div> -->



                                                <div class="mb-3">
                                                    <label for="description" class="form-label">Description:</label>
                                                    <form:textarea path="description" cssClass="form-control"
                                                        id="description" rows="3" />
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
                    function fetchDistricts(cityId) {
                        if (!cityId) {
                            console.error('City ID is required');
                            return;
                        }

                        const url = `/admin/api/districts?cityId=` + cityId;
                        fetch(url)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                const districtSelect = document.getElementById('district');
                                districtSelect.innerHTML = '<option value="" disabled selected>Select your district</option>';
                                data.forEach(district => {
                                    const option = document.createElement('option');
                                    option.value = district.id;
                                    option.textContent = district.name;
                                    districtSelect.appendChild(option);
                                });
                            })
                            .catch(error => console.error('Error fetching districts:', error));
                    }

                    document.addEventListener('DOMContentLoaded', function () {
                        const cityDropdown = document.getElementById('city');
                        if (!cityDropdown) {
                            console.error('City dropdown not found');
                            return;
                        }

                        cityDropdown.addEventListener('change', function () {
                            const cityId = this.value;
                            fetchDistricts(cityId);
                        });
                    });
                </script>

            </body>

            </html>