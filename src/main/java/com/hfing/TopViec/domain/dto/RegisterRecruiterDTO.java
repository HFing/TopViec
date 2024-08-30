package com.hfing.TopViec.domain.dto;

import java.sql.Date;

import com.hfing.TopViec.service.validator.RegisterChecked;

@RegisterChecked
public class RegisterRecruiterDTO {
    private String fullName;
    private String email;
    private String password;
    private String confirmPassword;
    private String companyName;
    private String companyEmail;
    private String companyPhone;
    private String companyTax;
    private Date establishedDate;
    private String fieldOperation;
    private String companyWebsite;
    private Long cityId;
    private Long districtId;
    private Long companySize;
    private String companyDescription;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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

    public String getCompanyTax() {
        return companyTax;
    }

    public void setCompanyTax(String companyTax) {
        this.companyTax = companyTax;
    }

    public Date getEstablishedDate() {
        return establishedDate;
    }

    public void setEstablishedDate(Date establishedDate) {
        this.establishedDate = establishedDate;
    }

    public String getFieldOperation() {
        return fieldOperation;
    }

    public void setFieldOperation(String fieldOperation) {
        this.fieldOperation = fieldOperation;
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    public Long getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Long districtId) {
        this.districtId = districtId;
    }

    public String getCompanyDescription() {
        return companyDescription;
    }

    public void setCompanyDescription(String companyDescription) {
        this.companyDescription = companyDescription;
    }

    public Long getCompanySize() {
        return companySize;
    }

    public void setCompanySize(Long companySize) {
        this.companySize = companySize;
    }

}