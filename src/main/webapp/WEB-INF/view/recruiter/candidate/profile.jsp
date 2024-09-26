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

                            <div id="layoutSidenav_content">

                                <div class="container mt-5" id="cvContainer">
                                    <!-- Header Section -->
                                    <div class="row mb-4">
                                        <div class="col-12 d-flex align-items-center">
                                            <img src="/images/avatar/${candidate.user.avatarUrl}" alt="Profile Picture"
                                                class="rounded-circle me-3" style="width: 100px; height: 100px;">
                                            <div>

                                                <h2>${candidate.user.fullName}</h2>
                                                <h5 class="text-muted">${candidate.title}</h5>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Action Buttons -->
                                    <div class="row mb-4">
                                        <div class="col-12 d-flex justify-content-start">
                                            <button class="btn btn-outline-secondary me-2" onclick="printDiv()">
                                                <i class="bi bi-file-earmark"></i> Tải CV
                                            </button>

                                            <form:form method="post" action="/recruiter/candidate/save"
                                                modelAttribute="infoResumeSaved">
                                                <form:hidden path="resume.id" value="${candidate.id}" />
                                                <button type="submit" class="btn btn-outline-secondary me-2">
                                                    <i
                                                        class="bi ${isSaved ? 'bi-heart-fill text-danger' : 'bi-heart'}"></i>
                                                    Lưu
                                                </button>
                                            </form:form>

                                            <button class="btn btn-outline-secondary"><i class="bi bi-envelope"></i>
                                                Liên hệ</button>
                                        </div>
                                    </div>






                                    <!-- Personal Info -->
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <h5>Thông tin cá nhân</h5>
                                            <p><strong>Email:</strong> ${candidate.user.email} </p>
                                            <p><strong>Ngày sinh:</strong> ${candidate.jobSeekerProfile.birthday}</p>
                                            <p><strong>Quận/Huyện:</strong>
                                                ${candidate.jobSeekerProfile.location.district.name}</p>
                                            <p><strong>Địa chỉ:</strong>
                                                ${candidate.jobSeekerProfile.address}</p>
                                        </div>
                                        <div class="col-md-6">
                                            </br>
                                            </br>
                                            <p><strong>Số điện thoại:</strong> ${candidate.user.phone}</p>
                                            <p><strong>Giới tính:</strong> ${candidate.jobSeekerProfile.gender}</p>
                                            <p><strong>Tỉnh/Thành phố:</strong>
                                                ${candidate.jobSeekerProfile.location.city.name}</p>
                                        </div>
                                    </div>

                                    <!-- Job Info -->
                                    <div class="row mb-4">
                                        <h5>Thông tin chung</h5>
                                        <div class="col-md-6">
                                            <p><strong>Vị trí mong muốn:</strong> ${candidate.title}</p>
                                            <p><strong>Kinh nghiệm:</strong> ${candidate.experience.displayName}</p>
                                            <p><strong>Mức lương mong muốn:</strong>${candidate.salaryMin} -
                                                ${candidate.salaryMax} triệu</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Cấp bậc mong muốn:</strong> ${candidate.position.displayName}</p>
                                            <p><strong>Nghề nghiệp:</strong> ${candidate.career.name}</p>
                                            <p><strong>Nơi làm việc:</strong>
                                                ${candidate.typeOfWorkplace.displayName}</p>
                                        </div>
                                    </div>

                                    <!-- Career Goal -->
                                    <div class="row mb-4">
                                        <h5>Mục tiêu nghề nghiệp</h5>
                                        <p>${candidate.description}</p>
                                    </div>

                                    <!-- Experience -->
                                    <div class="row mb-4">
                                        <h5>Kinh nghiệm làm việc</h5>
                                        <c:forEach var="experience" items="${candidate.experienceDetails}">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">${experience.jobName}</h5>
                                                    <h6 class="card-subtitle mb-2 text-muted">${experience.companyName}
                                                    </h6>
                                                    <p class="card-text">(${experience.startDate}) -
                                                        (${experience.endDate})
                                                    </p>
                                                    <p>${experience.description}</p>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>

                                    <!-- Education -->
                                    <div class="row mb-4">
                                        <h5>Học vấn</h5>
                                        <c:forEach var="edu" items="${candidate.educationDetails}">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">${edu.degreeName} - ${edu.trainingPlaceName}
                                                    </h5>

                                                    <p class="card-text">(${edu.startDate}) - (${edu.completedDate})</p>
                                                    <p>${edu.description}</p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <!-- Certifications -->
                                    <div class="row mb-4">
                                        <h5>Chứng chỉ</h5>
                                        <c:forEach var="cert" items="${candidate.certificates}">

                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">${cert.name} - ${cert.trainingPlaceName}</h5>
                                                    <p class="card-text">(${cert.startDate}) - (${cert.expirationDate})
                                                    </p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <!-- Languages -->
                                    <div class="row mb-4">
                                        <h5>Ngôn ngữ</h5>
                                        <ul class="list-group">
                                            <c:forEach var="language" items="${candidate.languageSkills}">
                                                <li class="list-group-item">
                                                    <strong>${language.language.displayName}</strong> - Mức độ thành
                                                    thạo:
                                                    <span class="text-warning">
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${i <= language.level}">
                                                                    ★
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ☆
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </span>
                                                    <c:choose>
                                                        <c:when test="${language.level == 1}">(Bad)</c:when>
                                                        <c:when test="${language.level == 2}">(Below Average)</c:when>
                                                        <c:when test="${language.level == 3}">(Average)</c:when>
                                                        <c:when test="${language.level == 4}">(Good)</c:when>
                                                        <c:when test="${language.level == 5}">(Excellent)</c:when>
                                                    </c:choose>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>

                                    <!-- Skills -->
                                    <div class="row mb-4">
                                        <h5>Kỹ năng chuyên môn</h5>
                                        <ul class="list-group">

                                            <c:forEach var="skill" items="${candidate.advancedSkills}">
                                                <li class="list-group-item">
                                                    <strong>${skill.name}</strong> - Mức độ thành
                                                    thạo:
                                                    <span class="text-warning">
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${i <= skill.level}">
                                                                    ★
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ☆
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </span>
                                                    <c:choose>
                                                        <c:when test="${skill.level == 1}">(Bad)</c:when>
                                                        <c:when test="${skill.level == 2}">(Below Average)</c:when>
                                                        <c:when test="${skill.level == 3}">(Average)</c:when>
                                                        <c:when test="${skill.level == 4}">(Good)</c:when>
                                                        <c:when test="${skill.level == 5}">(Excellent)</c:when>
                                                    </c:choose>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </main>
                        </br>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/recruiter/js/scripts.js"></script>
                <script>
                    function printDiv() {
                        var printContents = document.getElementById("cvContainer").cloneNode(true);
                        var buttons = printContents.querySelector(".row.mb-4 .col-12.d-flex.justify-content-start");
                        if (buttons) {
                            buttons.remove();
                        }
                        var printWindow = window.open('', '', 'height=800, width=800');
                        printWindow.document.write('<html><head><title>Print CV</title>');
                        printWindow.document.write('<link href="/recruiter/css/styles.css" rel="stylesheet" />');
                        printWindow.document.write('<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">');
                        printWindow.document.write('<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">');
                        printWindow.document.write('</head><body >');
                        printWindow.document.write(printContents.innerHTML);
                        printWindow.document.write('<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></' + 'script>');
                        printWindow.document.write('</body></html>');
                        printWindow.document.close();
                        printWindow.print();
                    }
                </script>


            </body>

            </html>