package com.hfing.TopViec.service;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.dto.RegisterDTO;
import com.hfing.TopViec.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public User getUserById(long id) {
        return userRepository.findById(id).get();
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean checkEmailExist(String email) {
        return userRepository.findByEmail(email) != null;
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFullName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public User findByVerificationToken(String token) {
        return userRepository.findByVerificationToken(token);
    }

    public List<Long> getMonthlyUserCounts() {
        List<Long> monthlyCounts = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        for (Month month : Month.values()) {
            LocalDateTime startDate = LocalDateTime.of(now.getYear(), month, 1, 0, 0);
            LocalDateTime endDate = startDate.plusMonths(1).minusSeconds(1);
            Long count = userRepository.countUsersByMonth(startDate, endDate);
            monthlyCounts.add(count);
        }
        return monthlyCounts;
    }

    public long countUsersByRoleName(String roleName) {
        return userRepository.countUsersByRoleName(roleName);
    }
}
