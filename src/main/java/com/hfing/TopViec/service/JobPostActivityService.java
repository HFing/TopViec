package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;
import com.hfing.TopViec.domain.JobPostActivity;
import com.hfing.TopViec.repository.JobPostActivityRepository;

@Service
public class JobPostActivityService {
    private final JobPostActivityRepository jobPostActivityRepository;

    public JobPostActivityService(JobPostActivityRepository jobPostActivityRepository) {
        this.jobPostActivityRepository = jobPostActivityRepository;
    }

    public List<JobPostActivity> findAll() {
        return jobPostActivityRepository.findAll();
    }

    public Optional<JobPostActivity> findById(Long id) {
        return jobPostActivityRepository.findById(id);
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
}
