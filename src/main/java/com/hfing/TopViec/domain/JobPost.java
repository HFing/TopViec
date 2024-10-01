package com.hfing.TopViec.domain;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;

import java.math.BigDecimal;

@Entity
@Table(name = "job_post")
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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deadline;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "gender")
    private int gender;

    @Column(name = "job_description", columnDefinition = "LONGTEXT")
    private String jobDescription;

    @Column(name = "job_requirement", columnDefinition = "LONGTEXT")
    private String jobRequirement;

    @Column(name = "benefits_enjoyed", columnDefinition = "LONGTEXT")
    private String benefitsEnjoyed;

    @Enumerated(EnumType.STRING)
    @Column(name = "position")
    private Position position;

    @Enumerated(EnumType.STRING)
    @Column(name = "type_of_workplace")
    private TypeOfWorkplace typeOfWorkplace;

    @Enumerated(EnumType.STRING)
    @Column(name = "experience")
    private Experience experience;

    @Enumerated(EnumType.STRING)
    @Column(name = "academic_level")
    private AcademicLevel academicLevel;

    @Enumerated(EnumType.STRING)
    @Column(name = "job_type")
    private JobType jobType;

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

    @Column(name = "status")
    private int status;

    @OneToMany(mappedBy = "jobPost", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<JobPostActivity> jobPostActivities;

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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
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

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public TypeOfWorkplace getTypeOfWorkplace() {
        return typeOfWorkplace;
    }

    public void setTypeOfWorkplace(TypeOfWorkplace typeOfWorkplace) {
        this.typeOfWorkplace = typeOfWorkplace;
    }

    public Experience getExperience() {
        return experience;
    }

    public void setExperience(Experience experience) {
        this.experience = experience;
    }

    public AcademicLevel getAcademicLevel() {
        return academicLevel;
    }

    public void setAcademicLevel(AcademicLevel academicLevel) {
        this.academicLevel = academicLevel;
    }

    public JobType getJobType() {
        return jobType;
    }

    public void setJobType(JobType jobType) {
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<JobPostActivity> getJobPostActivities() {
        return jobPostActivities;
    }

    public void setJobPostActivities(List<JobPostActivity> jobPostActivities) {
        this.jobPostActivities = jobPostActivities;
    }

}