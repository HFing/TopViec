package com.hfing.TopViec.domain;

public class ChatMessage {
    private String sender;
    private String recipient; // Thêm trường recipient
    private String content;
    private String avatar; // Thêm trường avatar
    // Getters and Setters

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecipient() {
        return recipient; // Getter cho recipient
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient; // Setter cho recipient
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAvatar() {
        return avatar; // Getter cho avatar
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar; // Setter cho avatar
    }
}