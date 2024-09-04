package com.hfing.TopViec.domain;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "info_company")
public class InfoCompany {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "create_at")
    private Date createAt;

    @Column(name = "update_at")
    private Date updateAt;

    @Column(name = "company_name", length = 255)
    private String companyName;

    @Column(name = "company_image_url")
    private String companyImageUrl;

    @Column(name = "company_cover_image_url")
    private String companyCoverImageUrl;

    @Column(name = "facebook_url")
    private String facebookUrl;

    @Column(name = "youtube_url")
    private String youtubeUrl;

    @Column(name = "linkedin_url")
    private String linkedinUrl;

    @Column(name = "company_email", length = 255)
    private String companyEmail;

    @Column(name = "company_phone", length = 255)
    private String companyPhone;

    @Column(name = "website_url")
    private String websiteUrl;

    @Column(name = "tax_code", length = 255)
    private String taxCode;

    @Column(name = "since")
    private Date since;

    @Column(name = "field_operation", length = 255)
    private String fieldOperation;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @ManyToOne
    @JoinColumn(name = "employee_size_id")
    private EmployeeSize employeeSize;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "location_id")
    private CommonLocation location;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "fk_user_info_company"))
    private User user;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyImageUrl() {
        return companyImageUrl;
    }

    public void setCompanyImageUrl(String companyImageUrl) {
        this.companyImageUrl = companyImageUrl;
    }

    public String getCompanyCoverImageUrl() {
        return companyCoverImageUrl;
    }

    public void setCompanyCoverImageUrl(String companyCoverImageUrl) {
        this.companyCoverImageUrl = companyCoverImageUrl;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
    }

    public String getYoutubeUrl() {
        return youtubeUrl;
    }

    public void setYoutubeUrl(String youtubeUrl) {
        this.youtubeUrl = youtubeUrl;
    }

    public String getLinkedinUrl() {
        return linkedinUrl;
    }

    public void setLinkedinUrl(String linkedinUrl) {
        this.linkedinUrl = linkedinUrl;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
    }

    public Date getSince() {
        return since;
    }

    public void setSince(Date since) {
        this.since = since;
    }

    public String getFieldOperation() {
        return fieldOperation;
    }

    public void setFieldOperation(String fieldOperation) {
        this.fieldOperation = fieldOperation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public EmployeeSize getEmployeeSize() {
        return employeeSize;
    }

    public void setEmployeeSize(EmployeeSize employeeSize) {
        this.employeeSize = employeeSize;
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

}
