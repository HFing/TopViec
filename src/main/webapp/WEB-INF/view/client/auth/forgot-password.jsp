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
                <style>
                    .utility-page-wrap {
                        margin-top: -65px !important;
                    }
                </style>


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
                    <c:if test="${not empty error}">
                        <div class="alert-popup" role="alert"
                            style="background-color: #f8d7da !important; color:  #721c24 !important;">
                            <span class="icon">❌</span>
                            <span>${error}</span>
                        </div>
                    </c:if>

                    <section class="utility-page-wrap">
                        <div data-w-id="5e86ada79942c1e4247fd4c700000000000b"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                            class="utility-page-content-password w-password-page w-form">
                            <form action="/forgot_password" method="post" id="email-form" name="email-form"
                                data-name="Email Form" class="utility-page-form w-password-page"
                                data-wf-page-id="60c77302fcfa2b1cc1595f67"
                                data-wf-element-id="5e86ada79942c1e4247fd4c700000000000c" aria-label="Email Form">
                                <div class="icon-password"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60da7e0ed1514e11f2df0cc3_password-icon-job-board-x-webflow-template.svg"
                                        alt="Password Icon - Job Board X Webflow Template"></div>
                                <h2>Forgot Password</h2>
                                <p class="paragraph password">Please enter your email address to reset your password.
                                    You will receive a new password via email.</p>




                                <input class="input password w-password-page w-input" autofocus="true" maxlength="256"
                                    name="email" placeholder="Enter your email address" type="email" id="email"
                                    required />

                                <input type="submit" data-wait="Please wait..."
                                    class="button-primary full-width w-password-page w-button" value="Enter now">
                            </form>
                        </div>
                    </section>
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