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
                    .modal {
                        display: none;
                        position: fixed;
                        z-index: 1;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        overflow: auto;
                        background-color: rgb(0, 0, 0);
                        background-color: rgba(0, 0, 0, 0.4);
                    }

                    .modal-content {
                        background-color: #fefefe;
                        margin: 15% auto;
                        padding: 20px;
                        border: 1px solid #888;
                        width: 80%;
                    }

                    .close {
                        color: #aaa;
                        float: right;
                        font-size: 28px;
                        font-weight: bold;
                    }

                    .close:hover,
                    .close:focus {
                        color: black;
                        text-decoration: none;
                        cursor: pointer;
                    }

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
                                <img src="/images/avatar/default_cover_profile.png" loading="eager"
                                    alt="user Cover Image"
                                    sizes="(max-width: 767px) 93vw, (max-width: 1439px) 95vw, 984px"
                                    class="image company-cover"
                                    style="will-change: transform; transform: translate3d(0px, -0.0024px, 0px) scale3d(1.00001, 1.00001, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;">
                            </div>
                            <div class="company-content">
                                <div class="content-top company">
                                    <div class="image-wrapper company"><img src="/images/avatar/${avatarUrl}"
                                            alt="${user.fullName}" class="image company"></div>
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
                                        <div class="split-content content-top-company-right"><a
                                                data-w-id="18e4c4a1-e2a5-df93-57f4-c9a8d529c360"
                                                href="${company.websiteUrl}" target="_blank"
                                                class="card-link-wrapper weight-medium w-inline-block">
                                                <div class="card-link" style="color: rgb(0, 97, 255);">Visit Website
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
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div data-duration-in="300" data-duration-out="100" data-current="Company Jobs"
                                    data-easing="ease" class="company-tabs w-tabs">
                                    <div class="company-tabs-menu w-tab-menu" role="tablist">
                                        <a data-w-tab="Company Jobs"
                                            class="company-tab-link first w-inline-block w-tab-link"
                                            id="w-tabs-0-data-w-tab-0" href="/profile" aria-selected="false">
                                            <div>Company jobs</div>
                                        </a>
                                        <a data-w-tab="About Company" class="company-tab-link w-inline-block w-tab-link"
                                            id="w-tabs-0-data-w-tab-1" href="#w-tabs-0-data-w-pane-1"
                                            aria-selected="false">
                                            <div>About the company</div>
                                        </a>
                                        <a data-w-tab="Company Perks"
                                            class="company-tab-link w-inline-block w-tab-link w--current"
                                            id="w-tabs-0-data-w-tab-2" href="/profile/accountsettings"
                                            aria-selected="true">
                                            <div>Account &amp; Settings</div>
                                        </a>
                                    </div>
                                    <div class="company-tabs-content w-tab-content">
                                        <div data-w-tab="Company Perks"
                                            class="company-tab-pane w-tab-pane w--tab-active"
                                            id="w-tabs-0-data-w-pane-2" role="tabpanel"
                                            aria-labelledby="w-tabs-0-data-w-tab-2">
                                            <h2 class="title h3-size company-perks">Job Seeker Profile</h2>
                                            <div class="company-perks-columns w-row">
                                                <div class="company-perks-column-1 w-col w-col-6">
                                                    <div class="company-perks-rich-text w-richtext">
                                                        <ul role="list">
                                                            <li>Full Name: ${user.fullName}</li>
                                                            <li>Phone: ${user.phone}</li>
                                                            <li>Birthday: ${birthday != null ? birthday : 'Not updated'}
                                                            </li>
                                                            <li>Gender: ${gender != null ? (gender == 1 ? 'Nam' :
                                                                (gender == 0 ? 'Nữ' : 'Not updated')) : 'Not updated'}
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="company-perks-column-2 w-col w-col-6">
                                                    <div class="company-perks-rich-text w-richtext">
                                                        <ul role="list">
                                                            <li>Province/City: ${cityName}</li>
                                                            <li>District: ${districtName}</li>
                                                            <li>Address: ${address != null ? address : 'Not updated'}
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <button id="editProfileButton" class="button-primary">Edit Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="editProfileModal" class="modal">
                            <div class="modal-content card post-job-form-card">
                                <span class="close">&times;</span>
                                <p>Edit Job Seeker Profile</p>
                                <form:form id="editProfileForm" action="/updateProfile" method="post"
                                    modelAttribute="jobSeekerProfile">

                                    <div class="w-layout-grid card-post-job-form-grid">
                                        <div class="input-wrapper">
                                            <label for="fullName">Full Name<span
                                                    class="accent-secondary-5">*</span></label>
                                            <form:input path="user.fullName" id="fullName" cssClass="input w-input"
                                                placeholder="What is your name?" value="${user.fullName}" />
                                        </div>
                                        <div class="input-wrapper">
                                            <label for="phone">Phone<span class="accent-secondary-5">*</span></label>
                                            <form:input path="user.phone" id="phone" cssClass="input w-input"
                                                placeholder="What is your phone number?" value="${user.phone}" />
                                        </div>
                                        <div class="input-wrapper">
                                            <label for="birthday">Birthday<span
                                                    class="accent-secondary-5">*</span></label>
                                            <form:input path="birthday" cssClass="input w-input"
                                                placeholder="YYYY-MM-DD" type="date" required="true" />
                                        </div>
                                        <div class="input-wrapper">
                                            <label for="gender">Gender<span class="accent-secondary-5">*</span></label>
                                            <form:select path="gender" cssClass="input w-input">
                                                <option value="" disabled selected>Select your gender</option>
                                                <option value="1">Male</option>
                                                <option value="0">Female</option>
                                            </form:select>
                                        </div>

                                        <div class="input-wrapper">
                                            <label for="city">City<span class="accent-secondary-5">*</span></label>
                                            <form:select path="location.city.id" id="city" cssClass="input w-input"
                                                onchange="fetchDistricts()">
                                                <option value="" disabled selected>Select your city</option>
                                                <form:options items="${citiesProfileUpdate}" itemValue="id"
                                                    itemLabel="name" />
                                            </form:select>
                                        </div>

                                        <div class="input-wrapper">
                                            <label for="district">District<span
                                                    class="accent-secondary-5">*</span></label>
                                            <form:select path="location.district.id" id="district"
                                                cssClass="input w-input">
                                                <option value="" disabled selected>Select your district</option>
                                                <!-- Options will be populated by JavaScript -->
                                            </form:select>
                                        </div>

                                        <div class="input-wrapper">
                                            <label for="address">Address<span
                                                    class="accent-secondary-5">*</span></label>
                                            <input type="text" name="address" class="input w-input"
                                                placeholder="What is your address?" />
                                        </div>
                                    </div>
                                    <br>
                                    <input type="submit" data-wait="Please wait..."
                                        class="button-primary post-job-form-button w-button" value="Save">


                                </form:form>
                            </div>
                        </div>
                        <jsp:include page="../layout/footer.jsp" />
                        <script
                            src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                            type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                            crossorigin="anonymous"></script>
                        <script>
                            // Get the modal
                            var modal = document.getElementById("editProfileModal");
                            // Get the button that opens the modal
                            var btn = document.getElementById("editProfileButton");
                            // Get the <span> element that closes the modal
                            var span = document.getElementsByClassName("close")[0];
                            // When the user clicks the button, open the modal 
                            btn.onclick = function () {
                                modal.style.display = "block";
                            }
                            // When the user clicks on <span> (x), close the modal
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            // When the user clicks anywhere outside of the modal, close it
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        </script>
                        <script>
                            function fetchDistricts() {
                                var cityId = document.getElementById("city").value;
                                var districtSelect = document.getElementById("district");

                                // Clear existing options
                                districtSelect.innerHTML = '<option value="" disabled selected>Select your district</option>';

                                // Fetch districts based on cityId
                                fetch('/api/districts?cityId=' + cityId)
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error('Network response was not ok');
                                        }
                                        return response.json();
                                    })
                                    .then(data => {
                                        data.forEach(district => {
                                            var option = document.createElement("option");
                                            option.value = district.id;
                                            option.text = district.name;
                                            districtSelect.appendChild(option);
                                        });
                                    })
                                    .catch(error => console.error('Error fetching districts:', error));
                            }
                        </script>
            </body>

            </html>