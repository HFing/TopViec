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

                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60ca2461a2ab22bb749f85e2_icon-1-post-job-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
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
                                                            ${careerObjective
                                                            != null ? careerObjective : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="desired-position">Desired Position</label>
                                                        <div class="display-value" id="desired-position">
                                                            ${desiredPosition
                                                            != null ? desiredPosition : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="desired-level">Desired Level</label>
                                                        <div class="display-value" id="desired-level">${desiredLevel !=
                                                            null
                                                            ? desiredLevel : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="educational-background">Educational
                                                            Background</label>
                                                        <div class="display-value" id="educational-background">
                                                            ${educationalBackground != null ? educationalBackground :
                                                            'Not
                                                            updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="experience">Experience</label>
                                                        <div class="display-value" id="experience">${experience != null
                                                            ?
                                                            experience : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="occupation">Occupation</label>
                                                        <div class="display-value" id="occupation">${occupation != null
                                                            ?
                                                            occupation : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="work-location">Work Location</label>
                                                        <div class="display-value" id="work-location">${workLocation !=
                                                            null
                                                            ? workLocation : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="desired-salary">Desired Salary</label>
                                                        <div class="display-value" id="desired-salary">${desiredSalary
                                                            !=
                                                            null ? desiredSalary : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="workplace">Workplace</label>
                                                        <div class="display-value" id="workplace">${workplace != null ?
                                                            workplace : 'Not updated'}</div>
                                                    </div>
                                                    <div class="input-wrapper">
                                                        <label for="employment-type">Employment Type</label>
                                                        <div class="display-value" id="employment-type">${employmentType
                                                            !=
                                                            null ? employmentType : 'Not updated'}</div>
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


                <jsp:include page="../layout/footer.jsp" />
                <script
                    src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                    type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                    crossorigin="anonymous"></script>



            </body>

            </html>