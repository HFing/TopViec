package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.Notification;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {

}
