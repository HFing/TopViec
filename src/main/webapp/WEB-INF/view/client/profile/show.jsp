<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="/client/css/style.css">
            <style>
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
                            <img src="/images/avatar/default_cover_profile.png" loading="eager" alt="user Cover Image"
                                sizes="(max-width: 767px) 93vw, (max-width: 1439px) 95vw, 984px"
                                class="image company-cover"
                                style="will-change: transform; transform: translate3d(0px, -0.0024px, 0px) scale3d(1.00001, 1.00001, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                        </div>
                        <div class="company-content">
                            <div class="content-top company">
                                <div class="image-wrapper company"><img src="/images/avatar/${avatarUrl}"
                                        alt="${user.fullName}" class="image company">
                                </div>
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
                                    <div class="split-content content-top-company-right">
                                        <c:choose>
                                            <c:when test="${not user.isVerifyEmail}">
                                                <a data-w-id="18e4c4a1-e2a5-df93-57f4-c9a8d529c360"
                                                    href="/profile/sendVerificationEmail" target="_blank"
                                                    class="card-link-wrapper weight-medium w-inline-block">
                                                    <div class="card-link" style="color: rgb(0, 97, 255);">Verify Your
                                                        Account</div>
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
                                            </c:when>
                                            <c:otherwise>
                                                <div class="card-link-wrapper weight-medium w-inline-block">
                                                    <div class="card-link" style="color: rgb(0, 97, 255);">Account
                                                        Verified
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
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>


                            <div data-duration-in="300" data-duration-out="100" data-current="Company Jobs"
                                data-easing="ease" class="company-tabs w-tabs">
                                <div class="company-tabs-menu w-tab-menu" role="tablist"><a data-w-tab="Company Jobs"
                                        class="company-tab-link first w-inline-block w-tab-link w--current"
                                        id="w-tabs-0-data-w-tab-0" href="/profile" role="tab"
                                        aria-controls="w-tabs-0-data-w-pane-0" aria-selected="true">
                                        <div>Company jobs</div>
                                    </a>
                                    <a data-w-tab="About Company" class="company-tab-link w-inline-block w-tab-link"
                                        id="w-tabs-0-data-w-tab-1" href="/profile/resume" aria-selected="false">
                                        <div>Resume</div>
                                    </a>

                                    <a data-w-tab="Company Perks" class="company-tab-link w-inline-block w-tab-link"
                                        tabindex="-1" id="w-tabs-0-data-w-tab-2" href="profile/accountsettings"
                                        role="tab" aria-controls="w-tabs-0-data-w-pane-2" aria-selected="false">
                                        <div>Account &amp; Settings</div>
                                    </a>
                                </div>
                                <!-- <div class="company-tabs-content w-tab-content">
                                    <div data-w-tab="Company Jobs" class="company-tab-pane w-tab-pane w--tab-active"
                                        id="w-tabs-0-data-w-pane-0" role="tabpanel"
                                        aria-labelledby="w-tabs-0-data-w-tab-0">
                                        <h2 class="title h3-size company-job-openings">Webflow job openings</h2>
                                        <div class="w-dyn-list">
                                            <div role="list" class="jobs-grid w-dyn-items">
                                                <div role="listitem" class="job-item w-dyn-item"><a
                                                        href="/job/mobile-product-manager"
                                                        class="card job w-inline-block">
                                                        <div class="split-content card-job-left">
                                                            <div class="image-wrapper card-job"><img
                                                                    alt="Mobile Product Manager"
                                                                    src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c7ea645b46e9836da40c_icon-4-company-job-board-x-template.svg"
                                                                    class="image card-job"
                                                                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                            </div>
                                                            <div class="card-job-title-wrapper">
                                                                <h3 class="title h6-size card-job"
                                                                    style="color: rgb(23, 23, 40);">Mobile Product
                                                                    Manager</h3>
                                                                <div class="card-link-wrapper">
                                                                    <div class="card-link">Google</div>
                                                                    <div class="card-link-arrow"
                                                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                                        <div class="card-link-arrow-1"></div>
                                                                        <div class="card-link-arrow-2"></div>
                                                                        <div class="card-link-arrow-3"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="split-content card-job-right">
                                                            <div class="card-job-category-wrapper">
                                                                <div class="card-job-category-title-wrapper"><img
                                                                        alt="Location Icon - Job Board X Webflow Template"
                                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                                                        class="card-job-category-title-icon">
                                                                    <div>Location</div>
                                                                </div>
                                                                <div class="card-job-category-text">New York, NY</div>
                                                            </div>
                                                            <div class="card-job-category-wrapper">
                                                                <div class="card-job-category-title-wrapper"><img
                                                                        alt="Graph Icon - Job Board X Webflow Template"
                                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                                        class="card-job-category-title-icon">
                                                                    <div>Level</div>
                                                                </div>
                                                                <div class="card-job-category-text">Senior</div>
                                                            </div>
                                                            <div class="card-job-category-wrapper">
                                                                <div class="card-job-category-title-wrapper"><img
                                                                        alt="Portfolio Icon - Job Board X Webflow Template"
                                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                                                        class="card-job-category-title-icon">
                                                                    <div>Department</div>
                                                                </div>
                                                                <div class="card-job-category-text">Design</div>
                                                            </div>
                                                        </div>
                                                    </a></div>
                                                <div role="listitem" class="job-item w-dyn-item"><a
                                                        href="/job/jr-frontend-engineer"
                                                        class="card job w-inline-block">
                                                        <div class="split-content card-job-left">
                                                            <div class="image-wrapper card-job"><img
                                                                    alt="Jr Frontend Engineer"
                                                                    src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c7ea645b46e9836da40c_icon-4-company-job-board-x-template.svg"
                                                                    class="image card-job"
                                                                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                            </div>
                                                            <div class="card-job-title-wrapper">
                                                                <h3 class="title h6-size card-job"
                                                                    style="color: rgb(23, 23, 40);">Jr Frontend Engineer
                                                                </h3>
                                                                <div class="card-link-wrapper">
                                                                    <div class="card-link">Google</div>
                                                                    <div class="card-link-arrow"
                                                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                                        <div class="card-link-arrow-1"></div>
                                                                        <div class="card-link-arrow-2"></div>
                                                                        <div class="card-link-arrow-3"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="split-content card-job-right">
                                                            <div class="card-job-category-wrapper">
                                                                <div class="card-job-category-title-wrapper"><img
                                                                        alt="Location Icon - Job Board X Webflow Template"
                                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                                                        class="card-job-category-title-icon">
                                                                    <div>Location</div>
                                                                </div>
                                                                <div class="card-job-category-text">Austin, TX</div>
                                                            </div>
                                                            <div class="card-job-category-wrapper">
                                                                <div class="card-job-category-title-wrapper"><img
                                                                        alt="Graph Icon - Job Board X Webflow Template"
                                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                                        class="card-job-category-title-icon">
                                                                    <div>Level</div>
                                                                </div>
                                                                <div class="card-job-category-text">Junior</div>
                                                            </div>
                                                            <div class="card-job-category-wrapper">
                                                                <div class="card-job-category-title-wrapper"><img
                                                                        alt="Portfolio Icon - Job Board X Webflow Template"
                                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                                                        class="card-job-category-title-icon">
                                                                    <div>Department</div>
                                                                </div>
                                                                <div class="card-job-category-text">Development</div>
                                                            </div>
                                                        </div>
                                                    </a></div>
                                            </div>
                                            <div role="navigation" aria-label="List"
                                                class="w-pagination-wrapper pagination">
                                            </div>
                                        </div>
                                    </div>
                                    <div data-w-tab="About Company" class="company-tab-pane w-tab-pane"
                                        id="w-tabs-0-data-w-pane-1" role="tabpanel"
                                        aria-labelledby="w-tabs-0-data-w-tab-1">
                                        <div class="company-about-wrapper">
                                            <h2 class="title h3-size company-about">About the company</h2>
                                            <div class="rich-text w-richtext">

                                                <p>${company.description}</p>
                                                <figure style="max-width:1306px"
                                                    class="w-richtext-align-fullwidth w-richtext-figure-type-image">
                                                    <div><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c4fc44bc856c896ee119_image-about-company-job-board-x.jpg"
                                                            loading="lazy" alt=""></div>
                                                </figure>
                                            </div>
                                            <div class="company-about-social-media-bottom-wrapper">
                                                <div class="company-about-social-media-text-wrapper">
                                                    <div class="company-about-social-media-text">Follow&nbsp;</div>
                                                    <div class="company-about-social-media-text">Google</div>
                                                </div>
                                                <div class="company-about-social-media-wrapper"><a
                                                        href="https://www.facebook.com/" target="_blank"
                                                        class="image-wrapper social-media-link facebook w-inline-block"></a><a
                                                        href="https://twitter.com/" target="_blank"
                                                        class="image-wrapper social-media-link twitter w-inline-block"></a><a
                                                        href="https://www.instagram.com/" target="_blank"
                                                        class="image-wrapper social-media-link instagram w-inline-block"></a><a
                                                        href="https://www.linkedin.com/" target="_blank"
                                                        class="image-wrapper social-media-link linkedin w-inline-block"></a><a
                                                        href="https://www.youtube.com/" target="_blank"
                                                        class="image-wrapper social-media-link youtube w-inline-block"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div data-w-tab="Company Perks" class="company-tab-pane w-tab-pane"
                                        id="w-tabs-0-data-w-pane-2" role="tabpanel"
                                        aria-labelledby="w-tabs-0-data-w-tab-2">
                                        <h2 class="title h3-size company-perks">Webflow job openings</h2>
                                        <div class="company-perks-columns w-row">
                                            <div class="company-perks-column-1 w-col w-col-6">
                                                <div class="company-perks-rich-text w-richtext">
                                                    <ul role="list">
                                                        <li>Neque sodales ut etiam sit amet nisl purus on</li>
                                                        <li>Duis aute irure dolor in reprehenderit in voluptate</li>
                                                        <li>Neque sodales ut etiam sit amet nisl purus on</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="company-perks-column-2 w-col w-col-6">
                                                <div class="company-perks-rich-text w-richtext">
                                                    <ul role="list">
                                                        <li>Ut enim ad minim veniam, quis nostrud exercitation</li>
                                                        <li>Excepteur sint occaecat cupidatat non proident</li>
                                                        <li>Ut enim ad minim veniam, quis nostrud exercitation</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                                <div class="company-tabs-content w-tab-content">
                                    <div data-w-tab="Company Jobs" class="company-tab-pane w-tab-pane w--tab-active"
                                        id="w-tabs-0-data-w-pane-0" role="tabpanel"
                                        aria-labelledby="w-tabs-0-data-w-tab-0">
                                        <h2 class="title h3-size company-job-openings">Webflow job openings</h2>
                                        <div class="w-dyn-list">
                                            <div class="card job-empty-state w-dyn-empty">
                                                <div class="job-empty-state-wrapper">
                                                    <div class="image-wrapper job-empty-state-icon"><img
                                                            alt="Search Icon - Job Board X Webflow Template"
                                                            src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60c94c777132722f6ab7e8b6_icon-job-empty-job-board-x-template.svg"
                                                            class="image job-empty-state"></div>
                                                    <div class="job-empty-state-content">
                                                        <h3 class="title h2-size job-empty-state">No job openings
                                                            available</h3>
                                                        <p class="paragraph job-empty-state">Want to stay up to date
                                                            of
                                                            all new job openings popin up? Subscribe to our
                                                            newsletter
                                                            to receive great jobs every week.</p>
                                                        <div class="job-empty-state-form-block w-form">
                                                            <form id="wf-form-Job-Empty-State-Form"
                                                                name="wf-form-Job-Empty-State-Form"
                                                                data-name="Job Empty State Form" method="get"
                                                                class="job-empty-state-form"
                                                                data-wf-page-id="60c7a4d437554c8630b53ab2"
                                                                data-wf-element-id="93a9aff5-cc15-0ba3-947d-b091b4bbaf0b"
                                                                aria-label="Job Empty State Form"><input
                                                                    class="input job-empty-state w-input"
                                                                    maxlength="256" name="Email" data-name="Email"
                                                                    placeholder="Subscribe to our newsletter"
                                                                    type="email" id="email" required=""><input
                                                                    type="submit" data-wait="Please wait..."
                                                                    class="button-primary small job-empty-state w-button"
                                                                    value="Subscribe"></form>
                                                            <div class="success-message w-form-done" tabindex="-1"
                                                                role="region" aria-label="Job Empty State Form success">
                                                                <div>Thanks for joining our newsletter.</div>
                                                            </div>
                                                            <div class="error-message w-form-fail" tabindex="-1"
                                                                role="region" aria-label="Job Empty State Form failure">
                                                                <div>Oops! Something went wrong.</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="navigation" aria-label="List"
                                                class="w-pagination-wrapper pagination"></div>
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