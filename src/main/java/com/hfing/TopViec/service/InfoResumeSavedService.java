package com.hfing.TopViec.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.InfoResumeSaved;
import com.hfing.TopViec.repository.InfoResumeSavedRepository;

@Service
public class InfoResumeSavedService {
    private final InfoResumeSavedRepository infoResumeSavedRepository;

    public InfoResumeSavedService(InfoResumeSavedRepository infoResumeSavedRepository) {
        this.infoResumeSavedRepository = infoResumeSavedRepository;
    }

    public InfoResumeSaved saveInfoResumeSaved(InfoResumeSaved infoResumeSaved) {
        return infoResumeSavedRepository.save(infoResumeSaved);
    }

    public Optional<InfoResumeSaved> getInfoResumeSavedById(Long id) {
        return infoResumeSavedRepository.findById(id);
    }

    public List<InfoResumeSaved> getAllInfoResumeSaved() {
        return infoResumeSavedRepository.findAll();
    }

    public void deleteInfoResumeSavedById(Long id) {
        infoResumeSavedRepository.deleteById(id);
    }

    public boolean existsByCompanyAndResume(InfoCompany company, InfoResume resume) {
        return infoResumeSavedRepository.existsByCompanyAndResume(company, resume);
    }

    public void deleteByCompanyAndResume(InfoCompany company, InfoResume resume) {
        infoResumeSavedRepository.deleteByCompanyAndResume(company, resume);
    }

    public InfoResumeSaved findByCompanyAndResume(InfoCompany company, InfoResume resume) {
        return infoResumeSavedRepository.findByCompanyAndResume(company, resume);
    }

}
