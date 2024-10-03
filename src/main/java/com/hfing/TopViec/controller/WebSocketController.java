package com.hfing.TopViec.controller;

import com.hfing.TopViec.domain.ChatMessage;
import com.hfing.TopViec.domain.ChatHistory;
import com.hfing.TopViec.repository.ChatHistoryRepository;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;

@Controller
public class WebSocketController {

    private final SimpMessagingTemplate messagingTemplate;
    private final ChatHistoryRepository chatHistoryRepository;

    public WebSocketController(SimpMessagingTemplate messagingTemplate, ChatHistoryRepository chatHistoryRepository) {
        this.messagingTemplate = messagingTemplate;
        this.chatHistoryRepository = chatHistoryRepository;
    }

    @MessageMapping("/sendMessage")
    public void sendMessage(ChatMessage message) {
        // Lưu tin nhắn vào lịch sử
        ChatHistory chatHistory = new ChatHistory();
        chatHistory.setSender(message.getSender());
        chatHistory.setRecipient(message.getRecipient());
        chatHistory.setContent(message.getContent());
        chatHistory.setTimestamp(LocalDateTime.now());
        chatHistoryRepository.save(chatHistory);

        messagingTemplate.convertAndSendToUser(message.getRecipient(), "/topic/messages", message);
        messagingTemplate.convertAndSend("/topic/messages", message);
    }
}