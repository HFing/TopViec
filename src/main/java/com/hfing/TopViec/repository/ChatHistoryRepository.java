package com.hfing.TopViec.repository;

import com.hfing.TopViec.domain.ChatHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatHistoryRepository extends JpaRepository<ChatHistory, Long> {
    List<ChatHistory> findBySenderAndRecipient(String sender, String recipient);
    List<ChatHistory> findBySenderOrRecipient(String user1, String user2);
    
    // Thêm phương thức để lấy danh sách người dùng đã nhắn tin
    @Query("SELECT DISTINCT CASE WHEN sender = ?1 THEN recipient ELSE sender END AS user FROM ChatHistory WHERE sender = ?1 OR recipient = ?1")
    List<String> findDistinctUsers(String currentUser); // Thêm tham số vào phương thức
}