package com.hfing.TopViec.repository;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    User findByVerificationToken(String token);

    @Query("SELECT COUNT(u) FROM User u WHERE u.roleName = 'USER' AND u.createAt BETWEEN :startDate AND :endDate")
    Long countUsersByMonth(LocalDateTime startDate, LocalDateTime endDate);

    @Query("SELECT COUNT(u) FROM User u WHERE u.roleName = :roleName")
    long countUsersByRoleName(@Param("roleName") String roleName);
}
