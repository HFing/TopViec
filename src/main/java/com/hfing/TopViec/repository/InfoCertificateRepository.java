package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.InfoCertificate;

@Repository
public interface InfoCertificateRepository extends JpaRepository<InfoCertificate, Long> {
}
