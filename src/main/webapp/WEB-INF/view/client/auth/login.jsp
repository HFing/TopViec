<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="client/css/style.css">
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script type="text/javascript">
                    !function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);
                </script>



            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div class="section post-job">
                    <c:if test="${not empty message}">
                        <div class="alert-popup" role="alert">
                            <span class="icon">✔️</span>
                            <span>${message}</span>
                        </div>
                    </c:if>
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
                                <a href="/login" id="free-job"
                                    class="post-job-tab-link w-inline-block w-tab-link w--current" role="tab"
                                    aria-controls="free-job" aria-selected="false">
                                    <div>Login</div>
                                </a>
                                <a href="/register" id="paid-job" class="post-job-tab-link w-inline-block w-tab-link"
                                    role="tab" aria-controls="paid-job" aria-selected="true">
                                    <div>Register</div>
                                </a>
                            </div>
                            <div class="post-job-tabs-content w-tab-content">
                                <div data-w-tab="Free Job" class="post-job-tab-pane w-tab-pane w--tab-active"
                                    id="w-tabs-0-data-w-pane-0" role="tabpanel" aria-labelledby="free-job"
                                    style="opacity: 1; transition: all, opacity 300ms;">


                                    <div id="free-job-content" class="post-job-wrapper">
                                        <div class="split-content post-job-sidebar">
                                            <div class="post-job-step-area-1">
                                                <div class="post-job-step-wrapper _1">
                                                    <div class="image-wrapper post-job-step"><img
                                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca2461a2ab22bb749f85e2_icon-1-post-job-job-board-x-template.svg"
                                                            alt="User Icon - Job Board X Webflow Template"
                                                            class="image post-job-step"></div>
                                                    <div class="post-job-step-content">
                                                        <h2 class="title h3-size post-job-step">User information</h2>
                                                        <p class="paragraph post-job-step">This text can be used on a
                                                            login page for
                                                            users to enter their email and password.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="post-job-form-block w-form">
                                            <form id="wf-form-Free-Job-Form" name="wf-form-Free-Job-Form"
                                                data-name="Free Job Form" method="post" class="post-job-form"
                                                data-wf-page-id="60ca143dde310e3e2c03c510"
                                                data-wf-element-id="3ac0706c-cc69-3f77-3395-db52c0cd1ac9"
                                                aria-label="Free Job Form" action="/login">
                                                <c:if test="${param.error != null}">
                                                    <div class="my-2" style="color: red;">Invalid email or password.
                                                    </div>
                                                </c:if>

                                                <div class="card post-job-form-card">
                                                    <div class="w-layout-grid card-post-job-form-grid">
                                                        <div class="input-wrapper">
                                                            <label for="username">Email Address</label>
                                                            <input class="input w-input" name="username"
                                                                data-name="Email" placeholder="What is your email?"
                                                                type="email" id="username" wfd-id="id1" required="" />
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="password">Password</label>
                                                            <input class="input w-input"
                                                                placeholder="What is your password?" type="password"
                                                                id="password" wfd-id="id0" name="password"
                                                                required="" />
                                                        </div>
                                                        <div>
                                                            <a href="/forgot_password"
                                                                class="forgot-password-link">Forgot your password?</a>
                                                        </div>
                                                        <div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="submit" data-wait="Please wait..."
                                                    class="button-primary post-job-form-button w-button" value="Log In"
                                                    wfd-id="id17">
                                            </form>

                                            <div style="margin-top: 20px;"></div>
                                            <a href="/oauth2/authorization/google"
                                                class="button-primary post-job-form-button w-button">Login with
                                                Google</a>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div data-w-tab="Paid Job" class="post-job-tab-pane w-tab-pane" id="w-tabs-0-data-w-pane-1"
                                role="tabpanel" aria-labelledby="paid-job" style="">
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