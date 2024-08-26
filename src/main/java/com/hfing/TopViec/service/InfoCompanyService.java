package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.repository.InfoCompanyRepository;

@Service
public class InfoCompanyService {
    private final InfoCompanyRepository infoCompanyRepository;

    public InfoCompanyService(InfoCompanyRepository infoCompanyRepository) {
        this.infoCompanyRepository = infoCompanyRepository;
    }

    public List<InfoCompany> getAllCompanies() {
        return infoCompanyRepository.findAll();
    }

    public void saveInfoCompany(InfoCompany infoCompany) {
        infoCompanyRepository.save(infoCompany);
    }

    public InfoCompany getCompanyById(Long id) {
        return infoCompanyRepository.findById(id).get();
    }

    public void deleteCompanyById(Long id) {
        infoCompanyRepository.deleteById(id);
    }
}
