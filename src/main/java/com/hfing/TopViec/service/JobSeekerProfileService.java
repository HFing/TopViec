package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.JobSeekerProfile;
import com.hfing.TopViec.repository.JobSeekerProfileRepository;

@Service
public class JobSeekerProfileService {

    private final JobSeekerProfileRepository jobSeekerProfileRepository;

    public JobSeekerProfileService(JobSeekerProfileRepository jobSeekerProfileRepository) {
        this.jobSeekerProfileRepository = jobSeekerProfileRepository;
    }

    public JobSeekerProfile getProfileByUserId(Long userId) {
        return jobSeekerProfileRepository.findByUserId(userId);
    }

    public void save(JobSeekerProfile jobSeekerProfile) {
        jobSeekerProfileRepository.save(jobSeekerProfile);
    }
}
