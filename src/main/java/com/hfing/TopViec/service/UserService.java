package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.User;
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
}
