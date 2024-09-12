package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;
import java.util.List;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoCompanyImage;
import com.hfing.TopViec.repository.InfoCompanyImageRepository;

@Service
public class InfoCompanyImageService {
    private final InfoCompanyImageRepository infoCompanyImageRepository;

    public InfoCompanyImageService(InfoCompanyImageRepository infoCompanyImageRepository) {
        this.infoCompanyImageRepository = infoCompanyImageRepository;
    }

    public List<InfoCompanyImage> findByCompany(InfoCompany company) {
        return infoCompanyImageRepository.findByCompany(company);
    }

    public void save(InfoCompanyImage infoCompanyImage) {
        infoCompanyImageRepository.save(infoCompanyImage);
    }

    public void delete(InfoCompanyImage infoCompanyImage) {
        infoCompanyImageRepository.delete(infoCompanyImage);
    }

    public InfoCompanyImage findById(Long id) {
        return infoCompanyImageRepository.findById(id).orElse(null);
    }
}
