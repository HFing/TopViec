package com.hfing.TopViec.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.JobPost;

@Repository
public interface JobPostRepository extends JpaRepository<JobPost, Long> {
    List<JobPost> findByCompanyId(Long companyId);

    List<JobPost> findByUserId(Long userId);

    List<JobPost> findByIsHotTrue();
}
