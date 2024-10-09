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
                    .card.home-jobs-filters {
                        margin-top: -90px !important;
                    }
                </style>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div style="opacity: 1;" class="page-wrapper">
                    <div class="section home">
                        <!-- <div data-w-id="79cc5e11-23b1-da9f-4f65-26174000ce2d"
                style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d; opacity: 1;"
                class="container-medium-736px home-hero">
                <h1 data-w-id="7c40314c-5dc6-b15a-84ae-c36852bb1073" class="title home-hero">Top Viec for Developers,
                    Designers, and Marketers</h1>
                <p class="paragraph home-hero">Jobs is a curated job board of the best jobs for developers, designers
                    and marketers in the tech industry.</p>
            </div> -->

                        <div data-w-id="651950f6-e58e-81e6-31bd-2aa5b9f5c2c4"
                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d; opacity: 1;"
                            class="container-default w-container">

                            <jsp:include page="../layout/search.jsp" />



                            <div class="job-board-wrapper">
                                <div class="split-content job-board-content">
                                    <jsp:include page="../layout/featured.jsp" />
                                    <jsp:include page="../layout/latestjob.jsp" />
                                </div>
                                <div class="split-content job-sidebar">
                                    <div class="job-sidebar-wrapper">
                                        <div class="card job-board-post">
                                            <div class="card-job-board-post-content">
                                                <div class="image-wrapper card-job-board-post-icon"><img
                                                        src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7ce2fc1dfba6b0c653e97_icon-job-post-job-board-x-template.svg"
                                                        alt="Job Board X Webflow Template - Webclip"
                                                        class="image card-job-board-post-icon">
                                                </div>
                                                <div class="card-job-board-post-content">
                                                    <h4 class="title card-job-board-post">Get Unlimited Now</h4>
                                                    <p class="paragraph card-job-board-post">If you are a recruiter,
                                                        register for
                                                        our unlimited plan to take full advantage of all our features
                                                        and reach the
                                                        best candidates. Sed.</p>
                                                    <div class="job-board-post-links-wrapper"><a href="/pricing"
                                                            class="button-primary small card-job-board-post w-button">Get
                                                            Unlimited</a><a href="/register_recruiter"
                                                            class="card-job-board-post-free-link">or register recruiter
                                                            to post a
                                                            free job</a></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card job-board-featured-companies">
                                            <div class="card-job-board-featured-companies-content">
                                                <h4 class="title featured-companies">Featured companies</h4>
                                                <div class="w-dyn-list">
                                                    <div role="list" class="featured-companies-grid w-dyn-items">
                                                        <div role="listitem" class="featured-company-item w-dyn-item"><a
                                                                href="/company/facebook"
                                                                class="featured-company-wrapper w-inline-block">
                                                                <div class="featured-company-content">
                                                                    <div class="image-wrapper featured-company"><img
                                                                            src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c84897b7ea2081168fe5_icon-7-company-job-board-x-template.svg"
                                                                            alt="Facebook"
                                                                            class="image featured-company"></div>
                                                                    <h5 class="title featured-company">Facebook</h5>
                                                                </div>
                                                                <div class="arrow">&#9654;</div>
                                                            </a>
                                                        </div>
                                                        <div role="listitem" class="featured-company-item w-dyn-item"><a
                                                                href="/company/twitter"
                                                                class="featured-company-wrapper w-inline-block">
                                                                <div class="featured-company-content">
                                                                    <div class="image-wrapper featured-company"><img
                                                                            src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c829d7c3af7b0d61137c_icon-6-company-job-board-x-template.svg"
                                                                            alt="Twitter"
                                                                            class="image featured-company"></div>
                                                                    <h5 class="title featured-company">Twitter</h5>
                                                                </div>
                                                                <div class="arrow">&#9654;</div>
                                                            </a></div>
                                                        <div role="listitem" class="featured-company-item w-dyn-item"><a
                                                                href="/company/google"
                                                                class="featured-company-wrapper w-inline-block">
                                                                <div class="featured-company-content">
                                                                    <div class="image-wrapper featured-company"><img
                                                                            src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c7ea645b46e9836da40c_icon-4-company-job-board-x-template.svg"
                                                                            alt="Google" class="image featured-company">
                                                                    </div>
                                                                    <h5 class="title featured-company">Google</h5>
                                                                </div>
                                                                <div class="arrow">&#9654;</div>
                                                            </a></div>
                                                        <div role="listitem" class="featured-company-item w-dyn-item"><a
                                                                href="/company/youtube"
                                                                class="featured-company-wrapper w-inline-block">
                                                                <div class="featured-company-content">
                                                                    <div class="image-wrapper featured-company"><img
                                                                            src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c77c645b466dd56da3b0_icon-3-company-job-board-x-template.svg"
                                                                            alt="Youtube"
                                                                            class="image featured-company"></div>
                                                                    <h5 class="title featured-company">Youtube</h5>
                                                                </div>
                                                                <div class="arrow">&#9654;</div>
                                                            </a></div>
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


                <div class="section cta">
                    <div class="container-default w-container">
                        <div class="cta-wrapper">
                            <div data-w-id="109a18e5-4b1d-6f54-d85d-f775779ec40b" class="card cta featured"
                                style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d; opacity: 1;">
                                <h2 class="title cta featured">Post a featured job</h2>
                                <p class="paragraph cta featured">Lorem ipsum dolor sit amet, consectetur adipiscing
                                    elit. Tincidunt
                                    sit venenatis, vulputate tristique fringilla ut. Vitae pulvina.</p><a
                                    href="/pricing" class="button-primary button-white cta-featured w-button">Post a
                                    featured job</a>
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
                                <p class="paragraph cta">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Tincidunt sit
                                    venenatis, vulputate tristique fringilla ut. Vitae pulvina.</p><a href="/post-a-job"
                                    class="button-primary w-button">Post a free job</a>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../layout/chatbot.jsp" />
                <jsp:include page="../layout/footer.jsp" />
                <script
                    src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                    type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                    crossorigin="anonymous"></script>
            </body>


            </html>