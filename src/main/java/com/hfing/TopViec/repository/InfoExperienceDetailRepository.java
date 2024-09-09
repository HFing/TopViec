package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoExperienceDetail;

@Repository
public interface InfoExperienceDetailRepository extends JpaRepository<InfoExperienceDetail, Long> {
}
