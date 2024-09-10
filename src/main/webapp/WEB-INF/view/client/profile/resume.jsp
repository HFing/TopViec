<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                <link rel="stylesheet" href="/client/css/style.css">
                <style>
                    .overlay {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        z-index: 1;
                    }

                    .desired-position {
                        font-size: 24px;
                        font-weight: bold;
                        color: #000;
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

                    #editProfileButton {
                        text-decoration: none;
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
                </style>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div class="section company">
                    <div class="container-default w-container">
                        <div class="backlink-wrapper">
                            <a href="/" class="backlink">
                                <div class="arrow">&#9664;</div>Back to HomePage
                            </a>
                        </div>
                        <div data-w-id="dd895fd4-7865-6962-cee0-3a705bd5c5dc"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                            class="card company">
                            <div data-w-id="20db60cc-5039-bf50-045f-0cadf330e220" class="image-wrapper company-cover">
                                <img src="/images/avatar/default_cover_profile.png" loading="eager"
                                    alt="user Cover Image"
                                    sizes="(max-width: 767px) 93vw, (max-width: 1439px) 95vw, 984px"
                                    class="image company-cover"
                                    style="will-change: transform; transform: translate3d(0px, -0.0024px, 0px) scale3d(1.00001, 1.00001, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                            </div>
                            <div class="company-content">
                                <div class="content-top company">
                                    <div class="image-wrapper company"><img src="/images/avatar/${avatarUrl}"
                                            alt="${user.fullName}" class="image company"></div>
                                    <div class="company-content-top-wrapper">
                                        <div class="split-content content-top-company-left">
                                            <h1 class="title h2-size company">${fullName}</h1>
                                            <div class="company-top-content-about-wrapper">
                                                <div class="company-about-details-wrapper"><img
                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c92f6a47c4a32090c952cd_icon-1-company-about-job-board-x-template.svg"
                                                        alt="Location Icon - Job Board X Webflow Template"
                                                        class="image company-about-details-icon">
                                                    <div>${phone}</div>
                                                </div>
                                                <div class="company-about-details-wrapper last"><img
                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c92f6aa77b760b050020b7_icon-2-company-about-job-board-x-template.svg"
                                                        alt="User Icon - Job Board X Webflow Template"
                                                        class="image company-about-details-icon">
                                                    <div>${email}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="split-content content-top-company-right"><a
                                                data-w-id="18e4c4a1-e2a5-df93-57f4-c9a8d529c360"
                                                href="${company.websiteUrl}" target="_blank"
                                                class="card-link-wrapper weight-medium w-inline-block">
                                                <div class="card-link" style="color: rgb(0, 97, 255);">Visit Website
                                                </div>
                                                <div class="card-link-arrow"
                                                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                    <div class="card-link-arrow-1"
                                                        style="background-color: rgb(0, 97, 255);"></div>
                                                    <div class="card-link-arrow-2"
                                                        style="background-color: rgb(0, 97, 255);"></div>
                                                    <div class="card-link-arrow-3"
                                                        style="background-color: rgb(0, 97, 255);"></div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div data-duration-in="300" data-duration-out="100" data-current="Company Jobs"
                                    data-easing="ease" class="company-tabs w-tabs">
                                    <div class="company-tabs-menu w-tab-menu" role="tablist">
                                        <a data-w-tab="Company Jobs"
                                            class="company-tab-link first w-inline-block w-tab-link"
                                            id="w-tabs-0-data-w-tab-0" href="/profile" aria-selected="false">
                                            <div>Company jobs</div>
                                        </a>
                                        <a data-w-tab="About Company"
                                            class="company-tab-link w-inline-block w-tab-link w--current"
                                            id="w-tabs-0-data-w-tab-1" href="/profile/resume" aria-selected="true">
                                            <div>Resume</div>
                                        </a>
                                        <a data-w-tab="Company Perks" class="company-tab-link w-inline-block w-tab-link"
                                            id="w-tabs-0-data-w-tab-2" href="/profile/accountsettings"
                                            aria-selected="false">
                                            <div>Account &amp; Settings</div>
                                        </a>
                                    </div>
                                    <div class="company-tabs-content w-tab-content">
                                        <div data-w-tab="About Company"
                                            class="company-tab-pane w-tab-pane w--tab-active"
                                            id="w-tabs-0-data-w-pane-1" role="tabpanel"
                                            aria-labelledby="w-tabs-0-data-w-tab-1">
                                            <div class="card-job-post-categories-wrapper">
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                                            alt="Location Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Location</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">${infoResume.city !=
                                                        null ? infoResume.city.name :
                                                        'Not
                                                        updated'}</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                            alt="Graph Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Level</div>
                                                    </div>
                                                    <div class="card-job-post-category-text"> ${infoResume.position !=
                                                        null ? infoResume.position
                                                        :
                                                        'Not
                                                        updated'}</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                                            alt="Portfolio Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Department</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">${infoResume.career != null
                                                        ? infoResume.career.name
                                                        :
                                                        'Not
                                                        updated'}</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc517c90080b634e591a_icon-4-job-categories-job-board-x-template.svg"
                                                            alt="Clock Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Type</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">${infoResume.jobType !=
                                                        null ? infoResume.jobType :
                                                        'Not
                                                        updated'}</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51d7c3af8320618b87_icon-5-job-categories-job-board-x-template.svg"
                                                            alt="Money Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Salary Max</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">${infoResume.salaryMax
                                                        != null ?
                                                        infoResume.salaryMax :
                                                        'Not
                                                        updated'} VND</div>
                                                </div>


                                                <a id="editProfileButton" class="button-primary"
                                                    href="/profile/resume/resume-update">Edit Profile</a>
                                            </div>

                                        </div>

                                        <div class="divider card-post-job-form"></div>

                                        <div class="post-job-wrapper">
                                            <div class="split-content post-job-sidebar">
                                                <div class="post-job-step-area-1">
                                                    <div class="post-job-step-wrapper _1">
                                                        <div class="image-wrapper post-job-step"><img
                                                                src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ca2461b93f2fa339d16415_icon-4-post-job-job-board-x-template.svg"
                                                                alt="User Icon - Job Board X Webflow Template"
                                                                class="image post-job-step"></div>
                                                        <div class="post-job-step-content">
                                                            <h2 class="title h3-size post-job-step">Attached Documents
                                                            </h2>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="post-job-form-block w-form">
                                                <c:choose>
                                                    <c:when test="${not empty infoResumeMain}">
                                                        <c:forEach var="resume" items="${infoResumeMain}">
                                                            <div class="card post-job-form-card">
                                                                <div class="input-wrapper">
                                                                    <div class="experience-detail"
                                                                        data-id="${resume.id}">
                                                                        <p>CV Name: ${resume.title}</p>
                                                                        <p>Desired Level: ${resume.position}</p>
                                                                        <p>Last Update: ${resume.updateAt}</p>
                                                                        <button type="button"
                                                                            class="button-secondary small w-button">Edit</button>
                                                                        <form
                                                                            action="/profile/resume/delete/${resume.id}"
                                                                            method="post" style="display:inline;">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <button type="submit"
                                                                                class="button-secondary small w-button">Delete</button>
                                                                        </form>
                                                                        <button type="button"
                                                                            class="button-secondary small w-button"
                                                                            onclick="openPdf('${resume.fileUrl}')">See
                                                                            Your
                                                                            CV</button>
                                                                        <a href="/images/resume/${resume.fileUrl}"
                                                                            class="button-secondary small w-button"
                                                                            download>
                                                                            <i class="fas fa-download"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <button class="button-primary small w-button button-small"
                                                            onclick="openAddResumeModal()">
                                                            <i class="fas fa-upload"></i> Upload CV
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="card job-empty-state w-dyn-empty">
                                                            <div class="job-empty-state-wrapper">
                                                                <div class="image-wrapper job-empty-state-icon">
                                                                    <img alt="Search Icon - Job Board X Webflow Template"
                                                                        src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60c94c777132722f6ab7e8b6_icon-job-empty-job-board-x-template.svg"
                                                                        class="image job-empty-state">
                                                                </div>
                                                                <div class="job-empty-state-content">
                                                                    <h3 class="title h2-size job-empty-state">No Resume
                                                                        available</h3>
                                                                    <p class="paragraph job-empty-state">Create a new
                                                                        Resume now to apply for jobs and showcase your
                                                                        skills and
                                                                        experiences to potential employers. A
                                                                        well-crafted resume can significantly increase
                                                                        your chances of
                                                                        landing your dream job. Don't wait, start
                                                                        building your professional resume today!</p>
                                                                    <div class="job-empty-state-form-block w-form">
                                                                        <button
                                                                            class="button-primary small w-button button-small"
                                                                            onclick="openAddResumeModal()">
                                                                            <i class="fas fa-upload"></i> Upload CV
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
                <div id="addResumeModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeEditResumeModal()">&times;</span>
                        <p>Resume Information</p>
                        <form:form id="editResumeForm" method="post" modelAttribute="newInfoResume"
                            enctype="multipart/form-data" action="/profile/resume/addresume">
                            <div class="w-layout-grid card-post-job-form-grid">

                                <div class="input-wrapper">
                                    <label for="title">Desired Position<span class="accent-secondary-5">*</span></label>
                                    <form:input path="title" id="title" cssClass="input w-input"
                                        placeholder="Enter desired position" required="true" />
                                </div>

                                <div class="input-wrapper">
                                    <label for="position">Desired Level<span class="accent-secondary-5">*</span></label>
                                    <form:select path="position" id="position" cssClass="input w-input" required="true">
                                        <option value="" disabled selected>Select desired level</option>
                                        <form:options items="${positions}" itemValue="name" itemLabel="displayName" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper">
                                    <label for="academicLevel">Academic Level<span
                                            class="accent-secondary-5">*</span></label>
                                    <form:select path="academicLevel" id="academicLevel" cssClass="input w-input"
                                        required="true">
                                        <option value="" disabled selected>Select academic level</option>
                                        <form:options items="${academicLevels}" itemValue="name"
                                            itemLabel="displayName" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper">
                                    <label for="experience">Experience<span class="accent-secondary-5">*</span></label>
                                    <form:select path="experience" id="experience" cssClass="input w-input"
                                        required="true">
                                        <option value="" disabled selected>Select experience</option>
                                        <form:options items="${experiences}" itemValue="name" itemLabel="displayName" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper">
                                    <label for="careerId">Occupation<span class="accent-secondary-5">*</span></label>
                                    <form:select path="career.id" id="careerId" cssClass="input w-input"
                                        required="true">
                                        <option value="" disabled selected>Select occupation</option>
                                        <form:options items="${careers}" itemValue="id" itemLabel="name" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper">
                                    <label for="cityId">City<span class="accent-secondary-5">*</span></label>
                                    <form:select path="city.id" id="cityId" cssClass="input w-input" required="true">
                                        <option value="" disabled selected>Select city</option>
                                        <form:options items="${cities}" itemValue="id" itemLabel="name" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper">
                                    <label for="salaryMin">Minimum Desired Salary<span
                                            class="accent-secondary-5">*</span></label>
                                    <form:input path="salaryMin" id="salaryMin" cssClass="input w-input"
                                        placeholder="Enter minimum desired salary (VND)" required="true" />
                                </div>

                                <div class="input-wrapper">
                                    <label for="salaryMax">Maximum Desired Salary<span
                                            class="accent-secondary-5">*</span></label>
                                    <form:input path="salaryMax" id="salaryMax" cssClass="input w-input"
                                        placeholder="Enter maximum desired salary (VND)" required="true" />
                                </div>

                                <div class="input-wrapper">
                                    <label for="typeOfWorkplace">Type of Workplace<span
                                            class="accent-secondary-5">*</span></label>
                                    <form:select path="typeOfWorkplace" id="typeOfWorkplace" cssClass="input w-input"
                                        required="true">
                                        <option value="" disabled selected>Select type of workplace</option>
                                        <form:options items="${typeOfWorkplaces}" itemValue="name"
                                            itemLabel="displayName" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper">
                                    <label for="jobType">Job Type<span class="accent-secondary-5">*</span></label>
                                    <form:select path="jobType" id="jobType" cssClass="input w-input" required="true">
                                        <option value="" disabled selected>Select job type</option>
                                        <form:options items="${jobTypes}" itemValue="name" itemLabel="displayName" />
                                    </form:select>
                                </div>

                                <div class="input-wrapper" id="w-node-_096a541a-c36e-3a9e-342d-289c676859f8-2c03c510">
                                    <label for="description">Career Objective<span
                                            class="accent-secondary-5">*</span></label>
                                    <form:textarea path="description" id="description" cssClass="input w-input"
                                        placeholder="Enter Your Career Objective" required="true" />
                                </div>

                                <div class="input-wrapper">
                                    <label for="resumeFile">Upload Resume (PDF)<span
                                            class="accent-secondary-5">*</span></label>
                                    <input type="file" id="resumeFile" name="resumeFile" accept="application/pdf"
                                        required="true" />
                                </div>

                            </div>
                            <button type="submit" class="button-primary small w-button">Save</button>
                        </form:form>
                    </div>
                </div>
                <!-- Modal -->





                <jsp:include page="../layout/footer.jsp" />

                <script>
                    function openPdf(fileUrl) {
                        const url = `/images/resume/\${fileUrl}`; // Đường dẫn tới file PDF
                        window.open(url, '_blank'); // Mở file PDF trong tab mới
                    }
                </script>
                <script
                    src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                    type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                    crossorigin="anonymous"></script>
                <script>
                    function openAddResumeModal() {
                        document.getElementById('addResumeModal').style.display = 'block';
                    }

                    function closeAddResumeModal() {
                        document.getElementById('addResumeModal').style.display = 'none';
                    }

                    // Đóng modal khi bấm ra ngoài nội dung modal
                    window.onclick = function (event) {
                        const modal = document.getElementById('addResumeModal');
                        if (event.target == modal) {
                            modal.style.display = 'none';
                        }
                    }
                </script>



            </body>

            </html>