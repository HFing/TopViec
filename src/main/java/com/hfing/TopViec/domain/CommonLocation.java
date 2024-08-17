package com.hfing.TopViec.domain;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "common_location")
public class CommonLocation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city_id")
    private CommonCity city;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "district_id")
    private CommonDistrict district;

    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<InfoCompany> companies;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CommonCity getCity() {
        return city;
    }

    public void setCity(CommonCity city) {
        this.city = city;
    }

    public CommonDistrict getDistrict() {
        return district;
    }

    public void setDistrict(CommonDistrict district) {
        this.district = district;
    }

    @Override
    public String toString() {
        return "CommonLocation [id=" + id +
                ", city=" + (city != null ? city.getName() : "null") +
                ", district=" + (district != null ? district.getName() : "null") + "]";
    }

}
