<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="/client/css/style.css">
        </head>

        <body>
            <jsp:include page="../layout/header.jsp" />

            <div class="section companies">
                <div data-w-id="fb490bb8-62db-fc28-81ac-81291b8b7495"
                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                    class="container-small-550px companies">
                    <h1 class="title companies">Companies</h1>
                    <p class="paragraph companies">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris risus
                        malesuada sit blandit ac nullam. Sed et elit ut.</p>
                </div>
                <div class="container-default w-container">
                    <div class="w-dyn-list">
                        <div data-w-id="7a5d7a54-2f32-9280-d12f-413a1febc5c8"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                            role="list" class="companies-grid w-dyn-items">



                            <c:forEach var="company" items="${companies}">

                                <div role="listitem" class="company-item w-dyn-item"><a href="/companies/${company.id}"
                                        class="card company-item w-inline-block">
                                        <div class="image-wrapper company-item"><img
                                                src=" /images/company/${company.companyImageUrl}"
                                                alt="${company.companyName}" class="image company-item"
                                                style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                        </div>
                                        <div class="company-item-content">
                                            <h2 class="title h4-size company-item" style="color: rgb(23, 23, 40);">
                                                ${company.companyName}
                                            </h2>
                                            <p class="paragraph company-item">${company.description} </p>
                                            <div class="card-link-wrapper weight-medium">
                                                <div class="card-link">View Company</div>
                                                <div class="card-link-arrow"
                                                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                    <div class="card-link-arrow-1"></div>
                                                    <div class="card-link-arrow-2"></div>
                                                    <div class="card-link-arrow-3"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>



                        </div>
                    </div>
                </div>
            </div>


            <div class="section cta">
                <div class="container-default w-container">
                    <div class="cta-wrapper">
                        <div data-w-id="109a18e5-4b1d-6f54-d85d-f775779ec40b" class="card cta featured"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d; opacity: 1;">
                            <h2 class="title cta featured">Post a featured job</h2>
                            <p class="paragraph cta featured">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Tincidunt
                                sit venenatis, vulputate tristique fringilla ut. Vitae pulvina.</p><a href="/pricing"
                                class="button-primary button-white cta-featured w-button">Post a featured job</a>
                            <div class="bg cta-shape-1"
                                style="will-change: transform; transform: translate3d(0px, 22.292px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                            </div>
                            <div class="bg cta-shape-2"
                                style="will-change: transform; transform: translate3d(0px, 5.573px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                            </div>
                            <div class="bg cta-shape-3"
                                style="will-change: transform; transform: translate3d(0px, 11.146px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                            </div>
                        </div>
                        <div data-w-id="109a18e5-4b1d-6f54-d85d-f775779ec415" class="card cta"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d; opacity: 1;">
                            <h2 class="title cta">Post a free job</h2>
                            <p class="paragraph cta">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt
                                sit
                                venenatis, vulputate tristique fringilla ut. Vitae pulvina.</p><a href="/post-a-job"
                                class="button-primary w-button">Post a free job</a>
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