<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="featured-jobs-wrapper">
            <h2 class="title featured-jobs">Featured jobs</h2>
            <div class="w-dyn-list">
                <div role="list" class="featured-jobs-grid w-dyn-items">
                    <c:forEach var="job" items="${hotJobPosts}">
                        <div role="listitem" class="featured-job-item w-dyn-item"><a href="job/${job.id}"
                                class="card job featured w-inline-block">
                                <div class="split-content card-job-left">
                                    <div class="image-wrapper card-job"><img
                                            src="/images/company/${job.company.companyImageUrl}" alt="${jobName}"
                                            class="image card-job"
                                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                    </div>
                                    <div class="card-job-title-wrapper">
                                        <h3 class="title h6-size card-job-featured">${job.jobName}</h3>
                                        <div class="card-link-wrapper">
                                            <div class="card-link featured">${job.company.companyName}</div>
                                            <div class="card-link-arrow"
                                                style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                                <div class="card-link-arrow-1 featured"></div>
                                                <div class="card-link-arrow-2 featured"></div>
                                                <div class="card-link-arrow-3 featured"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="split-content card-job-right">
                                    <div class="card-job-category-wrapper">
                                        <div class="card-job-category-title-wrapper"><img
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                                alt="Location Icon - Job Board X Webflow Template"
                                                class="card-job-category-title-icon">
                                            <div>Location</div>
                                        </div>
                                        <div class="card-job-category-text">${job.typeOfWorkplace}</div>
                                    </div>
                                    <div class="card-job-category-wrapper">
                                        <div class="card-job-category-title-wrapper"><img
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                alt="Graph Icon - Job Board X Webflow Template"
                                                class="card-job-category-title-icon">
                                            <div>Level</div>
                                        </div>
                                        <div class="card-job-category-text">${job.position}</div>
                                    </div>
                                    <div class="card-job-category-wrapper">
                                        <div class="card-job-category-title-wrapper"><img
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                                alt="Portfolio Icon - Job Board X Webflow Template"
                                                class="card-job-category-title-icon">
                                            <div>Department</div>
                                        </div>
                                        <div class="card-job-category-text">${job.career.name}</div>
                                    </div>
                                </div>
                            </a></div>
                    </c:forEach>

                    <!-- <div role="listitem" class="featured-job-item w-dyn-item"><a href="/job/backend-software-engineer"
                            class="card job featured w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/6527690e2dea9c09529345d7_webflow-logo-jobs.svg"
                                        alt="Backend Software Engineer" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job-featured">Backend Software
                                        Engineer</h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link featured">Webflow</div>
                                        <div class="card-link-arrow"
                                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                            <div class="card-link-arrow-1 featured"></div>
                                            <div class="card-link-arrow-2 featured"></div>
                                            <div class="card-link-arrow-3 featured"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="split-content card-job-right">
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                            alt="Location Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Location</div>
                                    </div>
                                    <div class="card-job-category-text">Remote</div>
                                </div>
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                            alt="Graph Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Level</div>
                                    </div>
                                    <div class="card-job-category-text">Senior</div>
                                </div>
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                            alt="Portfolio Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Department</div>
                                    </div>
                                    <div class="card-job-category-text">Development</div>
                                </div>
                            </div>
                        </a></div>
                    <div role="listitem" class="featured-job-item w-dyn-item"><a href="/job/executive-sales-manager"
                            class="card job featured w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/6527690e2dea9c09529345d7_webflow-logo-jobs.svg"
                                        alt="Executive Sales Manager" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job-featured">Executive Sales Manager
                                    </h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link featured">Webflow</div>
                                        <div class="card-link-arrow"
                                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                            <div class="card-link-arrow-1 featured"></div>
                                            <div class="card-link-arrow-2 featured"></div>
                                            <div class="card-link-arrow-3 featured"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="split-content card-job-right">
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                            alt="Location Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Location</div>
                                    </div>
                                    <div class="card-job-category-text">Remote</div>
                                </div>
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                            alt="Graph Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Level</div>
                                    </div>
                                    <div class="card-job-category-text">Executive</div>
                                </div>
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                            alt="Portfolio Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Department</div>
                                    </div>
                                    <div class="card-job-category-text">Development</div>
                                </div>
                            </div>
                        </a></div> -->
                </div>
            </div>
        </div>