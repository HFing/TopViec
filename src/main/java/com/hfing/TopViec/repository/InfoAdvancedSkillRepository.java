package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoAdvancedSkill;

@Repository
public interface InfoAdvancedSkillRepository extends JpaRepository<InfoAdvancedSkill, Long> {
}
