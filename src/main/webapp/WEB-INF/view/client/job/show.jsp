<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="/client/css/style.css">
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <style>
                    .contact-info {
                        margin: 10px auto;
                        padding: 0px 10px;
                    }

                    #cart-container {
                        position: fixed;
                        top: 0;
                        right: 0;
                        height: 100%;
                        width: auto;
                        /* Giữ nguyên chiều rộng */
                        z-index: 1000;
                        /* Đảm bảo phần tử nằm trên các phần tử khác */
                        background-color: white;
                        /* Đặt màu nền nếu cần */
                        box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
                        /* Thêm bóng đổ nếu cần */
                        overflow-y: auto;
                        /* Thêm thanh cuộn dọc nếu nội dung vượt quá chiều cao */
                    }

                    .backlink {
                        display: flex;
                        align-items: center;
                        text-decoration: none;
                        color: inherit;
                        transition: color 0.3s ease;
                    }

                    .arrow {
                        margin-right: 10px;
                        transition: transform 0.3s ease, color 0.3s ease;
                    }

                    .backlink:hover {
                        color: rgb(0, 97, 255);
                    }

                    .backlink:hover .arrow {
                        transform: translateX(-5px);
                        color: rgb(0, 97, 255);
                    }

                    .modal {
                        display: none;
                        position: fixed;
                        z-index: 1;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        background-color: rgba(0, 0, 0, 0.4);
                    }

                    .modal-content {
                        background-color: #fefefe;
                        margin: auto;
                        padding: 20px;
                        border: 1px solid #888;
                        width: 70%;
                        height: 70%;
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        overflow-y: auto;
                    }

                    .close {
                        color: #aaa;
                        float: right;
                        font-size: 28px;
                        font-weight: bold;
                    }

                    .close:hover,
                    .close:focus {
                        color: black;
                        text-decoration: none;
                        cursor: pointer;
                    }
                </style>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div class="section job-post">
                    <div class="container-default w-container">
                        <c:if test="${not empty message}">
                            <div class="alert-popup" role="alert">
                                <span class="icon">✔️</span>
                                <span>${message}</span>
                            </div>
                        </c:if>
                        <div class="backlink-wrapper">
                            <a href="/" class="backlink">
                                <div class="arrow">&#9664;</div>Back to homepage
                            </a>
                        </div>
                        <div class="job-post-wrapper">
                            <div data-w-id="5086ac48-b95c-42a9-0a58-6e690b1c648f"
                                style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                                class="split-content job-post-body">
                                <div class="card job-post">
                                    <div data-w-id="ebcc2b89-9ed8-8b91-2d0e-6dfaa089b244"
                                        class="image-wrapper card-job-post">
                                        <img src="/images/companycover/${jobPost.company.companyCoverImageUrl}"
                                            alt="Webflow"
                                            sizes="(max-width: 767px) 93vw, (max-width: 991px) 95vw, (max-width: 1439px) 74vw, 847px"
                                            class="image card-job-post"
                                            style="will-change: transform; transform: translate3d(0px, -3.1064px, 0px) scale3d(1.01553, 1.01553, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                    </div>
                                    <div class="card-job-post-content">
                                        <div class="card-job-post-content-top">
                                            <div class="card-job-post-title-wrapper">
                                                <div class="image-wrapper card-job-post-logo"><img
                                                        src="/images/company/${jobPost.company.companyImageUrl}"
                                                        alt="Backend Software Engineer"
                                                        class="image card-job-post-logo"></div>
                                                <h1 class="title h2-size card-job-post">${jobPost.jobName}</h1>
                                            </div>
                                            <div class="card-job-post-categories-wrapper">
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                                            alt="Location Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Location</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">
                                                        ${jobPost.typeOfWorkplace.displayName}</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                            alt="Graph Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Level</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">
                                                        ${jobPost.position.displayName}
                                                    </div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                                            alt="Portfolio Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Department</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">${jobPost.career.name}
                                                    </div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc517c90080b634e591a_icon-4-job-categories-job-board-x-template.svg"
                                                            alt="Clock Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Type</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">
                                                        ${jobPost.jobType.displayName}
                                                    </div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51d7c3af8320618b87_icon-5-job-categories-job-board-x-template.svg"
                                                            alt="Money Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Salary Up to</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">${formattedSalaryMax} VND
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="divider card-job-post-content-divider"></div>
                                        <div class="card-job-post-content-bottom">
                                            <div class="job-description-title-wrapper">
                                                <h2 class="title h3-size job-description">Job Description</h2>
                                                <div class="job-description-date-wrapper">
                                                    <div class="job-description-date-text">Deadline:&nbsp;</div>
                                                    <fmt:formatDate value="${jobPost.deadline}"
                                                        pattern="MMMM dd, yyyy" />
                                                </div>
                                            </div>
                                            <div class="w-richtext">
                                                ${jobPost.jobDescription}


                                            </div>
                                            <h2 class="title h3-size job-rich-text">Benefits</h2>
                                            <div class="w-richtext">
                                                ${jobPost.benefitsEnjoyed}
                                            </div>
                                            <h2 class="title h3-size job-rich-text">Job Requirements</h2>
                                            <div class="w-richtext">
                                                ${jobPost.jobRequirement}
                                            </div>


                                            <h2 class="title h3-size job-rich-text">Contact</h2>
                                            <div class="w-richtext contact-info card">
                                                <div class="contact-info">
                                                    <p><span class="contact-label">Name:</span> <span
                                                            class="contact-value">${jobPost.contactPersonName}</span>
                                                    </p>
                                                    <p><span class="contact-label">Phone:</span> <span
                                                            class="contact-value">${jobPost.contactPersonPhone}</span>
                                                    </p>
                                                    <p><span class="contact-label">Email:</span> <span
                                                            class="contact-value">${jobPost.contactPersonEmail}</span>
                                                    </p>
                                                </div>
                                            </div>
                                            </br>

                                            <c:choose>
                                                <c:when test="${hasApplied}">
                                                    <a href="javascript:void(0);"
                                                        class="button-secondary apply-button w-button">Already
                                                        applied</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:void(0);" onclick="openApplyModal()"
                                                        class="button-primary apply-button w-button">Apply now</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div data-w-id="bd5ebe39-4c1d-b6ea-1c19-d384bef2b3eb"
                                    style="transform: translate3d(0px, 20px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 0; transform-style: preserve-3d;"
                                    class="job-post-sidebar-wrapper mobile">
                                    <div class="card job-post-sidebar">
                                        <div class="image-wrapper card-job-post-sidebar-icon"><img
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c8ee901a06a63a58ad0792_icon-apply-job-post-job-board-x-template.svg"
                                                alt="Check Icon - Job Board X Webflow Template"
                                                class="image card-job-post-sidebar-icon"></div>
                                        <div class="card-job-post-sidebar-content">
                                            <h3 class="title h4-size card-job-post-sidebar">Apply now</h3>
                                            <p class="paragraph card-job-post-sidebar">Please let TopViec know that you
                                                found
                                                this
                                                position on our job board, as that is a great way to support us, so we
                                                can keep
                                                posting cool jobs every day.</p><a href="#"
                                                class="button-primary small card-job-post-sidebar w-button">Apply
                                                now</a>
                                        </div>
                                    </div>
                                    <div class="card job-post-sidebar last">
                                        <div class="image-wrapper card-job-post-sidebar-icon"><img
                                                src="/images/company/${jobPost.company.companyImageUrl}" alt=""
                                                class="image card-job-post-sidebar-icon"></div>
                                        <div class="card-job-post-sidebar-content">
                                            <div class="card-job-post-sidebar-title-about-company-wrapper">
                                                <h3 class="title h4-size card-job-post-sidebar-about-company">About</h3>
                                                <h3 class="title h4-size card-job-post-sidebar-about-company">
                                                    ${jobPost.company.companyName}
                                                </h3>
                                            </div>
                                            <p class="paragraph card-job-post-sidebar">Lorem ipsum dolor sit amet,
                                                consectetur
                                                adipiscing elit. Sed turpis sit aliquam faucibus fringilla eu.</p><a
                                                href="/company/webflow"
                                                class="button-secondary small card-job-post-sidebar-about-company w-button">View
                                                company</a>
                                        </div>
                                    </div>
                                </div>


                                <!-- More job openings -->
                                <jsp:include page="../job/morejob.jsp" />


                            </div>
                            <div data-w-id="303e2183-3b6a-8bf1-f737-049bfd79a52e"
                                style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                                class="split-content job-post-sidebar">
                                <div class="job-post-sidebar-wrapper">
                                    <div class="card job-post-sidebar">
                                        <div class="image-wrapper card-job-post-sidebar-icon"><img
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c8ee901a06a63a58ad0792_icon-apply-job-post-job-board-x-template.svg"
                                                alt="Check Icon - Job Board X Webflow Template"
                                                class="image card-job-post-sidebar-icon"></div>
                                        <div class="card-job-post-sidebar-content">
                                            <h3 class="title h4-size card-job-post-sidebar">Apply now</h3>
                                            <p class="paragraph card-job-post-sidebar">Please let TopViec know that you
                                                found
                                                this
                                                position on our job board, as that is a great way to support us, so we
                                                can keep
                                                posting cool jobs every day.</p>
                                        </div>
                                        <c:choose>
                                            <c:when test="${hasApplied}">
                                                <a href="javascript:void(0);"
                                                    class="button-secondary apply-button w-button">Already applied</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(0);" onclick="openApplyModal()"
                                                    class="button-primary apply-button w-button">Apply now</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="card job-post-sidebar last">
                                        <div class="image-wrapper card-job-post-sidebar-icon"><img
                                                src="/images/company/${jobPost.company.companyImageUrl}" alt="Webflow"
                                                class="image card-job-post-sidebar-icon"></div>
                                        <div class="card-job-post-sidebar-content">
                                            <div class="card-job-post-sidebar-title-about-company-wrapper">
                                                <h3 class="title h4-size card-job-post-sidebar-about-company">About</h3>
                                                <h3 class="title h4-size card-job-post-sidebar-about-company">
                                                    ${jobPost.company.companyName}
                                                </h3>
                                            </div>
                                            <p class="paragraph card-job-post-sidebar">Lorem ipsum dolor sit amet,
                                                consectetur
                                                adipiscing elit. Sed turpis sit aliquam faucibus fringilla eu.</p>
                                        </div><a href="/companies/${jobPost.company.id}"
                                            class="button-secondary small card-job-post-sidebar-about-company w-button">View
                                            company</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal for job post activity -->
                <div id="applyModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeJobPostActivityModal()">&times;</span>
                        <p>Application Form</p>
                        <form:form id="jobPostActivityForm" modelAttribute="jobPostActivity" method="post"
                            action="/job/apply">
                            <div class="w-layout-grid card-post-job-form-grid">
                                <div class="input-wrapper">
                                    <label for="fullName">Full Name</label>
                                    <form:input path="fullName" id="fullName" cssClass="input w-input"
                                        required="true" />
                                </div>

                                <div class="input-wrapper">
                                    <label for="phone">Phone</label>
                                    <form:input path="phone" id="phone" cssClass="input w-input" required="true" />
                                </div>
                            </div>
                            <div class="input-wrapper">
                                <label for="email">Email</label>
                                <form:input path="email" id="email" cssClass="input w-input" required="true" />
                            </div>

                            <div class="input-wrapper">
                                <label for="resume">Resume</label>
                                <form:select path="resume.id" id="resume" cssClass="input w-input" required="true">
                                    <form:options items="${resumes}" itemValue="id" itemLabel="title" />
                                </form:select>
                            </div>
                            <br />

                            <!-- Trường ẩn để truyền jobPostId -->
                            <input type="hidden" name="jobPostId" value="${jobPost.id}" />

                            <button type="submit" class="button-primary small w-button">Apply</button>
                        </form:form>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />
                <script
                    src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                    type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                    crossorigin="anonymous"></script>
                <script>
                    function openApplyModal() {
                        document.getElementById('applyModal').style.display = 'block';
                    }

                    // Đóng modal
                    function closeApplyModal() {
                        document.getElementById('applyModal').style.display = 'none';
                    }

                    // Đóng modal khi nhấp ra ngoài modal
                    window.onclick = function (event) {
                        var modal = document.getElementById('applyModal');
                        if (event.target == modal) {
                            modal.style.display = 'none';
                        }
                    }
                </script>

                <script>
                    document.getElementById('open-cart-button').addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>
                        var cartContainer = document.getElementById('cart-container');
                        if (cartContainer.style.display === 'none' || cartContainer.style.display === '') {
                            cartContainer.style.display = 'block';
                        } else {
                            cartContainer.style.display = 'none';
                        }
                    });
                </script>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        setTimeout(function () {
                            var alertPopup = document.querySelector('.alert-popup');
                            if (alertPopup) {
                                alertPopup.classList.add('hide');
                                setTimeout(function () {
                                    alertPopup.remove();
                                }, 500); // Thời gian để hoàn thành hiệu ứng mờ dần
                            }
                        }, 3000); // 3 giây
                    });
                </script>



            </body>


            </html>