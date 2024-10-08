package com.hfing.TopViec.service;

import com.hfing.TopViec.domain.PaymentHistory;
import com.hfing.TopViec.repository.PaymentHistoryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentHistoryService {

    private final PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    public PaymentHistoryService(PaymentHistoryRepository paymentHistoryRepository) {
        this.paymentHistoryRepository = paymentHistoryRepository;
    }

    public void savePaymentHistory(PaymentHistory paymentHistory) {
        paymentHistoryRepository.save(paymentHistory);
    }

    public PaymentHistory findByUserID(Long userId) {
        return paymentHistoryRepository.findByUserId(userId);
    }
}
