package com.hfing.TopViec.domain;

import java.time.LocalDateTime;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "common_career")
public class CommonCareer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime createAt;
    private LocalDateTime updateAt;
    private String name;

    @OneToMany(mappedBy = "career")
    @JsonIgnore
    private Set<InfoResume> resumes;

    @OneToMany(mappedBy = "career")
    @JsonIgnore
    private Set<JobPost> jobPosts;

    @OneToMany(mappedBy = "career", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private Set<Notification> notifications;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public LocalDateTime getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(LocalDateTime updateAt) {
        this.updateAt = updateAt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<InfoResume> getResumes() {
        return resumes;
    }

    public void setResumes(Set<InfoResume> resumes) {
        this.resumes = resumes;
    }

    public Set<JobPost> getJobPosts() {
        return jobPosts;
    }

    public void setJobPosts(Set<JobPost> jobPosts) {
        this.jobPosts = jobPosts;
    }

    public Set<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(Set<Notification> notifications) {
        this.notifications = notifications;
    }
}