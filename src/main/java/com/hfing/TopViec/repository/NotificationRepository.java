package com.hfing.TopViec.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.Notification;
import com.hfing.TopViec.domain.User;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findByUserOrderByCreateAtDesc(User user);

    long countByUser(User user);
}
