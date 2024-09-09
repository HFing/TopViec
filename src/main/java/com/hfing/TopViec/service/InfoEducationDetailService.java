package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoEducationDetail;
import com.hfing.TopViec.repository.InfoEducationDetailRepository;

@Service
public class InfoEducationDetailService {
    private final InfoEducationDetailRepository infoEducationDetailRepository;

    public InfoEducationDetailService(InfoEducationDetailRepository infoEducationDetailRepository) {
        this.infoEducationDetailRepository = infoEducationDetailRepository;
    }

    public InfoEducationDetail save(InfoEducationDetail infoEducationDetail) {
        return infoEducationDetailRepository.save(infoEducationDetail);
    }

    public InfoEducationDetail findById(Long id) {
        return infoEducationDetailRepository.findById(id).orElse(null);
    }

    public void deleteById(Long id) {
        infoEducationDetailRepository.deleteById(id);
    }

}
