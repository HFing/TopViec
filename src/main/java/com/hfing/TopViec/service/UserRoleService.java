package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.Role;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.UserRole;
import com.hfing.TopViec.repository.UserRoleRepository;

import jakarta.transaction.Transactional;

@Service
public class UserRoleService {
    private final UserRoleRepository userRoleRepository;

    public UserRoleService(UserRoleRepository userRoleRepository) {
        this.userRoleRepository = userRoleRepository;
    }

    public void saveUserRole(UserRole userRole) {
        userRoleRepository.save(userRole);
    }

    public void createAndSaveUserRole(User user, Role role) {
        UserRole userRole = new UserRole();
        userRole.setRole(role);
        userRole.setUser(user);
        userRoleRepository.save(userRole);
    }

    @Transactional
    public void deleteUserRolesByUserId(long userId) {
        userRoleRepository.deleteByUserId(userId);
    }

    public UserRole getUserRoleByUserId(long userId) {
        return userRoleRepository.findByUserId(userId);
    }

}
