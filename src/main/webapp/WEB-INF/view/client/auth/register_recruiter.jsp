<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="client/css/style.css">
                <script type="text/javascript">
                    !function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);
                </script>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div class="section post-job">
                    <div data-w-id="123feafa-d91f-7738-55c7-5603506f5ee9"
                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                        class="container-medium-765px post-job">
                        <h1 class="title post-job">Register Recruiter Account</h1>
                        <p class="paragraph post-job">Ready to access your recruiter account? If you are new, choose
                            Register to create your recruiter account and get started.

                        </p>
                    </div>
                    <div class="container-default w-container">
                        <div data-duration-in="300" data-duration-out="100"
                            data-w-id="01d28435-fef9-4862-d614-24ffd416973e"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                            data-current="Free Job" data-easing="ease" class="post-job-tabs w-tabs">
                            <div class="post-job-tabs-menu w-tab-menu" role="tablist">
                                <a href="/register_recruiter" id="paid-job"
                                    class="post-job-tab-link w-inline-block w-tab-link w--current" role="tab"
                                    aria-controls="paid-job" aria-selected="true">
                                    <div>Register Recruiter</div>
                                </a>
                            </div>
                            <div class="post-job-tabs-content w-tab-content">
                                <div data-w-tab="Free Job" class="post-job-tab-pane w-tab-pane w--tab-active"
                                    id="w-tabs-0-data-w-pane-0" role="tabpanel" aria-labelledby="free-job"
                                    style="opacity: 1; transition: all, opacity 300ms;">


                                    <div class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca2461a2ab22bb749f85e2_icon-1-post-job-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">1. Register Recruiter
                                                            Information</h2>
                                                        <p class="paragraph post-job-step">Lorem ipsum dolor sit amet,
                                                            consectetur adipiscing elit. Placerat amet ac.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="post-job-step-area-3">
                                                <div class="post-job-step-wrapper _3">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca2461d9a62897715838ba_icon-3-post-job-job-board-x-template.svg"
                                                            alt="Building - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">2. Company information
                                                        </h2>
                                                        <p class="paragraph post-job-step">Lorem ipsum dolor sit amet,
                                                            consectetur adipiscing elit. Placerat amet ac.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <form id="wf-form-Free-Job-Form" name="wf-form-Free-Job-Form"
                                                data-name="Free Job Form" method="get" class="post-job-form"
                                                data-wf-page-id="60ca143dde310e3e2c03c510"
                                                data-wf-element-id="3ac0706c-cc69-3f77-3395-db52c0cd1ac9"
                                                aria-label="Free Job Form">
                                                <div class="card post-job-form-card">
                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                        <div class="input-wrapper">
                                                            <label for="Name-2">Full name<span
                                                                    class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input" maxlength="256"
                                                                placeholder="What is your name?" type="text"
                                                                required="true" path="fullName" />

                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Email-3">Email Address
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input " maxlength="256"
                                                                placeholder="What is your email?" type="email"
                                                                required="true" path="email" />
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Job-Type-Pricing">Password<span
                                                                    class="accent-secondary-5">*</span></label>
                                                            <password class="input w-input form-control "
                                                                placeholder="What is your password?" required="true"
                                                                path="password" />

                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Job-Type-Pricing">Confirm Password<span
                                                                    class="accent-secondary-5">*</span></label>
                                                            <password class="input w-input "
                                                                placeholder="Enter your confirm password"
                                                                required="true" path="confirmPassword" />
                                                        </div>
                                                    </div>
                                                    <div class="divider card-post-job-form"></div>

                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                        <div class="input-wrapper"
                                                            id="w-node-_096a541a-c36e-3a9e-342d-289c676859f8-2c03c510">
                                                            <label for="Company-Name-2">Company
                                                                name<span
                                                                    class="accent-secondary-5">*</span></label><input
                                                                class="input w-input" maxlength="256"
                                                                name="Company-Name" data-name="Company Name"
                                                                placeholder="What is the company name?" type="text"
                                                                id="company-name" required="">
                                                        </div>
                                                        <div class="input-wrapper"
                                                            id="w-node-_096a541a-c36e-3a9e-342d-289c676859f8-2c03c510">
                                                            <label for="Email-3">Company Email
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input " maxlength="256"
                                                                placeholder="What is your company email?" type="email"
                                                                required="true" />
                                                        </div>

                                                        <div class="input-wrapper">
                                                            <label for="Phone-3">Company Phone Number
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input" maxlength="15"
                                                                placeholder="What is your company phone number?"
                                                                type="tel" required="true" />
                                                        </div>

                                                        <div class="input-wrapper">
                                                            <label for="Tax-3">Company Tax ID
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input" maxlength="20"
                                                                placeholder="What is your company tax ID?" type="text"
                                                                required="true" />
                                                        </div>

                                                        <div class="input-wrapper">
                                                            <label for="Established-Date">Established Date
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input" maxlength="10"
                                                                placeholder="YYYY-MM-DD" type="date" required="true" />
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Field-Operation">Field of Operation
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <input class="input w-input" maxlength="256"
                                                                placeholder="What is your field of operation?"
                                                                type="text" required="true" />
                                                        </div>

                                                        <div class="input-wrapper">
                                                            <label for="Company-Size">Company Size
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <select class="input w-input" name="Company-Size"
                                                                id="company-size" required="true">
                                                                <option value="" disabled selected>Select your company
                                                                    size</option>
                                                                <option value="1-10">1-10 employees</option>
                                                                <option value="11-50">11-50 employees</option>
                                                                <option value="51-200">51-200 employees</option>
                                                                <option value="201-500">201-500 employees</option>
                                                                <option value="501-1000">501-1000 employees</option>
                                                                <option value="1001+">1001+ employees</option>
                                                            </select>
                                                        </div>
                                                        <div class="input-wrapper"><label for="Company-Website">Company
                                                                website<span
                                                                    class="accent-secondary-5">*</span></label><input
                                                                class="input w-input" maxlength="256"
                                                                name="Company-Website" data-name="Company Website"
                                                                placeholder="https://company.com" type="text"
                                                                id="company-website" required=""></div>


                                                        <div id="w-node-_096a541a-c36e-3a9e-342d-289c676859f8-2c03c510"
                                                            class="input-wrapper"><label
                                                                for="Company-description">Company
                                                                description<span
                                                                    class="accent-secondary-5">*</span></label><textarea
                                                                data-name="Company description" maxlength="5000"
                                                                id="company-description" name="Company-description"
                                                                required=""
                                                                placeholder="Write your company description here. Please describe what your company does, how long it had been operating, and any other relevant information. Please write up to 1200 characters."
                                                                class="text-area w-input"></textarea></div>
                                                    </div>
                                                </div><input type="submit" data-wait="Please wait..."
                                                    class="button-primary post-job-form-button w-button"
                                                    value="Register Recruiter">
                                            </form>
                                            <!-- <div class="card post-job-form-card empty w-form-done" tabindex="-1"
                                                role="region" aria-label="Free Job Form success">
                                                <div class="success-message post-job-form-card">Your free job post will
                                                    be
                                                    reviewed and if it meets the requirements, it will be approved by
                                                    one of our
                                                    moderators</div>
                                            </div>
                                            <div class="error-message w-form-fail" tabindex="-1" role="region"
                                                aria-label="Free Job Form failure">
                                                <div>Oops! Something went wrong.</div>
                                            </div> -->
                                        </div>
                                    </div>

                                </div>
                                <div data-w-tab="Paid Job" class="post-job-tab-pane w-tab-pane"
                                    id="w-tabs-0-data-w-pane-1" role="tabpanel" aria-labelledby="paid-job" style="">
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