package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoCompany;

@Repository
public interface InfoCompanyRepository extends JpaRepository<InfoCompany, Long> {

}
