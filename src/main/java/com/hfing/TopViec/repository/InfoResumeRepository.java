package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

import com.hfing.TopViec.domain.InfoResume;

@Repository
public interface InfoResumeRepository extends JpaRepository<InfoResume, Long> {
    Optional<InfoResume> findByUserId(Long userId);

    InfoResume findAllByUserIdAndFileUrlIsNull(Long userId);
}
