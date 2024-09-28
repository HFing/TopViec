package com.hfing.TopViec.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.InfoResumeSaved;

@Repository
public interface InfoResumeSavedRepository extends JpaRepository<InfoResumeSaved, Long> {
    boolean existsByCompanyAndResume(InfoCompany company, InfoResume resume);

    void deleteByCompanyAndResume(InfoCompany company, InfoResume resume);

    InfoResumeSaved findByCompanyAndResume(InfoCompany company, InfoResume resume);

    List<InfoResumeSaved> findByCompany(InfoCompany company);
}