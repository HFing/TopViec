package com.hfing.TopViec.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Date;
import org.springframework.stereotype.Service;
import java.util.stream.Collectors;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.enums.Position;
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

    public List<JobPost> searchJobs(String query) {
        return jobPostRepository.findByJobNameContainingIgnoreCase(query);
    }

    public List<JobPost> searchJobsByLocation(String location) {
        return jobPostRepository.findByLocationCityNameIgnoreCase(location);
    }

    public List<JobPost> searchJobsByPosition(Position position) {
        return jobPostRepository.findByPosition(position);
    }

    public List<JobPost> searchJobsByCareer(String career) {
        return jobPostRepository.findByCareerNameIgnoreCase(career);
    }

    public List<JobPost> getRelatedJobs(JobPost jobPost) {
        List<JobPost> relatedJobs = jobPostRepository.findByJobNameContainingIgnoreCase(jobPost.getJobName());
        relatedJobs.addAll(jobPostRepository.findByPosition(jobPost.getPosition()));
        relatedJobs.addAll(jobPostRepository.findByCareerNameIgnoreCase(jobPost.getCareer().getName()));
        return relatedJobs.stream().distinct().collect(Collectors.toList());
    }

    public long countByStatus(int status) {
        return jobPostRepository.countByStatus(status);
    }

    public long countExpiredJobPosts() {
        LocalDate localDate = LocalDate.now();
        Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        return jobPostRepository.countByDeadlineBefore(date);
    }

    public long countApprovedJobPosts(Long companyId) {
        return jobPostRepository.countByCompanyIdAndStatus(companyId, 1);
    }

    public long countPendingJobPosts(Long companyId) {
        return jobPostRepository.countByCompanyIdAndStatus(companyId, 2); // Assuming 2 is the status for pending
    }

    public long countExpiredJobPosts(Long companyId) {
        LocalDateTime now = LocalDateTime.now();
        return jobPostRepository.countByCompanyIdAndDeadlineBefore(companyId, now);
    }

    public List<JobPost> searchJobPosts(Long companyId, Integer status) {
        return jobPostRepository.searchJobPosts(companyId, status);
    }

    public long getHotJobPostCountByUserId(Long userId) {
        return jobPostRepository.countHotJobPostsByUserId(userId);
    }
}
