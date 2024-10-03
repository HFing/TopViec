package com.hfing.TopViec.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.JobPostActivity;
import java.util.List;

@Repository
public interface JobPostActivityRepository extends JpaRepository<JobPostActivity, Long> {
    List<JobPostActivity> findByUserId(Long userId);

    List<JobPostActivity> findByJobPostId(Long jobPostId);

    Optional<JobPostActivity> findByJobPostIdAndUserId(Long jobPostId, Long userId);

    @Query("SELECT status, COUNT(status) FROM JobPostActivity GROUP BY status")
    List<Object[]> countJobPostActivitiesByStatus();

    @Query("SELECT MONTH(j.createAt) as month, COUNT(j.id) as count FROM JobPostActivity j WHERE j.jobPost.company.id = :companyId GROUP BY MONTH(j.createAt)")
    List<Object[]> findMonthlyApplicantCountsByCompanyId(@Param("companyId") Long companyId);

    @Query("SELECT j.status, COUNT(j.id) FROM JobPostActivity j WHERE j.jobPost.company.id = :companyId GROUP BY j.status")
    List<Object[]> findApplicantCountsByStatusAndCompanyId(@Param("companyId") Long companyId);

    long countByJobPostCompanyId(Long companyId);

    @Query("SELECT DISTINCT i FROM JobPostActivity j JOIN j.jobPost p JOIN p.company i WHERE j.user.id = :userId")
    List<InfoCompany> findAppliedCompaniesByUser(@Param("userId") Long userId);

    @Query("SELECT j FROM JobPostActivity j WHERE j.jobPost.id = :recruiterId")
    List<JobPostActivity> findApplicantsByRecruiter(@Param("recruiterId") Long recruiterId);
}
