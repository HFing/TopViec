<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Resume</title>
                <link rel="stylesheet" href="/client/css/style.css">
                <style>
                    .card.post-job-form-card {
                        margin-bottom: 30px;
                        padding: 15px 35px 30px;
                    }

                    #experience-details .card.post-job-form-card {
                        margin-bottom: 10px !important;
                        padding: 10px 21px 10px !important;
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



                    .split-content.post-job-sidebar {
                        max-width: 120px !important;
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

                    .divider.card-post-job-form {
                        margin-top: -18px !important;
                        margin-bottom: 30px;
                    }


                    .card-post-job-form-grid {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 10px;
                    }

                    .input-wrapper.full-width {
                        grid-column: span 2;
                    }

                    .input-wrapper {
                        margin-bottom: 10px;
                    }

                    .display-value {
                        padding: 5px;
                        background-color: #f9f9f9;
                        border: 1px solid #ddd;
                        border-radius: 4px;
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

                                    <!-- Personal Information -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ca2461a2ab22bb749f85e2_icon-1-post-job-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Personal
                                                            Information</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div class="w-layout-grid card-post-job-form-grid">

                                                    <div class="input-wrapper">
                                                        <label for="name">Full name</label>
                                                        <div class="display-value" id="name">${user.fullName}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="email">Email Address</label>
                                                        <div class="display-value" id="email">${user.email}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="phone">Phone</label>
                                                        <div class="display-value" id="phone">${user.phone}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="birthday">Birthday</label>
                                                        <div class="display-value" id="birthday">${birthday != null ?
                                                            birthday : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="gender">Gender</label>
                                                        <div class="display-value" id="gender">${gender != null ?
                                                            (gender == 1 ? 'Nam' : (gender == 0 ? 'Nữ' : 'Not updated'))
                                                            : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="city">Province/City</label>
                                                        <div class="display-value" id="city">${cityName}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="district">District</label>
                                                        <div class="display-value" id="district">${districtName}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="address">Address</label>
                                                        <div class="display-value" id="address">${address != null ?
                                                            address : 'Not updated'}</div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divider card-post-job-form"></div>
                                    <!-- General Information -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ca2461a2ab22bb749f85e2_icon-1-post-job-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content" id="general-information">
                                                        <h2 class="title h3-size post-job-step">General Information</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div class="w-layout-grid card-post-job-form-grid">
                                                    <div class="input-wrapper"
                                                        id="w-node-_096a541a-c36e-3a9e-342d-289c676859f8-2c03c510">
                                                        <label for="career-objective">Career Objective</label>
                                                        <div class="display-value" id="career-objective">
                                                            ${infoResumeShow.description != null ?
                                                            infoResumeShow.description :
                                                            'Not updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="desired-position">Desired Position</label>
                                                        <div class="display-value" id="desired-position">
                                                            ${infoResumeShow.title != null ? infoResumeShow.title : 'Not
                                                            updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="desired-level">Desired Level</label>
                                                        <div class="display-value" id="desired-level">
                                                            ${infoResumeShow.position != null ? infoResumeShow.position
                                                            :
                                                            'Not
                                                            updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="educational-background">Educational
                                                            Background</label>
                                                        <div class="display-value" id="educational-background">
                                                            ${infoResumeShow.academicLevel != null ?
                                                            infoResumeShow.academicLevel : 'Not updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="experience">Experience</label>
                                                        <div class="display-value" id="experience">
                                                            ${infoResumeShow.experience != null ?
                                                            infoResumeShow.experience
                                                            :
                                                            'Not updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="occupation">Occupation</label>
                                                        <div class="display-value" id="occupation">
                                                            ${infoResumeShow.career != null ? infoResumeShow.career.name
                                                            :
                                                            'Not
                                                            updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="work-location">Work Location</label>
                                                        <div class="display-value" id="work-location">
                                                            ${infoResumeShow.city != null ? infoResumeShow.city.name :
                                                            'Not
                                                            updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="desired-salary">Desired Salary</label>
                                                        <div class="display-value" id="desired-salary">
                                                            ${infoResumeShow.salaryMin != null ?
                                                            infoResumeShow.salaryMin :
                                                            'Not
                                                            updated'} -
                                                            ${infoResumeShow.salaryMax != null ?
                                                            infoResumeShow.salaryMax :
                                                            'Not
                                                            updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="workplace">Workplace</label>
                                                        <div class="display-value" id="workplace">
                                                            ${infoResumeShow.typeOfWorkplace != null ?
                                                            infoResumeShow.typeOfWorkplace : 'Not updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="employment-type">Employment Type</label>
                                                        <div class="display-value" id="employment-type">
                                                            ${infoResumeShow.jobType != null ? infoResumeShow.jobType :
                                                            'Not
                                                            updated'}
                                                        </div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        </br>
                                                        <button class="button-primary small w-button button-small"
                                                            onclick="openModal();">Edit</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    </br>
                                    <div class="divider card-post-job-form"></div>
                                    <!-- Word experience -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60c7ce2fc1dfba6b0c653e97_icon-job-post-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Work Experience</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div id="experience-details">
                                                    <c:forEach var="detail" items="${experienceDetails}">
                                                        <div class="card post-job-form-card">
                                                            <div class="input-wrapper">
                                                                <div class="experience-detail" data-id="${detail.id}">
                                                                    <p>Job Name: ${detail.jobName}</p>
                                                                    <p>Company Name: ${detail.companyName}</p>
                                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                                        <p>Start Date: ${detail.startDate}</p>
                                                                        <p>End Date: ${detail.endDate}</p>
                                                                    </div>

                                                                    <p>Description: ${detail.description}</p>
                                                                    <button
                                                                        class="button-secondary small w-button">Edit</button>
                                                                    <button type="button"
                                                                        class="button-secondary small w-button">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>


                                                <button class="button-primary small w-button button-small"
                                                    onclick="openExperienceModal();">Add Experience</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divider card-post-job-form"></div>

                                    <!-- Educational Information -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ccaf9874b970382dd393af_icon-department-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Educational Information
                                                        </h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div id="education-details">
                                                    <c:forEach var="detail" items="${educationDetails}">
                                                        <div class="card post-job-form-card">
                                                            <div class="input-wrapper">
                                                                <div class="education-detail" data-id="${detail.id}">
                                                                    <p>Degree Name: ${detail.degreeName}</p>
                                                                    <p>Major: ${detail.major}</p>
                                                                    <p>Training Place: ${detail.trainingPlaceName}</p>
                                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                                        <p>Start Date: ${detail.startDate}</p>
                                                                        <p>Completed Date: ${detail.completedDate}</p>
                                                                    </div>
                                                                    <p>Description: ${detail.description}</p>
                                                                    <button
                                                                        class="button-secondary small w-button">Edit</button>
                                                                    <button type="button"
                                                                        class="button-secondary small w-button">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button class="button-primary small w-button button-small"
                                                    onclick="openEducationModal();">Add Education</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divider card-post-job-form"></div>

                                    <!-- Info Certificate -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step">
                                                        <img src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ccaf9874b970382dd393af_icon-department-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step">
                                                    </div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Certificate Information
                                                        </h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div id="certificate-details">
                                                    <c:forEach var="detail" items="${certificates}">
                                                        <div class="card post-job-form-card">
                                                            <div class="input-wrapper">
                                                                <div class="certificate-detail" data-id="${detail.id}">
                                                                    <p>Certificate Name: ${detail.name}</p>
                                                                    <p>Training Place: ${detail.trainingPlaceName}</p>
                                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                                        <p>Start Date: ${detail.startDate}</p>
                                                                        <p>Expiration Date: ${detail.expirationDate}</p>
                                                                    </div>
                                                                    <button
                                                                        class="button-secondary small w-button">Edit</button>
                                                                    <button type="button"
                                                                        class="button-secondary small w-button">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button class="button-primary small w-button button-small"
                                                    onclick="openCertificateModal();">Add Certificate</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divider card-post-job-form"></div>

                                    <!-- Language Information -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step">
                                                        <img src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ccaf9874b970382dd393af_icon-department-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step">
                                                    </div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Language Skills
                                                            Information</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div id="language-skill-details">
                                                    <c:forEach var="detail" items="${languageSkills}">
                                                        <div class="card post-job-form-card">
                                                            <div class="input-wrapper">
                                                                <div class="language-skill-detail"
                                                                    data-id="${detail.id}">
                                                                    <p>Language: ${detail.language.displayName}</p>
                                                                    <p>Level:
                                                                        <c:choose>
                                                                            <c:when test="${detail.level == 1}">Bad
                                                                            </c:when>
                                                                            <c:when test="${detail.level == 2}">Below
                                                                                Average</c:when>
                                                                            <c:when test="${detail.level == 3}">Average
                                                                            </c:when>
                                                                            <c:when test="${detail.level == 4}">Good
                                                                            </c:when>
                                                                            <c:when test="${detail.level == 5}">
                                                                                Excellent</c:when>
                                                                            <c:otherwise>Unknown</c:otherwise>
                                                                        </c:choose>
                                                                    </p>
                                                                    <button
                                                                        class="button-secondary small w-button">Edit</button>
                                                                    <button type="button"
                                                                        class="button-secondary small w-button">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button class="button-primary small w-button button-small"
                                                    onclick="openLanguageSkillModal();">Add Language Skill</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divider card-post-job-form"></div>

                                    <!-- Advanced Skill -->
                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step">
                                                        <img src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ccaf9874b970382dd393af_icon-department-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step">
                                                    </div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Advanced Skills
                                                            Information</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <div class="card post-job-form-card">
                                                <div id="advanced-skill-details">
                                                    <c:forEach var="detail" items="${advancedSkills}">
                                                        <div data-delete="${detail.id}" class="card post-job-form-card">
                                                            <div class="input-wrapper">
                                                                <div id="dataReload" class="advanced-skill-detail"
                                                                    data-skill-advanced-id="${detail.id}">
                                                                    <p data-name-id="${detail.id}">Skill Name:
                                                                        ${detail.name}</p>
                                                                    <p data-level-id="${detail.id}">Level:
                                                                        <c:choose>
                                                                            <c:when test="${detail.level == 1}">Bad
                                                                            </c:when>
                                                                            <c:when test="${detail.level == 2}">Below
                                                                                Average</c:when>
                                                                            <c:when test="${detail.level == 3}">Average
                                                                            </c:when>
                                                                            <c:when test="${detail.level == 4}">Good
                                                                            </c:when>
                                                                            <c:when test="${detail.level == 5}">
                                                                                Excellent</c:when>
                                                                            <c:otherwise>Unknown</c:otherwise>
                                                                        </c:choose>
                                                                    </p>
                                                                    <button
                                                                        onclick="openAdvancedSkillModalEdit(`${detail.id}`, `${detail.name}`, `${detail.level}`);"
                                                                        class="button-secondary small w-button">Edit</button>
                                                                    <button type="button"
                                                                        onclick="deleteAdvancedSkill(`${detail.id}`)"
                                                                        class="button-secondary small w-button">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button class="button-primary small w-button button-small"
                                                    onclick="openAdvancedSkillModal();">Add Advanced Skill</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>



                            </div>





                        </div>
                    </div>
                </div>
                </div>
                </div>
                </div>

                <!-- Model for Edit Resume -->
                <div id="editResumeModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <p>Edit Resume</p>
                        <form:form id="editResumeForm" action="/updateResume" method="post" modelAttribute="infoResume">
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

                            </div>
                            <button type="submit" class="button-primary small w-button">Save</button>
                        </form:form>
                    </div>
                </div>

                <!-- Model for Experience Detail -->
                <div id="experienceModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeExperienceModal()">&times;</span>
                        <p>Add Experience Detail</p>
                        <form:form id="experienceForm" modelAttribute="infoExperienceDetail">
                            <div class="input-wrapper">
                                <label for="jobName">Job Name</label>
                                <form:input path="jobName" id="jobName" cssClass="input w-input" required="true" />
                            </div>
                            <div class="input-wrapper">
                                <label for="companyName">Company Name</label>
                                <form:input path="companyName" id="companyName" cssClass="input w-input"
                                    required="true" />
                            </div>
                            <div class="w-layout-grid card-post-job-form-grid">
                                <div class="input-wrapper">
                                    <label for="startDate">Start Date</label>
                                    <form:input path="startDate" id="startDate" type="date" cssClass="input w-input"
                                        required="true" />
                                </div>
                                <div class="input-wrapper">
                                    <label for="endDate">End Date</label>
                                    <form:input path="endDate" id="endDate" type="date" cssClass="input w-input"
                                        required="true" />
                                </div>
                            </div>
                            <div class="input-wrapper">
                                <label for="description">Description</label>
                                <form:textarea path="description" id="description" cssClass="input w-input"
                                    required="true" />
                            </div>
                            <button type="button" class="button-primary small w-button"
                                onclick="saveExperienceDetail()">Save</button>
                        </form:form>
                    </div>
                </div>

                <!-- Model for Education Detail -->
                <div id="educationModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeEducationModal()">&times;</span>
                        <p>Add Education Detail</p>
                        <form:form id="educationForm" modelAttribute="infoEducationDetails">
                            <div class="input-wrapper">
                                <label for="degreeName">Degree/Certificate Name</label>
                                <form:input path="degreeName" id="degreeName" cssClass="input w-input"
                                    required="true" />
                            </div>
                            <div class="input-wrapper">
                                <label for="major">Major</label>
                                <form:input path="major" id="major" cssClass="input w-input" required="true" />
                            </div>
                            <div class="input-wrapper">
                                <label for="trainingPlaceName">School/Training Place</label>
                                <form:input path="trainingPlaceName" id="trainingPlaceName" cssClass="input w-input"
                                    required="true" />
                            </div>
                            <div class="w-layout-grid card-post-job-form-grid">
                                <div class="input-wrapper">
                                    <label for="startDate">Start Date</label>
                                    <form:input path="startDate" id="startDate" type="date" cssClass="input w-input"
                                        required="true" />
                                </div>
                                <div class="input-wrapper">
                                    <label for="completedDate">Completed Date</label>
                                    <form:input path="completedDate" id="completedDate" type="date"
                                        cssClass="input w-input" required="true" />
                                </div>
                            </div>
                            <div class="input-wrapper">
                                <label for="description">Description</label>
                                <form:textarea path="description" id="description" cssClass="input w-input"
                                    required="true" />
                            </div>
                            <button type="button" class="button-primary small w-button"
                                onclick="saveEducationDetail()">Save</button>
                        </form:form>
                    </div>
                </div>

                <!-- Model for Certificate Detail -->
                <div id="certificateModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeCertificateModal()">&times;</span>
                        <p>Add Certificate Detail</p>
                        <form:form id="certificateForm" modelAttribute="infoCertificate">
                            <div class="input-wrapper">
                                <label for="name">Certificate Name</label>
                                <form:input path="name" id="name" cssClass="input w-input" required="true" />
                            </div>
                            <div class="input-wrapper">
                                <label for="trainingPlaceName">Training Place</label>
                                <form:input path="trainingPlaceName" id="trainingPlaceName" cssClass="input w-input"
                                    required="true" />
                            </div>
                            <div class="input-wrapper-container">
                                <div class="input-wrapper">
                                    <label for="startDate">Start Date</label>
                                    <form:input path="startDate" id="startDate" type="date" cssClass="input w-input"
                                        required="true" />
                                </div>
                                <div class="input-wrapper">
                                    <label for="expirationDate">Expiration Date</label>
                                    <form:input path="expirationDate" id="expirationDate" type="date"
                                        cssClass="input w-input" required="true" />
                                </div>
                            </div>
                            <button type="button" class="button-primary small w-button"
                                onclick="saveCertificateDetail()">Save</button>
                        </form:form>
                    </div>
                </div>


                <!-- Model for Language Skill Detail -->
                <div id="languageSkillModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeLanguageSkillModal()">&times;</span>
                        <p>Add Language Skill Detail</p>
                        <form:form id="languageSkillForm" modelAttribute="infoLanguageSkill">
                            <div class="input-wrapper">
                                <label for="language">Language</label>
                                <form:select path="language" id="language" cssClass="input w-input" required="true">
                                    <form:options items="${languages}" itemValue="name" itemLabel="displayName" />
                                </form:select>
                            </div>
                            <div class="input-wrapper">
                                <label for="level">Level</label>
                                <form:select path="level" id="level" cssClass="input w-input" required="true">
                                    <form:options items="${levels}" />
                                </form:select>
                            </div>
                            <button type="button" class="button-primary small w-button"
                                onclick="saveLanguageSkillDetail()">Save</button>
                        </form:form>
                    </div>
                </div>


                <!-- Model for Advanced Skill Detail -->

                <div id="advancedSkillModal" class="modal">
                    <div class="modal-content card post-job-form-card">
                        <span class="close" onclick="closeAdvancedSkillModal()">&times;</span>
                        <p>Add Advanced Skill Detail</p>
                        <form:form id="advancedSkillForm" modelAttribute="infoAdvancedSkill">
                            <div class="input-wrapper">
                                <label for="name">Skill Name</label>
                                <form:input path="name" id="name" cssClass="input w-input" required="true" />
                            </div>
                            <div class="input-wrapper">
                                <label for="level">Level</label>
                                <form:select path="level" id="level" cssClass="input w-input" required="true">
                                    <form:options items="${levels}" />
                                </form:select>
                            </div>
                            <button type="button" class="button-primary small w-button"
                                onclick="saveAdvancedSkillDetail()">Save</button>
                        </form:form>
                    </div>
                </div>

                <%-- edit--%>
                    <div id="advancedSkillModalEdit" class="modal">
                        <div class="modal-content card post-job-form-card">
                            <span class="close" onclick="closeAdvancedSkillModalEdit()">&times;</span>
                            <p>Edit Advanced Skill Detail</p>
                            <form:form id="advancedSkillFormEdit" modelAttribute="infoAdvancedSkill">
                                <input type="hidden" id="idSkillAdvanced">
                                <div class="input-wrapper">
                                    <label for="name">Skill Name</label>
                                    <form:input path="name" id="nameSkillEdit" cssClass="input w-input"
                                        required="true" />
                                </div>
                                <div class="input-wrapper">
                                    <label for="level">Level</label>
                                    <form:select path="level" id="levelSkillEdit" cssClass="input w-input"
                                        required="true">
                                        <form:options items="${levels}" />
                                    </form:select>
                                </div>
                                <button type="button" class="button-primary small w-button"
                                    onclick="editAdvancedSkillDetail()">Save</button>
                            </form:form>
                        </div>
                    </div>



                    <jsp:include page="../layout/footer.jsp" />
                    <script
                        src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                        crossorigin="anonymous"></script>


                    <!-- Script for Edit Resume -->
                    <script>
                        function saveResume(event) {
                            event.preventDefault(); // Ngăn chặn việc gửi form mặc định

                            const form = document.getElementById('editResumeForm');
                            const formData = new FormData(form);

                            fetch('/updateResume', {
                                method: 'POST',
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    // Cập nhật giá trị trên trang mà không cần tải lại
                                    document.getElementById('desired-position').innerText = data.title;
                                    document.getElementById('desired-level').innerText = data.position;
                                    document.getElementById('academic-level').innerText = data.academicLevel;
                                    document.getElementById('experience').innerText = data.experience;
                                    document.getElementById('occupation').innerText = data.career.name;
                                    document.getElementById('city').innerText = data.city.name;
                                    document.getElementById('type-of-workplace').innerText = data.typeOfWorkplace;
                                    document.getElementById('job-type').innerText = data.jobType;
                                    document.getElementById('career-objective').innerText = data.description;
                                    closeModal();
                                })
                                .catch(error => console.error('Error:', error));
                        }

                        document.getElementById('editResumeForm').addEventListener('submit', saveResume);

                        function closeModal() {
                            document.getElementById('editResumeModal').style.display = 'none';
                        }

                        function openModal() {
                            document.getElementById('editResumeModal').style.display = 'block';
                        }

                        window.onclick = function (event) {
                            const modal = document.getElementById('editResumeModal');
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>

                    <!-- Script for Experience Detail -->
                    <script>
                        function saveExperienceDetail() {
                            const form = document.getElementById('experienceForm');
                            const formData = new FormData(form);

                            fetch('/addExperienceDetail', {
                                method: 'POST',
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    console.log('Response data:', data); // Kiểm tra dữ liệu phản hồi
                                    if (data) {
                                        console.log('Job Name:', data.jobName, 'Type:', typeof data.jobName);
                                        console.log('Company Name:', data.companyName, 'Type:', typeof data.companyName);
                                        console.log('Start Date:', data.startDate, 'Type:', typeof data.startDate);
                                        console.log('End Date:', data.endDate, 'Type:', typeof data.endDate);
                                        console.log('Description:', data.description, 'Type:', typeof data.description);

                                        // Chuyển đổi các giá trị ngày tháng thành chuỗi
                                        const startDate = new Date(data.startDate[0], data.startDate[1] - 1, data.startDate[2]).toLocaleDateString();
                                        const endDate = new Date(data.endDate[0], data.endDate[1] - 1, data.endDate[2]).toLocaleDateString();

                                        // Lưu các giá trị vào biến
                                        const jobName = data.jobName;
                                        const companyName = data.companyName;
                                        const description = data.description;

                                        // Tạo phần tử mới để hiển thị chi tiết kinh nghiệm
                                        const experienceDetails = document.getElementById('experience-details');
                                        const newDetail = document.createElement('div');
                                        newDetail.classList.add('card', 'post-job-form-card');
                                        newDetail.setAttribute('data-id', data.id);
                                        newDetail.innerHTML = `
    <div class="card post-job-form-card">
        <div class="input-wrapper">
            <div class="experience-detail" data-id="\${data.id}">
                <p>Job Name: \${jobName}</p>
                <p>Company Name: \${companyName}</p>
                <div class="w-layout-grid card-post-job-form-grid">
                    <p>Start Date: \${startDate}</p>
                    <p>End Date: \${endDate}</p>
                </div>
                <p>Description: \${description}</p>
                <button class="button-secondary small w-button" onclick="editExperience(\${data.id});">Edit</button>
                <button class="button-secondary small w-button" onclick="deleteExperience(\${data.id});">Delete</button>
            </div>
        </div>
    </div>
`;
                                        experienceDetails.appendChild(newDetail);

                                        // Đóng modal và reset form
                                        closeExperienceModal();
                                        form.reset();
                                    } else {
                                        console.error('Failed to save experience detail.');
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                        }

                        function editExperience(id) {
                            // Lấy chi tiết kinh nghiệm từ DOM hoặc từ server và điền vào form để chỉnh sửa
                            // Sau đó mở modal để chỉnh sửa
                            console.log('Edit experience with id:', id);
                            // Implement the logic to edit the experience detail
                        }



                        function closeExperienceModal() {
                            document.getElementById('experienceModal').style.display = 'none';
                        }

                        function openExperienceModal() {
                            document.getElementById('experienceModal').style.display = 'block';
                        }

                        // Đóng modal khi bấm ra ngoài nội dung modal
                        window.onclick = function (event) {
                            const modal = document.getElementById('experienceModal');
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>

                    <!-- Script for Education Detail -->
                    <script>
                        function saveEducationDetail() {
                            const form = document.getElementById('educationForm');
                            const formData = new FormData(form);

                            fetch('/addEducationDetail', {
                                method: 'POST',
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    console.log('Response data:', data); // Kiểm tra dữ liệu phản hồi
                                    if (data) {
                                        console.log('Degree Name:', data.degreeName, 'Type:', typeof data.degreeName);
                                        console.log('Major:', data.major, 'Type:', typeof data.major);
                                        console.log('Training Place:', data.trainingPlaceName, 'Type:', typeof data.trainingPlaceName);
                                        console.log('Start Date:', data.startDate, 'Type:', typeof data.startDate);
                                        console.log('Completed Date:', data.completedDate, 'Type:', typeof data.completedDate);
                                        console.log('Description:', data.description, 'Type:', typeof data.description);

                                        // Chuyển đổi các giá trị ngày tháng thành chuỗi
                                        const startDate = new Date(data.startDate[0], data.startDate[1] - 1, data.startDate[2]).toLocaleDateString();
                                        const completedDate = new Date(data.completedDate[0], data.completedDate[1] - 1, data.completedDate[2]).toLocaleDateString();

                                        // Lưu các giá trị vào biến
                                        const degreeName = data.degreeName;
                                        const major = data.major;
                                        const trainingPlaceName = data.trainingPlaceName;
                                        const description = data.description;

                                        // Tạo phần tử mới để hiển thị chi tiết giáo dục
                                        const educationDetails = document.getElementById('education-details');
                                        const newDetail = document.createElement('div');
                                        newDetail.classList.add('card', 'post-job-form-card');
                                        newDetail.setAttribute('data-id', data.id);
                                        newDetail.innerHTML = `
                        <div class="input-wrapper">
                            <div class="education-detail" data-id="\${data.id}">
                                <p>Degree Name: \${degreeName}</p>
                                <p>Major: \${major}</p>
                                <p>Training Place: \${trainingPlaceName}</p>
                                <div class="w-layout-grid card-post-job-form-grid">
                                    <p>Start Date: \${startDate}</p>
                                    <p>Completed Date: \${completedDate}</p>
                                </div>
                                <p>Description: \${description}</p>
                                <button class="button-secondary small w-button" onclick="editEducation(\${data.id});">Edit</button>
                                <button class="button-secondary small w-button" onclick="deleteEducation(\${data.id});">Delete</button>
                            </div>
                        </div>
                `;
                                        educationDetails.appendChild(newDetail);

                                        // Đóng modal và reset form
                                        closeEducationModal();
                                        form.reset();
                                    } else {
                                        console.error('Failed to save education detail.');
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                        }

                        function editEducation(id) {
                            // Lấy chi tiết giáo dục từ DOM hoặc từ server và điền vào form để chỉnh sửa
                            // Sau đó mở modal để chỉnh sửa
                            console.log('Edit education with id:', id);
                            // Implement the logic to edit the education detail
                        }

                        function closeEducationModal() {
                            document.getElementById('educationModal').style.display = 'none';
                        }

                        function openEducationModal() {
                            document.getElementById('educationModal').style.display = 'block';
                        }

                        // Đóng modal khi bấm ra ngoài nội dung modal
                        window.onclick = function (event) {
                            const modal = document.getElementById('educationModal');
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>

                    <!-- Script for Certificate Detail -->
                    <script>
                        function saveCertificateDetail() {
                            const form = document.getElementById('certificateForm');
                            const formData = new FormData(form);

                            fetch('/addCertificateDetail', {
                                method: 'POST',
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    console.log('Response data:', data); // Kiểm tra dữ liệu phản hồi
                                    if (data) {
                                        console.log('Certificate Name:', data.name, 'Type:', typeof data.name);
                                        console.log('Training Place:', data.trainingPlaceName, 'Type:', typeof data.trainingPlaceName);
                                        console.log('Start Date:', data.startDate, 'Type:', typeof data.startDate);
                                        console.log('Expiration Date:', data.expirationDate, 'Type:', typeof data.expirationDate);

                                        // Chuyển đổi các giá trị ngày tháng thành chuỗi
                                        const startDate = new Date(data.startDate[0], data.startDate[1] - 1, data.startDate[2]).toLocaleDateString();
                                        const expirationDate = new Date(data.expirationDate[0], data.expirationDate[1] - 1, data.expirationDate[2]).toLocaleDateString();

                                        // Lưu các giá trị vào biến
                                        const name = data.name;
                                        const trainingPlaceName = data.trainingPlaceName;

                                        // Tạo phần tử mới để hiển thị chi tiết chứng chỉ
                                        const certificateDetails = document.getElementById('certificate-details');
                                        const newDetail = document.createElement('div');
                                        newDetail.classList.add('card', 'post-job-form-card');
                                        newDetail.setAttribute('data-id', data.id);
                                        newDetail.innerHTML = `
                    <div class="card post-job-form-card">
                        <div class="input-wrapper">
                            <div class="certificate-detail" data-id="\${data.id}">
                                <p>Certificate Name: \${name}</p>
                                <p>Training Place: \${trainingPlaceName}</p>
                                <div class="w-layout-grid card-post-job-form-grid">
                                    <p>Start Date: \${startDate}</p>
                                    <p>Expiration Date: \${expirationDate}</p>
                                </div>
                                <button class="button-secondary small w-button" onclick="editCertificate(\${data.id});">Edit</button>
                                <button class="button-secondary small w-button" onclick="deleteCertificate(\${data.id});">Delete</button>
                            </div>
                        </div>
                    </div>
                `;
                                        certificateDetails.appendChild(newDetail);

                                        // Đóng modal và reset form
                                        closeCertificateModal();
                                        form.reset();
                                    } else {
                                        console.error('Failed to save certificate detail.');
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                        }

                        function editCertificate(id) {
                            // Lấy chi tiết chứng chỉ từ DOM hoặc từ server và điền vào form để chỉnh sửa
                            // Sau đó mở modal để chỉnh sửa
                            console.log('Edit certificate with id:', id);
                            // Implement the logic to edit the certificate detail
                        }

                        function closeCertificateModal() {
                            document.getElementById('certificateModal').style.display = 'none';
                        }

                        function openCertificateModal() {
                            document.getElementById('certificateModal').style.display = 'block';
                        }

                        // Đóng modal khi bấm ra ngoài nội dung modal
                        window.onclick = function (event) {
                            const modal = document.getElementById('certificateModal');
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>

                    <!-- Script for Language Skill Detail -->
                    <script>
                        function saveLanguageSkillDetail() {
                            const form = document.getElementById('languageSkillForm');
                            const formData = new FormData(form);

                            fetch('/addLanguageSkillDetail', {
                                method: 'POST',
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    console.log('Response data:', data); // Kiểm tra dữ liệu phản hồi
                                    if (data) {
                                        console.log('Language:', data.language, 'Type:', typeof data.language);
                                        console.log('Level:', data.level, 'Type:', typeof data.level);

                                        // Lưu các giá trị vào biến
                                        const language = data.language;
                                        const level = data.level;
                                        const levelDescription = getLevelDescription(level);

                                        // Tạo phần tử mới để hiển thị chi tiết kỹ năng ngôn ngữ
                                        const languageSkillDetails = document.getElementById('language-skill-details');
                                        const newDetail = document.createElement('div');
                                        newDetail.classList.add('card', 'post-job-form-card');
                                        newDetail.setAttribute('data-id', data.id);
                                        newDetail.innerHTML = `
                    <div class="input-wrapper">
                        <div class="language-skill-detail" data-id="${data.id}">
                            <p>Language: \${language}</p>
                            <p>Level: \${levelDescription}</p>
                            <button class="button-secondary small w-button" onclick="editLanguageSkill(${data.id});">Edit</button>
                            <button class="button-secondary small w-button" onclick="deleteLanguageSkill(${data.id});">Delete</button>
                        </div>
                    </div>
                `;
                                        languageSkillDetails.appendChild(newDetail);

                                        // Đóng modal và reset form
                                        closeLanguageSkillModal();
                                        form.reset();
                                    } else {
                                        console.error('Failed to save language skill detail.');
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                        }
                        function getLevelDescription(level) {
                            switch (level) {
                                case 1:
                                    return "Bad";
                                case 2:
                                    return "Below Average";
                                case 3:
                                    return "Average";
                                case 4:
                                    return "Good";
                                case 5:
                                    return "Excellent";
                                default:
                                    return "Unknown";
                            }
                        }
                        function getLevelDescriptionByName(level) {
                            switch (level.trim()) {
                                case "Bad":
                                    return 1;
                                case "Below Average":
                                    return 2;
                                case "Average":
                                    return 3;
                                case "Good":
                                    return 4;
                                case "Excellent":
                                    return 5;
                                default:
                                    return "Unknown";
                            }
                        }
                        function editLanguageSkill(id) {
                            // Lấy chi tiết kỹ năng ngôn ngữ từ DOM hoặc từ server và điền vào form để chỉnh sửa
                            // Sau đó mở modal để chỉnh sửa
                            console.log('Edit language skill with id:', id);
                            // Implement the logic to edit the language skill detail
                        }

                        function closeLanguageSkillModal() {
                            document.getElementById('languageSkillModal').style.display = 'none';
                        }

                        function openLanguageSkillModal() {
                            document.getElementById('languageSkillModal').style.display = 'block';
                        }

                        // Đóng modal khi bấm ra ngoài nội dung modal
                        window.onclick = function (event) {
                            const modal = document.getElementById('languageSkillModal');
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>

                    <!-- Script for Advanced Skill Detail -->
                    <script>
                        const advancedSkillDetails = document.getElementById('advanced-skill-details');
                        function saveAdvancedSkillDetail() {
                            const form = document.getElementById('advancedSkillForm');
                            const formData = new FormData(form);

                            fetch('/addAdvancedSkillDetail', {
                                method: 'POST',
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    console.log('Response data:', data); // Kiểm tra dữ liệu phản hồi
                                    if (data) {
                                        console.log('Skill Name:', data.name, 'Type:', typeof data.name);
                                        console.log('Level:', data.level, 'Type:', typeof data.level);

                                        // Lưu các giá trị vào biến
                                        const name = data.name;
                                        const level = data.level;
                                        const levelDescription = getLevelDescription(level);

                                        // Tạo phần tử mới để hiển thị chi tiết kỹ năng nâng cao
                                        const newDetail = document.createElement('div');
                                        newDetail.classList.add('card', 'post-job-form-card');
                                        newDetail.setAttribute('data-skill-advanced-id', data.id);
                                        newDetail.setAttribute('data-delete', data.id);
                                        newDetail.innerHTML = `
                                        <div class="input-wrapper">
                                            <div class="advanced-skill-detail" data-skill-advanced-id="\${data.id}">
                                                <p data-name-id="\${data.id}" >Skill Name: \${name}</p>
                                                <p data-level-id="\${data.id}" >Level: \${levelDescription}</p>
                                                <button class="button-secondary small w-button" onclick="openAdvancedSkillModalEdit(\${data.id}, \${data.name}, \${data.level});">Edit</button>
                                                <button class="button-secondary small w-button" onclick="deleteAdvancedSkill(\${data.id});">Delete</button>
                                            </div>
                                        </div>
                                    `;
                                        advancedSkillDetails.appendChild(newDetail);

                                        // Đóng modal và reset form
                                        closeAdvancedSkillModal();
                                        form.reset();
                                    } else {
                                        console.error('Failed to save advanced skill detail.');
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                        }

                        function getLevelDescription(level) {
                            switch (level) {
                                case 1:
                                    return "Bad";
                                case 2:
                                    return "Below Average";
                                case 3:
                                    return "Average";
                                case 4:
                                    return "Good";
                                case 5:
                                    return "Excellent";
                                default:
                                    return "Unknown";
                            }
                        }

                        function closeAdvancedSkillModal() {
                            document.getElementById('advancedSkillModal').style.display = 'none';
                        }

                        function openAdvancedSkillModal() {
                            document.getElementById('advancedSkillModal').style.display = 'block';
                        }

                        // Đóng modal khi bấm ra ngoài nội dung modal
                        window.onclick = function (event) {
                            const modal = document.getElementById('advancedSkillModal');
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>

                    <script>
                        function openAdvancedSkillModalEdit(id, name, level) {
                            console.log("id open", id)
                            console.log("name open", name)
                            console.log("level open", level)
                            const skillDetail = document.querySelector('[data-skill-advanced-id="' + id + '"]');
                            document.getElementById('idSkillAdvanced').value = id;
                            document.getElementById('nameSkillEdit').value = skillDetail.querySelector('[data-name-id="' + id + '"]').innerHTML.split(": ")[1];
                            var lvId = skillDetail.querySelector('[data-level-id="' + id + '"]').innerHTML.split(": ")[1];
                            if (lvId) {
                                document.getElementById('levelSkillEdit').value = getLevelDescriptionByName(lvId);
                            } else {
                                document.getElementById('levelSkillEdit').value = level;
                            }
                            document.getElementById('advancedSkillModalEdit').style.display = 'block';
                        }

                        function closeAdvancedSkillModalEdit() {
                            document.getElementById('advancedSkillModalEdit').style.display = 'none';
                        }

                        function editAdvancedSkillDetail() {
                            const form = document.getElementById('advancedSkillFormEdit');

                            const idSkillAdvanced = document.getElementById('idSkillAdvanced').value;
                            const nameSkillEdit = document.getElementById('nameSkillEdit').value;
                            const levelSkillEdit = document.getElementById('levelSkillEdit').value;

                            fetch(`/advancedSkillDetail/` + idSkillAdvanced, {
                                method: 'PUT',
                                headers: {
                                    'Content-Type': 'application/json'
                                },
                                body: JSON.stringify({ name: nameSkillEdit, level: levelSkillEdit })
                            })
                                .then(response => {
                                    if (!response.ok) {
                                        if (response.status === 404) {
                                            throw new Error('Kỹ năng không tồn tại.');
                                        } else {
                                            throw new Error('Có lỗi xảy ra.');
                                        }
                                    }
                                    return response.text();
                                })
                                .then(data => {
                                    updateSkillElement(data);
                                    closeAdvancedSkillModalEdit();

                                    form.reset();
                                })
                                .catch(error => {
                                    alert(error.message);
                                });
                        }

                        function deleteAdvancedSkill(id) {
                            console.log("delete id", id)
                            fetch(`/advancedSkillDetail/` + id, {
                                method: 'DELETE',
                                headers: {
                                    'Content-Type': 'application/json'
                                },
                            })
                                .then(response => {
                                    if (!response.ok) {
                                        if (response.status === 404) {
                                            throw new Error('Kỹ năng không tồn tại.');
                                        } else {
                                            throw new Error('Có lỗi xảy ra.');
                                        }
                                    }
                                    return response.text();
                                })
                                .then(data => {
                                    removeSkillElement(id)
                                })
                                .catch(error => {
                                    alert(error.message);
                                });
                        }

                        function updateSkillElement(response) {
                            response = JSON.parse(response)
                            console.log(response)
                            const skillDetail = document.querySelector('[data-skill-advanced-id="' + response.id + '"]');
                            console.log("edit skillDetail", skillDetail)
                            skillDetail.querySelector('[data-name-id="' + response.id + '"]').innerHTML = `Skill Name: ` + response.name;
                            skillDetail.querySelector('[data-level-id="' + response.id + '"]').innerHTML = `Level: ` + getLevelDescription(response.level);
                        }

                        function removeSkillElement(id) {
                            const skillDetail = document.querySelector('[data-delete="' + Number.parseInt(id) + '"]');
                            console.log("remove skillDetail", skillDetail)
                            if (skillDetail) {
                                skillDetail.remove();
                            }
                        }
                    </script>
            </body>

            </html>