package com.hfing.TopViec.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "info_resume_saved")
public class InfoResumeSaved {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
    private InfoCompany company;

    @ManyToOne
    @JoinColumn(name = "resume_id", nullable = false)
    private InfoResume resume;

    @Column(name = "saved_at")
    private Date savedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public InfoCompany getCompany() {
        return company;
    }

    public void setCompany(InfoCompany company) {
        this.company = company;
    }

    public InfoResume getResume() {
        return resume;
    }

    public void setResume(InfoResume resume) {
        this.resume = resume;
    }

    public Date getSavedAt() {
        return savedAt;
    }

    public void setSavedAt(Date savedAt) {
        this.savedAt = savedAt;
    }

}
