package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoEducationDetail;

@Repository
public interface InfoEducationDetailRepository extends JpaRepository<InfoEducationDetail, Long> {
}
