<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="card home-jobs-filters">
            <form action="/search" class="home-jobs-filter-search w-form"><input
                    class="input home-jobs-filter-search-input w-input" maxlength="256" name="query"
                    placeholder="Search for jobs" type="search" id="search" required=""><input type="submit"
                    class="button-primary small home-jobs-filter-search-button w-button" value="Search"></form>
            <div class="home-jobs-filters-wrapper">
                <div data-hover="true" data-delay="0" class="jobs-filters-dropdown w-dropdown" style="">
                    <div class="jobs-filters-dropdown-button w-dropdown-toggle" id="w-dropdown-toggle-2"
                        aria-controls="w-dropdown-list-2" aria-haspopup="menu" aria-expanded="false" role="button"
                        tabindex="0">
                        <img src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7e859a1e14a2779c3bfb1_icon-1-dropdown-job-categories-job-board-x-template.svg"
                            alt="Location Icon - Job Board X Webflow Template" class="image jobs-filters-dropdown-icon">
                        <div class="dropdown-job-category-filter-text">Location</div>
                        <img src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60cccd6ae643dd6c588e715c_icon-dropdown-job-board-x-template.svg"
                            alt="Chevron - Job Board X Webflow Template" class="image dropdown-icon">
                    </div>
                    <nav class="jobs-filters-dropdown-list w-dropdown-list" id="w-dropdown-list-2"
                        aria-labelledby="w-dropdown-toggle-2">
                        <div class="card jobs-filters-dropdown-links">
                            <div class="w-dyn-list">
                                <div role="list" class="jobs-filters-dropdown-links-grid w-dyn-items">
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-location-category/austin-tx" class="dropdown-nav-link"
                                            tabindex="0">Austin, TX</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-location-category/miami-fl" class="dropdown-nav-link"
                                            tabindex="0">Miami, FL</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-location-category/new-york-ny" class="dropdown-nav-link"
                                            tabindex="0">New York, NY</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-location-category/remote" class="dropdown-nav-link"
                                            tabindex="0">Remote</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div data-hover="true" data-delay="0" class="jobs-filters-dropdown w-dropdown" style="">
                    <div class="jobs-filters-dropdown-button w-dropdown-toggle" id="w-dropdown-toggle-3"
                        aria-controls="w-dropdown-list-3" aria-haspopup="menu" aria-expanded="false" role="button"
                        tabindex="0">
                        <img src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7e859d99a538e3a65f4dc_icon-2-dropdown-job-categories-job-board-x-template.svg"
                            alt="Graph Icon - Job Board X Webflow Template" class="image jobs-filters-dropdown-icon">
                        <div class="dropdown-job-category-filter-text">Job Level</div>
                        <img src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60cccd6ae643dd6c588e715c_icon-dropdown-job-board-x-template.svg"
                            alt="Chevron - Job Board X Webflow Template" class="image dropdown-icon">
                    </div>
                    <nav class="jobs-filters-dropdown-list w-dropdown-list" id="w-dropdown-list-3"
                        aria-labelledby="w-dropdown-toggle-3">
                        <div class="card jobs-filters-dropdown-links">
                            <div class="w-dyn-list">
                                <div role="list" class="jobs-filters-dropdown-links-grid w-dyn-items">
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-level-category/junior" class="dropdown-nav-link"
                                            tabindex="0">Junior</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-level-category/senior" class="dropdown-nav-link"
                                            tabindex="0">Senior</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-level-category/executive" class="dropdown-nav-link"
                                            tabindex="0">Executive</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div data-hover="true" data-delay="0" class="jobs-filters-dropdown w-dropdown" style="">
                    <div class="jobs-filters-dropdown-button last w-dropdown-toggle" id="w-dropdown-toggle-4"
                        aria-controls="w-dropdown-list-4" aria-haspopup="menu" aria-expanded="false" role="button"
                        tabindex="0">
                        <img src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60c7e85a808c1866139f449f_icon-3-dropdown-job-categories-job-board-x-template.svg"
                            alt="Portfolio Icon - Job Board X Webflow Template"
                            class="image jobs-filters-dropdown-icon">
                        <div class="dropdown-job-category-filter-text">Department</div>
                        <img src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60cccd6ae643dd6c588e715c_icon-dropdown-job-board-x-template.svg"
                            alt="Chevron - Job Board X Webflow Template" class="image dropdown-icon">
                    </div>
                    <nav class="jobs-filters-dropdown-list w-dropdown-list" id="w-dropdown-list-4"
                        aria-labelledby="w-dropdown-toggle-4">
                        <div class="card jobs-filters-dropdown-links">
                            <div class="w-dyn-list">
                                <div role="list" class="jobs-filters-dropdown-links-grid w-dyn-items">
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-department-category/support" class="dropdown-nav-link"
                                            tabindex="0">Support</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-department-category/business" class="dropdown-nav-link"
                                            tabindex="0">Business</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-department-category/marketing" class="dropdown-nav-link"
                                            tabindex="0">Marketing</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-department-category/design" class="dropdown-nav-link"
                                            tabindex="0">Design</a>
                                    </div>
                                    <div role="listitem" class="jobs-filters-dropdown-link-item w-dyn-item">
                                        <a href="/job-department-category/development" class="dropdown-nav-link"
                                            tabindex="0">Development</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>