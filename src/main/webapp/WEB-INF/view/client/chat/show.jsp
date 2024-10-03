<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Chat Interface</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <link rel="stylesheet" href="/client/css/style.css">
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #fff;
                        height: 100vh;
                    }

                    .section.chat {
                        width: 100%;
                        padding: 0px;
                        box-sizing: border-box;
                    }

                    .chat-wrapper {
                        margin: auto;
                        background-color: #fff;
                        border-left: 1px solid #ddd;
                        border-right: 1px solid #ddd;
                        height: 100vh;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    }

                    .chat-columns {
                        padding: 0px;
                    }

                    .column {
                        padding: 20px;
                    }

                    .users-list,
                    .companies-list {
                        border: 1px solid #ddd;
                    }

                    .list-group-item {
                        border: none;
                        padding: 10px;
                    }

                    .list-group-item img {
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        margin-right: 10px;
                    }

                    .chat-box {
                        border: 1px solid #ddd;
                        padding: 20px;

                    }

                    .chat-box-container {
                        display: none;
                        /* Ẩn chat box ban đầu */
                    }

                    .chat-box-header {
                        font-size: 24px;
                        font-weight: bold;
                        margin-bottom: 20px;
                        color: #333;
                        display: flex;
                        align-items: center;
                        padding: 15px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    }

                    .chat-box-header img {
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        margin-right: 10px;
                    }

                    .chat-box-header span {
                        font-size: 18px;
                        font-weight: normal;
                        color: #555;
                    }

                    .chat-messages {
                        padding: 20px;
                        overflow-y: auto;
                        max-height: 500px;
                    }

                    .form-control {
                        border-radius: 20px;
                        padding: 10px;
                    }

                    .send-button {
                        border-radius: 20px;
                        padding: 10px 20px;
                    }

                    .message-left {
                        background-color: #f1f1f1;
                        padding: 10px;
                        border-radius: 20px;
                        margin-bottom: 10px;
                        text-align: left;
                        width: 50%;
                        float: left;
                        clear: both;
                    }

                    .message-left img {
                        width: 40px;
                        height: 40px;
                        border-radius: 50%;
                        margin-right: 10px;
                    }

                    .message-right {
                        background-color: #e9ecef;
                        padding: 10px;
                        border-radius: 20px;
                        margin-bottom: 10px;
                        text-align: right;
                        width: 50%;
                        float: right;
                        clear: both;
                    }

                    .message-right img {
                        width: 40px;
                        height: 40px;
                        border-radius: 50%;
                        margin-left: auto;
                        margin-right: 10px;
                    }
                </style>
            </head>

            <body>
                <div class="section chat">
                    <div class="chat-wrapper">
                        <div class="row chat-columns">
                            <div class="col-md-4 column users-list">
                                <h2 class="title">Users List</h2>
                                <ul class="list-group">
                                    <c:forEach var="user" items="${users}">
                                        <li class="list-group-item d-flex align-items-center"
                                            onclick="loadChatHistory('${user}')">
                                            <img src="/images/avatar/default_avatar.jpg" alt="${user} Avatar"
                                                class="rounded-circle">${user}
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="col-md-4 column chat-box">
                                <div class="chat-box-container">
                                    <h2 class="title">Chat Box</h2>
                                    <div class="chat-box-header">
                                        <img src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
                                            alt="Sender Avatar" class="avatar rounded-circle">
                                        <span class="username">Facebook</span>
                                    </div>
                                    <div class="chat-messages">

                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="text" placeholder="Type a message..."
                                            class="form-control chat-input">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary send-button" type="button"
                                                onclick="sendMessage()">Send</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 column companies-list">
                                <h2 class="title">Danh sách người sẽ nhắn được:</h2>
                                <ul class="list-group">
                                    <c:if test="${not empty appliedCompanies}">
                                        <c:forEach var="company" items="${appliedCompanies}">
                                            <li class="list-group-item d-flex align-items-center"
                                                style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                                                <img src="/images/company/${company.companyImageUrl}"
                                                    alt="${company.companyImageUrl} Avatar" class="rounded-circle">
                                                ${company.user.fullName} - Company: ${company.companyName}
                                                <button class="btn btn-primary ml-auto"
                                                    onclick="selectRecipient('${company.user.fullName}', '${company.companyImageUrl}')">Nhắn
                                                    tin</button>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty appliedCompanies and not empty applicants}">
                                        <c:forEach var="applicant" items="${applicants}">
                                            <li class="list-group-item d-flex align-items-center"
                                                style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-top: 10px;">
                                                <img src="/images/avatar/${applicant.user.avatarUrl}"
                                                    alt="${applicant.user.fullName} Avatar" class="rounded-circle">
                                                ${applicant.user.fullName}
                                                <button class="btn btn-primary ml-auto"
                                                    onclick="selectRecipient('${applicant.user.fullName}', '${applicant.user.avatarUrl}')">Nhắn
                                                    tin</button>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty appliedCompanies and empty applicants}">
                                        <li class="list-group-item" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">No
                                            companies or applicants available.</li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="bg chat"></div>
                </div>


                <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

                <script
                    src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
                    type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                    crossorigin="anonymous"></script>

                <script>
                    function toggleFaq(element) {
                        var faqBottom = element.nextElementSibling;
                        if (faqBottom.style.display === "none" || faqBottom.style.display === "") {
                            faqBottom.style.display = "block";
                            faqBottom.style.height = "auto";
                            faqBottom.style.opacity = "1";
                            faqBottom.style.transform = "translate3d(0px, 0px, 0px) scale3d(1, 1, 1)";
                        } else {
                            faqBottom.style.display = "none";
                            faqBottom.style.height = "0px";
                            faqBottom.style.opacity = "0";
                            faqBottom.style.transform = "translate3d(0px, 150%, 0px) scale3d(0.95, 0.95, 1)";
                        }
                    }

                    var stompClient = null;



                    var currentRecipient = {
                        fullName: '',
                        avatar: ''
                    };

                    function connect() {
                        var socket = new SockJS('/chat'); // Kết nối đến endpoint
                        stompClient = Stomp.over(socket);
                        stompClient.connect({}, function (frame) {
                            console.log('Connected: ' + frame);
                            stompClient.subscribe('/topic/messages', function (message) {
                                showMessage(JSON.parse(message.body)); // Hiển thị tin nhắn khi nhận
                            });
                            stompClient.subscribe('/user/' + currentRecipient.fullName + '/topic/messages', function (message) {
                                showMessage(JSON.parse(message.body)); // Hiển thị tin nhắn khi nhận
                            });
                        });
                    }

                    function selectRecipient(name, avatar) {
                        loadChatHistory(name);
                        console.log(name, avatar)
                        currentRecipient.fullName = name;
                        currentRecipient.avatar = avatar;
                        document.querySelector('.chat-box-header .username').innerText = name; // Cập nhật tên người nhận
                        document.querySelector('.chat-box-header img').src = '/images/avatar/' + avatar; // Cập nhật avatar người nhận
                        document.querySelector('.chat-messages').innerHTML = ''; // Xóa tin nhắn cũ
                        document.querySelector('.chat-box-container').style.display = 'block'; // Hiển thị chat box
                    }


                    var currentUser = {
                        fullName: '${currentUser.fullName}', // Lấy tên người dùng hiện tại từ mô hình
                        avatar: '${currentUser.avatarUrl}', // Lấy avatar người dùng hiện tại từ mô hình
                        role: '${currentUser.roleName}' // Lấy role người dùng hiện tại từ mô hình
                    };

                    function sendMessage() {
                        var message = {
                            sender: currentUser.fullName,
                            recipient: currentRecipient.fullName,
                            content: document.querySelector('.chat-input').value,
                            avatar: currentUser.avatar
                        };
                        console.log("Sending message:", message); // Kiểm tra nội dung tin nhắn
                        stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); // Gửi tin nhắn
                        document.querySelector('.chat-input').value = ''; // Xóa input
                    }

                    function showMessage(message) {
                        console.log("Received message:", message); // Log the received message
                        console.log("currentUser:", currentUser); // Log the received message
                        document.querySelector('.chat-box-container').style.display = 'block';
                        var chatMessages = document.querySelector('.chat-messages');
                        var messageDiv;
                        var avatarPath = (currentUser.role === 'RECRUITER') ? '/images/avatar/' : '/images/avatar/';

                        // Kiểm tra xem tin nhắn có phải từ người dùng hiện tại không
                        if (message.sender === currentUser.fullName) { // So sánh với tên người dùng hiện tại
                            messageDiv = '<div class="message-right"><img src="' + avatarPath + "default_avatar.jpg" + '" alt="Sender Avatar" class="rounded-circle">' + message.content + '<span>' + new Date().toLocaleTimeString() + '</span></div>';
                        } else if (message.recipient === currentUser.fullName) {
                            messageDiv = '<div class="message-left"><img src="' + avatarPath + "default_avatar.jpg" + '" alt="Receiver Avatar" class="rounded-circle">' + message.content + '<span>' + new Date().toLocaleTimeString() + '</span></div>';
                        }

                        chatMessages.innerHTML += messageDiv; // Hiển thị tin nhắn
                    }

                    function loadChatHistory(user) {
                        if (!user) {
                            console.error("Recipient is not defined");
                            return;
                        }

                        // Gửi request POST với body là JSON
                        fetch('/chat/history', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                sender: currentUser.fullName,
                                recipient: user
                            })
                        })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                document.querySelector('.chat-messages').innerHTML = ''; // Xóa tin nhắn cũ
                                data.forEach(message => {
                                    showMessage(message); // Hiển thị tin nhắn
                                });
                                currentRecipient.fullName = user; // Cập nhật người nhận
                            })
                            .catch(error => {
                                console.error('There was a problem with the fetch operation:', error);
                            });
                    }






                    connect(); // Kết nối khi trang được tải
                </script>
            </body>


            </html>

            </rewritten_file>