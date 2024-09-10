package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoCertificate;
import com.hfing.TopViec.repository.InfoCertificateRepository;

@Service
public class InfoCertificateService {

    private final InfoCertificateRepository infoCertificateRepository;

    public InfoCertificateService(InfoCertificateRepository infoCertificateRepository) {
        this.infoCertificateRepository = infoCertificateRepository;
    }

    public List<InfoCertificate> findAll() {
        return infoCertificateRepository.findAll();
    }

    public InfoCertificate findById(Long id) {
        return infoCertificateRepository.findById(id).orElse(null);
    }

    public InfoCertificate save(InfoCertificate infoCertificate) {
        return infoCertificateRepository.save(infoCertificate);
    }

    public void deleteById(Long id) {
        infoCertificateRepository.deleteById(id);
    }

}
