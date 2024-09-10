package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.InfoAdvancedSkill;
import com.hfing.TopViec.repository.InfoAdvancedSkillRepository;

@Service
public class InfoAdvancedSkillService {
    private final InfoAdvancedSkillRepository infoAdvancedSkillRepository;

    public InfoAdvancedSkillService(InfoAdvancedSkillRepository infoAdvancedSkillRepository) {
        this.infoAdvancedSkillRepository = infoAdvancedSkillRepository;
    }

    public List<InfoAdvancedSkill> findAll() {
        return infoAdvancedSkillRepository.findAll();
    }

    public InfoAdvancedSkill findById(Long id) {
        return infoAdvancedSkillRepository.findById(id).orElse(null);
    }

    public InfoAdvancedSkill save(InfoAdvancedSkill infoAdvancedSkill) {
        return infoAdvancedSkillRepository.save(infoAdvancedSkill);
    }

    public void deleteById(Long id) {
        infoAdvancedSkillRepository.deleteById(id);
    }
}
