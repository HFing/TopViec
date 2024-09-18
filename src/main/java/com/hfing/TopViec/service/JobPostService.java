package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.repository.JobPostRepository;

@Service
public class JobPostService {

    private final JobPostRepository jobPostRepository;

    public JobPostService(JobPostRepository jobPostRepository) {
        this.jobPostRepository = jobPostRepository;
    }

    public List<JobPost> getAllJobPosts() {
        return jobPostRepository.findAll();
    }

    public JobPost getJobPostById(Long id) {
        return jobPostRepository.findById(id).orElse(null);
    }

    public JobPost saveJobPost(JobPost jobPost) {
        return jobPostRepository.save(jobPost);
    }

    public void deleteJobPost(Long id) {
        jobPostRepository.deleteById(id);
    }

    public List<JobPost> getJobPostsByCompanyId(Long companyId) {
        return jobPostRepository.findByCompanyId(companyId);
    }

    public List<JobPost> getJobPostsByUserId(Long userId) {
        return jobPostRepository.findByUserId(userId);
    }

    public List<JobPost> getHotJobPosts() {
        return jobPostRepository.findByIsHotTrueAndStatus(1);
    }

    public List<JobPost> getNonHotJobPostsWithStatusOne() {
        return jobPostRepository.findNonHotJobPostsWithStatusOne(1);
    }

}
