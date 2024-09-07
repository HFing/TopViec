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
                <style>
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
                                                    <div class="card-job-post-category-text">Remote</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                            alt="Graph Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Level</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">Senior</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                                            alt="Portfolio Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Department</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">Development</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc517c90080b634e591a_icon-4-job-categories-job-board-x-template.svg"
                                                            alt="Clock Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Type</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">Full - Time</div>
                                                </div>
                                                <div class="card-job-post-category-wrapper">
                                                    <div class="card-job-post-category-title-wrapper"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51d7c3af8320618b87_icon-5-job-categories-job-board-x-template.svg"
                                                            alt="Money Icon - Job Board X Webflow Template"
                                                            class="card-job-post-category-title-icon">
                                                        <div>Salary</div>
                                                    </div>
                                                    <div class="card-job-post-category-text">$100,000 USD</div>
                                                </div>

                                                <a id="editProfileButton" class="button-primary"
                                                    href="/profile/resume/resume-update">Edit Profile</a>
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