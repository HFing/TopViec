package com.hfing.TopViec.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.JobPost;

@Repository
public interface JobPostRepository extends JpaRepository<JobPost, Long> {
    List<JobPost> findByCompanyId(Long companyId);

    List<JobPost> findByUserId(Long userId);

    List<JobPost> findByIsHotTrueAndStatus(int status);

    @Query("SELECT jp FROM JobPost jp WHERE jp.status = :status AND jp.isHot = false ORDER BY jp.isUrgent DESC")
    List<JobPost> findNonHotJobPostsWithStatusOne(@Param("status") int status);

}
