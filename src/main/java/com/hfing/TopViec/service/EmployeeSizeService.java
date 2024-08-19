package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.EmployeeSize;
import com.hfing.TopViec.repository.EmployeeSizeRepository;

@Service
public class EmployeeSizeService {

    private final EmployeeSizeRepository employeeSizeRepository;

    public EmployeeSizeService(EmployeeSizeRepository employeeSizeRepository) {
        this.employeeSizeRepository = employeeSizeRepository;
    }

    public List<EmployeeSize> findAll() {
        return employeeSizeRepository.findAll();
    }

    public EmployeeSize findById(Long id) {
        return employeeSizeRepository.findById(id).orElse(null);
    }
}
