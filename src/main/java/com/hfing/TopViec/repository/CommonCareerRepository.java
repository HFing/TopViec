package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.CommonCareer;

@Repository
public interface CommonCareerRepository extends JpaRepository<CommonCareer, Long> {
}
