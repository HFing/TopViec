document.addEventListener('DOMContentLoaded', function () {
    const apiKey = 'sk-MHWxdWXl8J4MOcrE91630c16292746CaA356Aa376667AdC1';  // Thay bằng API key của bạn
    const API_URL = 'https://yescale.one/v1/chat/completions';

    const chatbotToggler = document.querySelector(".chatbot-toggler");
    const closeBtn = document.querySelector(".close-btn");
    const chatbox = document.querySelector(".chatbox");
    const chatInput = document.querySelector(".chat-input textarea");
    const sendChatBtn = document.getElementById("send-btn");
    const fileInput = document.getElementById('fileInput');

    let userMessage = null; // Biến để lưu trữ tin nhắn của người dùng
    let fileContent = null; // Biến để lưu trữ nội dung file

    chatbotToggler.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));
    closeBtn.addEventListener("click", () => document.body.classList.remove("show-chatbot"));
    sendChatBtn.addEventListener("click", handleChat);

    fileInput.addEventListener('change', function () {
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                fileContent = e.target.result;
                localStorage.setItem('fileContent', fileContent);  // Lưu nội dung file vào local storage
            };
            reader.readAsText(file);
        }
    });

    async function handleChat() {
        userMessage = chatInput.value.trim();
        if (!userMessage) return;

        // Tạo và thêm tin nhắn của người dùng vào chatbox
        const userChatLi = createChatLi(userMessage, "outgoing");
        chatbox.appendChild(userChatLi);
        chatbox.scrollTo(0, chatbox.scrollHeight);

        // Xóa nội dung trong trường nhập liệu ngay lập tức
        chatInput.value = '';

        // Thêm tin nhắn "Thinking..." vào chatbox
        const thinkingLi = createChatLi("Thinking...", "incoming");
        chatbox.appendChild(thinkingLi);
        chatbox.scrollTo(0, chatbox.scrollHeight);

        // Lấy nội dung file từ local storage nếu chưa có
        if (!fileContent) {
            fileContent = localStorage.getItem('fileContent');
        }

        // Gọi hàm generateCompletion để lấy phản hồi từ GPT
        await generateCompletion(userMessage, fileContent, thinkingLi);
    }

    async function generateCompletion(question, fileContent, thinkingLi) {
        const content = `Question: ${question}\nFile Content: ${fileContent}`;

        try {
            const data = {
                model: 'gpt-3.5-turbo',
                messages: [{
                    role: "user",
                    content: content
                }],
                max_tokens: 150,  // Giới hạn số token cho mỗi câu trả lời
                stop: ["\n"]  // Đảm bảo câu trả lời không liên quan đến câu trả lời trước
            };

            const response = await fetch(API_URL, {
                method: 'POST',
                headers: {
                    'Authorization': 'Bearer ' + apiKey,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data),
            });

            if (!response.ok) {
                console.log('HTTP error', response.status);
                const errorDetail = await response.text();
                console.log('Error response body:', errorDetail);
                thinkingLi.querySelector("p").textContent = errorDetail;  // Hiển thị thông báo lỗi trong chat
            } else {
                const result = await response.json();
                thinkingLi.querySelector("p").textContent = "";  // Xóa tin nhắn "Thinking..."
                typeWriter('incoming', result.choices[0].message.content.trim(), thinkingLi);  // Hiển thị phản hồi của GPT trong chat với hiệu ứng gõ chữ
                console.log(result);
            }
        } catch (error) {
            console.error('Fetch error:', error);
            thinkingLi.querySelector("p").textContent = 'Fetch error: ' + error.message;  // Hiển thị lỗi fetch trong chat
        }
    }

    function createChatLi(message, className) {
        // Tạo phần tử <li> cho chat với thông điệp và className được truyền vào
        const chatLi = document.createElement("li");
        chatLi.classList.add("chat", `${className}`);
        let chatContent = className === "outgoing" ? `<p></p>` : `<span class="material-symbols-outlined">smart_toy</span><p></p>`;
        chatLi.innerHTML = chatContent;
        chatLi.querySelector("p").textContent = message;
        return chatLi; // trả về phần tử <li> của chat
    }

    function typeWriter(sender, text, messageDiv) {
        const chatBody = document.querySelector('.chatbox');
        messageDiv.className = `chat ${sender}`;
        chatBody.scrollTop = chatBody.scrollHeight;  // Cuộn xuống cuối

        let i = 0;
        function type() {
            if (i < text.length) {
                messageDiv.querySelector("p").textContent += text.charAt(i);
                i++;
                setTimeout(type, 30);  // Điều chỉnh tốc độ gõ chữ ở đây (tính bằng mili giây)
                chatBody.scrollTop = chatBody.scrollHeight;  // Giữ cuộn xuống cuối
            }
        }

        type();
    }
});