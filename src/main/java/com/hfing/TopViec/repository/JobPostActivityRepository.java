package com.hfing.TopViec.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.hfing.TopViec.domain.JobPostActivity;
import java.util.List;

@Repository
public interface JobPostActivityRepository extends JpaRepository<JobPostActivity, Long> {
    List<JobPostActivity> findByUserId(Long userId);

    List<JobPostActivity> findByJobPostId(Long jobPostId);

    Optional<JobPostActivity> findByJobPostIdAndUserId(Long jobPostId, Long userId);

    @Query("SELECT status, COUNT(status) FROM JobPostActivity GROUP BY status")
    List<Object[]> countJobPostActivitiesByStatus();
}
