package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoLanguageSkill;

@Repository
public interface InfoLanguageSkillRepository extends JpaRepository<InfoLanguageSkill, Long> {
}
