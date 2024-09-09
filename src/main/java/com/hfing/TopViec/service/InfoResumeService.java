package com.hfing.TopViec.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.repository.InfoResumeRepository;

@Service
public class InfoResumeService {
    private final InfoResumeRepository infoResumeRepository;

    public InfoResumeService(InfoResumeRepository infoResumeRepository) {
        this.infoResumeRepository = infoResumeRepository;
    }

    public Optional<InfoResume> getResumeByUserId(Long userId) {
        return infoResumeRepository.findByUserId(userId);
    }

    public void save(InfoResume infoResume) {
        infoResumeRepository.save(infoResume);
    }

    public InfoResume findAllByUserIdAndFileUrlIsNull(Long userId) {
        return infoResumeRepository.findAllByUserIdAndFileUrlIsNull(userId);
    }
}
