package com.hfing.TopViec.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoCompanyImage;

@Repository
public interface InfoCompanyImageRepository extends JpaRepository<InfoCompanyImage, Long> {
    List<InfoCompanyImage> findByCompany(InfoCompany company);

}
