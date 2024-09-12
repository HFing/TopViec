package com.hfing.TopViec.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import java.util.Date;
import java.math.BigDecimal;

@Entity
@Table(name = "myjob_job_job_post")
public class JobPost {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "create_at")
    private LocalDateTime createAt;

    @Column(name = "update_at")
    private LocalDateTime updateAt;

    @Column(name = "job_name", nullable = false)
    private String jobName;

    @Column(name = "deadline")
    private Date deadline;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "gender")
    private Double gender;

    @Column(name = "job_description", columnDefinition = "LONGTEXT")
    private String jobDescription;

    @Column(name = "job_requirement", columnDefinition = "LONGTEXT")
    private String jobRequirement;

    @Column(name = "benefits_enjoyed", columnDefinition = "LONGTEXT")
    private String benefitsEnjoyed;

    @Column(name = "position")
    private Short position;

    @Column(name = "type_of_workplace")
    private Short typeOfWorkplace;

    @Column(name = "experience")
    private Short experience;

    @Column(name = "academic_level")
    private Short academicLevel;

    @Column(name = "job_type")
    private Short jobType;

    @Column(name = "salary_min", precision = 12, scale = 2)
    private BigDecimal salaryMin;

    @Column(name = "salary_max", precision = 12, scale = 2)
    private BigDecimal salaryMax;

    @Column(name = "is_hot", columnDefinition = "TINYINT(1) DEFAULT 0")
    private Boolean isHot;

    @Column(name = "is_urgent", columnDefinition = "TINYINT(1) DEFAULT 0")
    private Boolean isUrgent;

    @Column(name = "contact_person_name", length = 100)
    private String contactPersonName;

    @Column(name = "contact_person_phone", length = 15)
    private String contactPersonPhone;

    @Column(name = "contact_person_email", length = 100)
    private String contactPersonEmail;

    @Column(name = "views", columnDefinition = "BIGINT DEFAULT 0")
    private Long views;

    @Column(name = "shares", columnDefinition = "BIGINT DEFAULT 0")
    private Long shares;

    @ManyToOne
    @JoinColumn(name = "career_id")
    private CommonCareer career;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private InfoCompany company;

    @ManyToOne
    @JoinColumn(name = "location_id")
    private CommonLocation location;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "status", columnDefinition = "TINYINT(1) DEFAULT 1")
    private Boolean status;

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

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getGender() {
        return gender;
    }

    public void setGender(Double gender) {
        this.gender = gender;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getJobRequirement() {
        return jobRequirement;
    }

    public void setJobRequirement(String jobRequirement) {
        this.jobRequirement = jobRequirement;
    }

    public String getBenefitsEnjoyed() {
        return benefitsEnjoyed;
    }

    public void setBenefitsEnjoyed(String benefitsEnjoyed) {
        this.benefitsEnjoyed = benefitsEnjoyed;
    }

    public Short getPosition() {
        return position;
    }

    public void setPosition(Short position) {
        this.position = position;
    }

    public Short getTypeOfWorkplace() {
        return typeOfWorkplace;
    }

    public void setTypeOfWorkplace(Short typeOfWorkplace) {
        this.typeOfWorkplace = typeOfWorkplace;
    }

    public Short getExperience() {
        return experience;
    }

    public void setExperience(Short experience) {
        this.experience = experience;
    }

    public Short getAcademicLevel() {
        return academicLevel;
    }

    public void setAcademicLevel(Short academicLevel) {
        this.academicLevel = academicLevel;
    }

    public Short getJobType() {
        return jobType;
    }

    public void setJobType(Short jobType) {
        this.jobType = jobType;
    }

    public BigDecimal getSalaryMin() {
        return salaryMin;
    }

    public void setSalaryMin(BigDecimal salaryMin) {
        this.salaryMin = salaryMin;
    }

    public BigDecimal getSalaryMax() {
        return salaryMax;
    }

    public void setSalaryMax(BigDecimal salaryMax) {
        this.salaryMax = salaryMax;
    }

    public Boolean getIsHot() {
        return isHot;
    }

    public void setIsHot(Boolean isHot) {
        this.isHot = isHot;
    }

    public Boolean getIsUrgent() {
        return isUrgent;
    }

    public void setIsUrgent(Boolean isUrgent) {
        this.isUrgent = isUrgent;
    }

    public String getContactPersonName() {
        return contactPersonName;
    }

    public void setContactPersonName(String contactPersonName) {
        this.contactPersonName = contactPersonName;
    }

    public String getContactPersonPhone() {
        return contactPersonPhone;
    }

    public void setContactPersonPhone(String contactPersonPhone) {
        this.contactPersonPhone = contactPersonPhone;
    }

    public String getContactPersonEmail() {
        return contactPersonEmail;
    }

    public void setContactPersonEmail(String contactPersonEmail) {
        this.contactPersonEmail = contactPersonEmail;
    }

    public Long getViews() {
        return views;
    }

    public void setViews(Long views) {
        this.views = views;
    }

    public Long getShares() {
        return shares;
    }

    public void setShares(Long shares) {
        this.shares = shares;
    }

    public CommonCareer getCareer() {
        return career;
    }

    public void setCareer(CommonCareer career) {
        this.career = career;
    }

    public InfoCompany getCompany() {
        return company;
    }

    public void setCompany(InfoCompany company) {
        this.company = company;
    }

    public CommonLocation getLocation() {
        return location;
    }

    public void setLocation(CommonLocation location) {
        this.location = location;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

}