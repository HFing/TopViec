package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.Role;
import com.hfing.TopViec.repository.RoleRepository;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }

    public Role findById(Long id) {
        return roleRepository.findById(id).orElse(null);
    }

    public Role findByName(String name) {
        return roleRepository.findByName(name);
    }
}
