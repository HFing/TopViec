package com.hfing.TopViec.domain;

public class ChatRequest {
    private String sender;
    private String recipient;

    // Constructor
    public ChatRequest() {
    }

    public ChatRequest(String sender, String recipient) {
        this.sender = sender;
        this.recipient = recipient;
    }

    // Getters and Setters
    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }
}