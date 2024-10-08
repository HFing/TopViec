package com.hfing.TopViec.repository;

import com.hfing.TopViec.domain.PaymentHistory;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentHistoryRepository extends JpaRepository<PaymentHistory, Long> {
    PaymentHistory findByUserId(Long userId);
}
