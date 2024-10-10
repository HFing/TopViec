<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="jobs-wrapper">
            <h2 class="title jobs">Latest jobs</h2>
            <div class="w-dyn-list">
                <div role="list" class="jobs-grid w-dyn-items">
                    <c:if test="${empty jobPosts}">
                        <div class="card job-empty-state w-dyn-empty">
                            <div class="job-empty-state-wrapper">
                                <div class="image-wrapper job-empty-state-icon"><img
                                        alt="Search Icon - Job Board X Webflow Template"
                                        src="https://cdn.prod.website-files.com/60c77302fcfa2b84ab595f64/60c94c777132722f6ab7e8b6_icon-job-empty-job-board-x-template.svg"
                                        class="image job-empty-state"></div>
                                <div class="job-empty-state-content">
                                    <h3 class="title h2-size job-empty-state">Couldn't find the job you were looking
                                        for?</h3>
                                    <p class="paragraph job-empty-state">Want to stay up to
                                        date of
                                        all new job openings popin up? Subscribe to our
                                        newsletter
                                        to receive great jobs every week.</p>
                                    <div class="job-empty-state-form-block w-form">
                                        <form id="wf-form-Job-Empty-State-Form" name="wf-form-Job-Empty-State-Form"
                                            data-name="Job Empty State Form" method="get" class="job-empty-state-form"
                                            data-wf-page-id="60c7a4d437554c8630b53ab2"
                                            data-wf-element-id="93a9aff5-cc15-0ba3-947d-b091b4bbaf0b"
                                            aria-label="Job Empty State Form"><input
                                                class="input job-empty-state w-input" maxlength="256" name="Email"
                                                data-name="Email" placeholder="Subscribe to our newsletter" type="email"
                                                id="email" required=""><input type="submit" data-wait="Please wait..."
                                                class="button-primary small job-empty-state w-button" value="Subscribe">
                                        </form>
                                        <div class="success-message w-form-done" tabindex="-1" role="region"
                                            aria-label="Job Empty State Form success">
                                            <div>Thanks for joining our newsletter.</div>
                                        </div>
                                        <div class="error-message w-form-fail" tabindex="-1" role="region"
                                            aria-label="Job Empty State Form failure">
                                            <div>Oops! Something went wrong.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:forEach var="job" items="${jobPosts}">
                        <div role="listitem" class="job-item w-dyn-item">
                            <a href="job/${job.id}" class="card job w-inline-block ${job.isUrgent ? 'latest' : ''}">
                                <div class="split-content card-job-left">
                                    <div class="image-wrapper card-job"><img
                                            src="/images/company/${job.company.companyImageUrl}" alt="${job.jobName}"
                                            class="image card-job"
                                            style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                    </div>
                                    <div class="card-job-title-wrapper">
                                        <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                            ${job.jobName}</h3>
                                        <div class="card-link-wrapper">
                                            <div class="card-link">${job.company.companyName}</div>
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
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                                alt="Location Icon - Job Board X Webflow Template"
                                                class="card-job-category-title-icon">
                                            <div>Location</div>
                                        </div>
                                        <div class="card-job-category-text">${job.typeOfWorkplace.displayName}</div>
                                    </div>
                                    <div class="card-job-category-wrapper">
                                        <div class="card-job-category-title-wrapper"><img
                                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                                alt="Graph Icon - Job Board X Webflow Template"
                                                class="card-job-category-title-icon">
                                            <div>Level</div>
                                        </div>
                                        <div class="card-job-category-text">${job.position.displayName}</div>
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
                            </a>
                        </div>
                    </c:forEach>

                    <!-- <div role="listitem" class="job-item w-dyn-item"><a href="/job/mobile-product-manager"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c7ea645b46e9836da40c_icon-4-company-job-board-x-template.svg"
                                        alt="Mobile Product Manager" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        Mobile Product Manager</h3>
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
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                            alt="Location Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Location</div>
                                    </div>
                                    <div class="card-job-category-text">New York, NY</div>
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
                                    <div class="card-job-category-text">Design</div>
                                </div>
                            </div>
                        </a></div>
                    <div role="listitem" class="job-item w-dyn-item"><a href="/job/head-of-product-design"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c77c645b466dd56da3b0_icon-3-company-job-board-x-template.svg"
                                        alt="Head of Product Design" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        Head of Product Design</h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link">Youtube</div>
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
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                            alt="Location Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Location</div>
                                    </div>
                                    <div class="card-job-category-text">Miami, FL</div>
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
                                    <div class="card-job-category-text">Design</div>
                                </div>
                            </div>
                        </a></div>
                    <div role="listitem" class="job-item w-dyn-item"><a href="/job/customer-support-agent"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c77c645b466dd56da3b0_icon-3-company-job-board-x-template.svg"
                                        alt="Customer Support Agent" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        Customer Support Agent</h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link">Youtube</div>
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
                                    <div class="card-job-category-text">Junior</div>
                                </div>
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51c1dfba2485657961_icon-3-job-categories-job-board-x-template.svg"
                                            alt="Portfolio Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Department</div>
                                    </div>
                                    <div class="card-job-category-text">Business</div>
                                </div>
                            </div>
                        </a></div>
                    <div role="listitem" class="job-item w-dyn-item"><a href="/job/react-native-developer"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c84897b7ea2081168fe5_icon-7-company-job-board-x-template.svg"
                                        alt="React Native Developer" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        React Native Developer</h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link">Facebook</div>
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
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                            alt="Location Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Location</div>
                                    </div>
                                    <div class="card-job-category-text">Austin, TX</div>
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
                    <div role="listitem" class="job-item w-dyn-item"><a href="/job/video-marketing-producer"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/6527690e2dea9c09529345d7_webflow-logo-jobs.svg"
                                        alt="Video Marketing Producer" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        Video Marketing Producer</h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link">Webflow</div>
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
                                    <div class="card-job-category-text">Marketing</div>
                                </div>
                            </div>
                        </a></div>
                    <div role="listitem" class="job-item w-dyn-item"><a href="/job/jr-frontend-engineer"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c7ea645b46e9836da40c_icon-4-company-job-board-x-template.svg"
                                        alt="Jr Frontend Engineer" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        Jr Frontend Engineer</h3>
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
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc5172557266c1162fc4_icon-1-job-categories-job-board-x-template.svg"
                                            alt="Location Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Location</div>
                                    </div>
                                    <div class="card-job-category-text">Austin, TX</div>
                                </div>
                                <div class="card-job-category-wrapper">
                                    <div class="card-job-category-title-wrapper"><img
                                            src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7dc51b6792171f081ab50_icon-2-job-categories-job-board-x-template.svg"
                                            alt="Graph Icon - Job Board X Webflow Template"
                                            class="card-job-category-title-icon">
                                        <div>Level</div>
                                    </div>
                                    <div class="card-job-category-text">Junior</div>
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
                    <div role="listitem" class="job-item w-dyn-item"><a href="/job/head-of-product-marketing"
                            class="card job w-inline-block">
                            <div class="split-content card-job-left">
                                <div class="image-wrapper card-job"><img
                                        src="https://assets-global.website-files.com/60c77302fcfa2bdb6e595f76/60c7c829d7c3af7b0d61137c_icon-6-company-job-board-x-template.svg"
                                        alt="Head of Product Marketing" class="image card-job"
                                        style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                                </div>
                                <div class="card-job-title-wrapper">
                                    <h3 class="title h6-size card-job" style="color: rgb(23, 23, 40);">
                                        Head of Product Marketing</h3>
                                    <div class="card-link-wrapper">
                                        <div class="card-link">Twitter</div>
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
                                    <div class="card-job-category-text">Marketing</div>
                                </div>
                            </div>
                        </a></div> -->
                </div>
                <div role="navigation" aria-label="List" class="w-pagination-wrapper pagination">
                    <a href="/search" aria-label="Next Page" class="w-pagination-next button-secondary pagination">
                        <div class="w-inline-block">See All</div>
                    </a>
                    <link rel="prerender" href="/search">
                </div>
            </div>
        </div>