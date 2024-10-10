package com.hfing.TopViec.domain;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.text.NumberFormat;

@Entity
@Table(name = "info_resume")
public class InfoResume {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime createAt;
    private LocalDateTime updateAt;
    private String title;
    private String description;
    private BigDecimal salaryMin;
    private BigDecimal salaryMax;

    @Enumerated(EnumType.STRING)
    private Position position;

    @Enumerated(EnumType.STRING)
    private Experience experience;

    @Enumerated(EnumType.STRING)
    private AcademicLevel academicLevel;

    @Enumerated(EnumType.STRING)
    private TypeOfWorkplace typeOfWorkplace;

    @Enumerated(EnumType.STRING)
    private JobType jobType;

    private Boolean isActive;
    private String fileUrl;
    private String type;

    @ManyToOne
    @JoinColumn(name = "career_id")
    private CommonCareer career;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private CommonCity city;

    @OneToOne
    @JoinColumn(name = "job_seeker_profile_id")
    private JobSeekerProfile jobSeekerProfile;

    @OneToMany(mappedBy = "resume", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<InfoExperienceDetail> experienceDetails = new ArrayList<>();

    @OneToMany(mappedBy = "resume", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<InfoLanguageSkill> languageSkills = new ArrayList<>();

    @OneToMany(mappedBy = "resume", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<InfoEducationDetail> educationDetails = new ArrayList<>();

    @OneToMany(mappedBy = "resume", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<InfoCertificate> certificates = new ArrayList<>();

    @OneToMany(mappedBy = "resume", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<InfoAdvancedSkill> advancedSkills = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "resume", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<InfoResumeSaved> savedByCompanies;

    public String getFormattedUpdateAt() {
        if (updateAt == null) {
            return "Not available";
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return updateAt.format(formatter);
    }

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
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

    public TypeOfWorkplace getTypeOfWorkplace() {
        return typeOfWorkplace;
    }

    public void setTypeOfWorkplace(TypeOfWorkplace typeOfWorkplace) {
        this.typeOfWorkplace = typeOfWorkplace;
    }

    public JobType getJobType() {
        return jobType;
    }

    public void setJobType(JobType jobType) {
        this.jobType = jobType;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public CommonCareer getCareer() {
        return career;
    }

    public void setCareer(CommonCareer career) {
        this.career = career;
    }

    public CommonCity getCity() {
        return city;
    }

    public void setCity(CommonCity city) {
        this.city = city;
    }

    public JobSeekerProfile getJobSeekerProfile() {
        return jobSeekerProfile;
    }

    public void setJobSeekerProfile(JobSeekerProfile jobSeekerProfile) {
        this.jobSeekerProfile = jobSeekerProfile;
    }

    public List<InfoExperienceDetail> getExperienceDetails() {
        return experienceDetails;
    }

    public void setExperienceDetails(List<InfoExperienceDetail> experienceDetails) {
        this.experienceDetails = experienceDetails;
    }

    public List<InfoLanguageSkill> getLanguageSkills() {
        return languageSkills;
    }

    public void setLanguageSkills(List<InfoLanguageSkill> languageSkills) {
        this.languageSkills = languageSkills;
    }

    public List<InfoEducationDetail> getEducationDetails() {
        return educationDetails;
    }

    public void setEducationDetails(List<InfoEducationDetail> educationDetails) {
        this.educationDetails = educationDetails;
    }

    public List<InfoCertificate> getCertificates() {
        return certificates;
    }

    public void setCertificates(List<InfoCertificate> certificates) {
        this.certificates = certificates;
    }

    public List<InfoAdvancedSkill> getAdvancedSkills() {
        return advancedSkills;
    }

    public void setAdvancedSkills(List<InfoAdvancedSkill> advancedSkills) {
        this.advancedSkills = advancedSkills;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<InfoResumeSaved> getSavedByCompanies() {
        return savedByCompanies;
    }

    public void setSavedByCompanies(List<InfoResumeSaved> savedByCompanies) {
        this.savedByCompanies = savedByCompanies;
    }

    public String getFormattedSalary() {
        NumberFormat formatter = NumberFormat.getNumberInstance(Locale.US);
        formatter.setMaximumFractionDigits(0);
        String formattedMin = formatter.format(salaryMin.divide(BigDecimal.valueOf(1000000)));
        String formattedMax = formatter.format(salaryMax.divide(BigDecimal.valueOf(1000000)));
        return String.format("%s - %s Million", formattedMin, formattedMax);
    }

    public String getFormattedSalaryMax() {
        if (salaryMax == null) {
            return "Not available";
        }
        NumberFormat formatter = NumberFormat.getNumberInstance(Locale.US);
        formatter.setMaximumFractionDigits(0);
        return formatter.format(salaryMax.divide(BigDecimal.valueOf(1000000))) + " Million";
    }

}
