package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoExperienceDetail;
import com.hfing.TopViec.repository.InfoExperienceDetailRepository;

@Service
public class InfoExperienceDetailService {
    private final InfoExperienceDetailRepository infoExperienceDetailRepository;

    public InfoExperienceDetailService(InfoExperienceDetailRepository infoExperienceDetailRepository) {
        this.infoExperienceDetailRepository = infoExperienceDetailRepository;
    }

    public InfoExperienceDetail save(InfoExperienceDetail infoExperienceDetail) {
        return infoExperienceDetailRepository.save(infoExperienceDetail);
    }

    public InfoExperienceDetail findById(Long id) {
        return infoExperienceDetailRepository.findById(id).orElse(null);
    }

    public void deleteById(Long id) {
        infoExperienceDetailRepository.deleteById(id);
    }

}
