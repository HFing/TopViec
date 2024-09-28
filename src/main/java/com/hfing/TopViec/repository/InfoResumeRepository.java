package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.hfing.TopViec.domain.InfoResume;

@Repository
public interface InfoResumeRepository extends JpaRepository<InfoResume, Long> {
    List<InfoResume> findByUserId(Long userId);

    InfoResume findAllByUserIdAndFileUrlIsNull(Long userId);

    List<InfoResume> findAllByUserIdAndFileUrlIsNotNull(Long userId);

    List<InfoResume> findByTitleContainingOrUserFullNameContaining(String titleKeyword, String userFullNameKeyword);

    List<InfoResume> findByTitleContainingOrUserFullNameContainingAndCityId(String titleKeyword,
            String userFullNameKeyword, Long cityId);
}
