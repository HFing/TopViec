package com.hfing.TopViec.domain;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
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

    @Column(name = "company_image_url", length = 255)
    private String companyImageUrl;

    @Column(name = "company_cover_image_url", length = 255)
    private String companyCoverImageUrl;

    @Column(name = "facebook_url", length = 255)
    private String facebookUrl;

    @Column(name = "youtube_url", length = 255)
    private String youtubeUrl;

    @Column(name = "linkedin_url", length = 255)
    private String linkedinUrl;

    @Column(name = "company_email", length = 255)
    private String companyEmail;

    @Column(name = "company_phone", length = 255)
    private String companyPhone;

    @Column(name = "website_url", length = 255)
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
}
