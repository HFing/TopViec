package com.hfing.TopViec.repository;

import java.util.List;
import java.time.LocalDateTime;
import java.util.Date;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;

@Repository
public interface JobPostRepository extends JpaRepository<JobPost, Long> {
        List<JobPost> findByCompanyId(Long companyId);

        List<JobPost> findByUserId(Long userId);

        List<JobPost> findByIsHotTrueAndStatus(int status);

        @Query("SELECT jp FROM JobPost jp WHERE jp.status = :status AND jp.isHot = false ORDER BY jp.isUrgent DESC")
        List<JobPost> findNonHotJobPostsWithStatusOne(@Param("status") int status);

        List<JobPost> findByJobNameContainingIgnoreCase(String jobName);

        List<JobPost> findByLocationCityNameIgnoreCase(String cityName);

        List<JobPost> findByPosition(Position position);

        List<JobPost> findByCareerNameIgnoreCase(String careerName);

        long countByStatus(int status);

        @Query("SELECT COUNT(j) FROM JobPost j WHERE j.deadline < :date")
        long countByDeadlineBefore(@Param("date") Date date);

        long countByCompanyIdAndStatus(Long companyId, int status);

        long countByCompanyIdAndDeadlineBefore(Long companyId, LocalDateTime deadline);

        @Query("SELECT jp FROM JobPost jp WHERE " +
                        "(:companyId IS NULL OR jp.company.id = :companyId) AND " +
                        "(:status IS NULL OR jp.status = :status)")
        List<JobPost> searchJobPosts(@Param("companyId") Long companyId,
                        @Param("status") Integer status);

        @Query("SELECT COUNT(jp) FROM JobPost jp WHERE jp.user.id = :userId AND jp.isHot = true")
        long countHotJobPostsByUserId(@Param("userId") Long userId);

        List<JobPost> findByStatus(int status);

        List<JobPost> findByTypeOfWorkplace(TypeOfWorkplace typeOfWorkplace);
}
