package com.hfing.TopViec.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.CommonCareer;
import com.hfing.TopViec.repository.CommonCareerRepository;

@Service
public class CommonCareerService {

    private final CommonCareerRepository commonCareerRepository;

    public CommonCareerService(CommonCareerRepository commonCareerRepository) {
        this.commonCareerRepository = commonCareerRepository;
    }

    public List<CommonCareer> findAll() {
        return commonCareerRepository.findAll();
    }

    public Optional<CommonCareer> findById(Long id) {
        return commonCareerRepository.findById(id);
    }

    public CommonCareer save(CommonCareer commonCareer) {
        return commonCareerRepository.save(commonCareer);
    }

    public void deleteById(Long id) {
        commonCareerRepository.deleteById(id);
    }

}
