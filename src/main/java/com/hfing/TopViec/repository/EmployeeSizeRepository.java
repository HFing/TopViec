package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.EmployeeSize;

@Repository
public interface EmployeeSizeRepository extends JpaRepository<EmployeeSize, Long> {

}
