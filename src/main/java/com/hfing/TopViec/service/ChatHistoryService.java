package com.hfing.TopViec.service;

import com.hfing.TopViec.domain.ChatHistory;
import com.hfing.TopViec.repository.ChatHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatHistoryService {

    private final ChatHistoryRepository chatHistoryRepository;

    @Autowired
    public ChatHistoryService(ChatHistoryRepository chatHistoryRepository) {
        this.chatHistoryRepository = chatHistoryRepository;
    }

    // Lấy lịch sử chat giữa hai người dùng
    public List<ChatHistory> getChatHistory(String sender, String recipient) {
        return chatHistoryRepository.findAllMessagesBetweenUsers(sender, recipient);
    }

    // Lấy danh sách người dùng đã nhắn tin
    public List<String> getDistinctUsers(String currentUser) {
        return chatHistoryRepository.findDistinctUsers(currentUser);
    }
}