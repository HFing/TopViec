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

                                <div class="container mt-5">
                                    <!-- Header Section -->
                                    <div class="row mb-4">
                                        <div class="col-12 d-flex align-items-center">
                                            <img src="profile.jpg" alt="Profile Picture" class="rounded-circle me-3"
                                                style="width: 100px; height: 100px;">
                                            <div>
                                                <h2>${candidate.user.fullName}</h2>
                                                <h5 class="text-muted">${candidate.title}</h5>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Action Buttons -->
                                    <div class="row mb-4">
                                        <div class="col-12 d-flex justify-content-start">
                                            <button class="btn btn-outline-secondary me-2"><i
                                                    class="bi bi-file-earmark"></i> Tải CV</button>
                                            <button class="btn btn-outline-secondary me-2"><i class="bi bi-heart"></i>
                                                Lưu</button>
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
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Lập trình viên Python</h5>
                                                <h6 class="card-subtitle mb-2 text-muted">Công ty TNHH MTV Dịch Vụ AAA
                                                </h6>
                                                <p class="card-text">31/12/2022 - 30/11/2023</p>
                                                <p>Mô tả quá trình làm việc tại đây.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Education -->
                                    <div class="row mb-4">
                                        <h5>Học vấn</h5>
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Cử nhân Công nghệ thông tin</h5>
                                                <h6 class="card-subtitle mb-2 text-muted">Trường Đại học Mở TP. HCM</h6>
                                                <p class="card-text">31/08/2019 - 08/09/2023</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Certifications -->
                                    <div class="row mb-4">
                                        <h5>Chứng chỉ</h5>
                                        <ul class="list-group">
                                            <li class="list-group-item">Chứng Chỉ A - Trung tâm Đào tạo ABC - Không thời
                                                hạn</li>
                                            <li class="list-group-item">Chứng Chỉ B - Trung tâm Đào tạo DEF - Không thời
                                                hạn</li>
                                        </ul>
                                    </div>

                                    <!-- Languages -->
                                    <div class="row mb-4">
                                        <h5>Ngôn ngữ</h5>
                                        <ul class="list-group">
                                            <li class="list-group-item"><strong>Việt Nam</strong> - Mức độ thành thạo:
                                                <span class="text-warning">★★★★★</span>
                                            </li>
                                            <li class="list-group-item"><strong>Anh</strong> - Mức độ thành thạo: <span
                                                    class="text-warning">★★★★☆</span></li>
                                            <li class="list-group-item"><strong>Pháp</strong> - Mức độ thành thạo: <span
                                                    class="text-warning">★★★☆☆</span></li>
                                        </ul>
                                    </div>

                                    <!-- Skills -->
                                    <div class="row mb-4">
                                        <h5>Kỹ năng chuyên môn</h5>
                                        <ul class="list-group">
                                            <li class="list-group-item"><strong>Python</strong> - Mức độ thành thạo:
                                                <span class="text-warning">★★★★★</span>
                                            </li>
                                            <li class="list-group-item"><strong>Javascript</strong> - Mức độ thành thạo:
                                                <span class="text-warning">★★★★★</span>
                                            </li>
                                            <li class="list-group-item"><strong>SQL</strong> - Mức độ thành thạo: <span
                                                    class="text-warning">★★★★★</span></li>
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
            </body>

            </html>