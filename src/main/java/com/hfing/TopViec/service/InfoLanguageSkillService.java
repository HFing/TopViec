package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoLanguageSkill;
import com.hfing.TopViec.repository.InfoLanguageSkillRepository;

@Service
public class InfoLanguageSkillService {
    private final InfoLanguageSkillRepository infoLanguageSkillRepository;

    public InfoLanguageSkillService(InfoLanguageSkillRepository infoLanguageSkillRepository) {
        this.infoLanguageSkillRepository = infoLanguageSkillRepository;
    }

    public List<InfoLanguageSkill> findAll() {
        return infoLanguageSkillRepository.findAll();
    }

    public InfoLanguageSkill findById(Long id) {
        return infoLanguageSkillRepository.findById(id).orElse(null);
    }

    public InfoLanguageSkill save(InfoLanguageSkill infoLanguageSkill) {
        return infoLanguageSkillRepository.save(infoLanguageSkill);
    }

    public void deleteById(Long id) {
        infoLanguageSkillRepository.deleteById(id);
    }
}
