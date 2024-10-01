package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import com.hfing.TopViec.domain.JobPostActivity;
import com.hfing.TopViec.repository.JobPostActivityRepository;
import java.util.Map;

@Service
public class JobPostActivityService {
    private final JobPostActivityRepository jobPostActivityRepository;

    public JobPostActivityService(JobPostActivityRepository jobPostActivityRepository) {
        this.jobPostActivityRepository = jobPostActivityRepository;
    }

    public List<JobPostActivity> findAll() {
        return jobPostActivityRepository.findAll();
    }

    public JobPostActivity findById(Long id) {
        Optional<JobPostActivity> optional = jobPostActivityRepository.findById(id);
        return optional.orElse(null);
    }

    public JobPostActivity save(JobPostActivity jobPostActivity) {
        return jobPostActivityRepository.save(jobPostActivity);
    }

    public void deleteById(Long id) {
        jobPostActivityRepository.deleteById(id);
    }

    public List<JobPostActivity> findByUserId(Long userId) {
        return jobPostActivityRepository.findByUserId(userId);
    }

    public List<JobPostActivity> findByJobPostId(Long jobPostId) {
        return jobPostActivityRepository.findByJobPostId(jobPostId);
    }

    public boolean hasApplied(Long jobPostId, Long userId) {
        Optional<JobPostActivity> jobPostActivity = jobPostActivityRepository.findByJobPostIdAndUserId(jobPostId,
                userId);
        return jobPostActivity.isPresent();
    }

    public Map<Integer, Long> getJobPostActivityCountsByStatus() {
        List<Object[]> results = jobPostActivityRepository.countJobPostActivitiesByStatus();
        Map<Integer, Long> statusCounts = new HashMap<>();
        for (Object[] result : results) {
            Integer status = (Integer) result[0];
            Long count = (Long) result[1];
            statusCounts.put(status, count);
        }
        return statusCounts;
    }

    public Map<String, Integer> getMonthlyApplicantCounts(Long companyId) {
        List<Object[]> results = jobPostActivityRepository.findMonthlyApplicantCountsByCompanyId(companyId);
        Map<String, Integer> monthlyCounts = new HashMap<>();
        for (Object[] result : results) {
            Integer month = (Integer) result[0];
            Long count = (Long) result[1];
            monthlyCounts.put(month.toString(), count.intValue());
        }
        return monthlyCounts;
    }

    public Map<Integer, Long> getApplicantCountsByStatus(Long companyId) {
        List<Object[]> results = jobPostActivityRepository.findApplicantCountsByStatusAndCompanyId(companyId);
        Map<Integer, Long> statusCounts = new HashMap<>();
        for (Object[] result : results) {
            Integer status = (Integer) result[0];
            Long count = (Long) result[1];
            statusCounts.put(status, count);
        }
        return statusCounts;
    }

    public long countTotalApplicants(Long companyId) {
        return jobPostActivityRepository.countByJobPostCompanyId(companyId);
    }
}
