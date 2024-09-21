package com.hfing.TopViec.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.repository.InfoResumeRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class InfoResumeService {
    private final InfoResumeRepository infoResumeRepository;

    public InfoResumeService(InfoResumeRepository infoResumeRepository) {
        this.infoResumeRepository = infoResumeRepository;
    }

    public List<InfoResume> getResumeByUserId(Long userId) {
        return infoResumeRepository.findByUserId(userId);
    }

    public void save(InfoResume infoResume) {
        infoResumeRepository.save(infoResume);
    }

    public InfoResume findAllByUserIdAndFileUrlIsNull(Long userId) {
        return infoResumeRepository.findAllByUserIdAndFileUrlIsNull(userId);
    }

    public List<InfoResume> findAllByUserIdAndFileUrlIsNotNull(Long userId) {
        return infoResumeRepository.findAllByUserIdAndFileUrlIsNotNull(userId);
    }

    public Optional<InfoResume> findById(Long id) {
        return infoResumeRepository.findById(id);
    }

    public InfoResume findByIdNotOpt(Long id) {
        return infoResumeRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Resume not found with id " + id));
    }

    public void deleteById(Long id) {
        infoResumeRepository.deleteById(id);
    }

    public List<InfoResume> findAll() {
        return infoResumeRepository.findAll();
    }

}
