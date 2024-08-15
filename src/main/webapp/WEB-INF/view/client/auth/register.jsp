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
                        <h1 class="title post-job">Register or Login</h1>
                        <p class="paragraph post-job">Ready to access your account? If you are new, choose Register to
                            create your
                            account and get started. If you already have an account, select Login to continue.

                        </p>
                    </div>
                    <div class="container-default w-container">
                        <div data-duration-in="300" data-duration-out="100"
                            data-w-id="01d28435-fef9-4862-d614-24ffd416973e"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                            data-current="Free Job" data-easing="ease" class="post-job-tabs w-tabs">
                            <div class="post-job-tabs-menu w-tab-menu" role="tablist">
                                <a href="/login" id="free-job" class="post-job-tab-link w-inline-block w-tab-link    "
                                    role="tab" aria-controls="free-job" aria-selected="false">
                                    <div>Login</div>
                                </a>
                                <a href="/register" id="paid-job"
                                    class="post-job-tab-link w-inline-block w-tab-link w--current" role="tab"
                                    aria-controls="paid-job" aria-selected="true">
                                    <div>Register</div>
                                </a>
                            </div>
                            <div class="post-job-tabs-content w-tab-content">
                                <div data-w-tab="Free Job" class="post-job-tab-pane w-tab-pane w--tab-active"
                                    id="w-tabs-0-data-w-pane-0" role="tabpanel" aria-labelledby="free-job"
                                    style="opacity: 1; transition: all, opacity 300ms;">


                                    <div id="paid-job-content" class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca2461a2ab22bb749f85e2_icon-1-post-job-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">Register User
                                                            information</h2>
                                                        <p class="paragraph post-job-step">Please fill in the
                                                            registration
                                                            information</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <form:form id="wf-form-Paid-Job-Form" method="post" class="post-job-form"
                                                action="/register" modelAttribute="registerUser">
                                                <c:set var="errorPassword">
                                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorEmail">
                                                    <form:errors path="email" cssClass="invalid-feedback" />
                                                </c:set>
                                                <div class="card post-job-form-card">
                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                        <div class="input-wrapper">
                                                            <label for="Name-2">Full name<span
                                                                    class="accent-secondary-5">*</span>
                                                            </label>
                                                            <form:input class="input w-input" maxlength="256"
                                                                placeholder="What is your name?" type="text"
                                                                required="true" path="fullName" />

                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Email-3">Email Address
                                                                <span class="accent-secondary-5">*</span>
                                                            </label>
                                                            <form:input
                                                                class="input w-input ${not empty errorEmail? 'input-error':''}"
                                                                maxlength="256" placeholder="What is your email?"
                                                                type="email" required="true" path="email" />
                                                            ${errorEmail}
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Job-Type-Pricing">Password<span
                                                                    class="accent-secondary-5">*</span></label>
                                                            <form:password
                                                                class="input w-input form-control ${not empty errorPassword? 'input-error':''}"
                                                                placeholder="What is your password?" required="true"
                                                                path="password" />
                                                            ${errorPassword}
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="Job-Type-Pricing">Confirm Password<span
                                                                    class="accent-secondary-5">*</span></label>
                                                            <form:password
                                                                class="input w-input ${not empty errorPassword? 'input-error':''}"
                                                                placeholder="Enter your confirm password"
                                                                required="true" path="confirmPassword" />
                                                        </div>
                                                        <div class="divider card-post-job-form"></div>
                                                        <label id="w-node-b19b99f0-ce5e-c51a-6c1e-619defa52bf1-2c03c510"
                                                            class="w-checkbox checkbox-field">
                                                            <input type="checkbox" id="checkbox" name="checkbox-2"
                                                                data-name="Checkbox 2"
                                                                style="opacity:0;position:absolute;z-index:-1">
                                                            <div
                                                                class="w-checkbox-input w-checkbox-input--inputType-custom checkbox">
                                                            </div>
                                                            <span class="checkbox-label w-form-label"
                                                                for="checkbox-2">Checkbox</span>
                                                            <div class="checkbox-text-wrapper">
                                                                <div class="checkbox-title">Accept Terms and Conditions?
                                                                </div>
                                                                <div class="checkbox-text">By checking this box, you
                                                                    agree to our terms and conditions.</div>
                                                            </div>
                                                        </label>
                                                        <button type="submit"
                                                            class="button-primary post-job-form-button w-button">Register</button>
                                            </form:form>

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