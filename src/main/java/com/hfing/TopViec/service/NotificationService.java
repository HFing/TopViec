package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;
import java.util.List;
import com.hfing.TopViec.domain.Notification;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.repository.NotificationRepository;

@Service
public class NotificationService {
    private final NotificationRepository notificationRepository;

    public NotificationService(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    public Notification saveNotification(Notification notification) {
        return notificationRepository.save(notification);
    }

    public Notification getNotificationById(Long id) {
        return notificationRepository.findById(id).orElse(null);
    }

    public List<Notification> getAllNotifications() {
        return notificationRepository.findAll();
    }

    public void deleteNotification(Long id) {
        notificationRepository.deleteById(id);
    }

    public List<Notification> getNotificationsByUser(User user) {
        return notificationRepository.findByUserOrderByCreateAtDesc(user);
    }

    public long countNotificationsByUser(User user) {
        return notificationRepository.countByUser(user);
    }
}
