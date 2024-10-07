package com.hfing.TopViec.controller.client;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hfing.TopViec.service.VNPayService;

import java.security.NoSuchAlgorithmException;

@Controller
public class PricingController {

    private final VNPayService vnpayService;

    public PricingController(VNPayService vnpayService) {
        this.vnpayService = vnpayService;
    }

    @GetMapping("/pricing")
    public String getPricingPage() {
        return "client/pricing/show";
    }

    @GetMapping("/pricing/1-job")
    public String getPricingPage1Job() {
        return "client/pricing/1-job";
    }

    @GetMapping("/pricing/3-job")
    public String getPricingPage3Job() {
        return "client/pricing/3-job";
    }

    @GetMapping("/pricing/5-job")
    public String getPricingPage5Job() {
        return "client/pricing/5-job";
    }

    @GetMapping("/create-paypal-payment")
    public String createPayPalPayment(@RequestParam("orderId") String orderId,
            @RequestParam("amount") String amount,
            RedirectAttributes redirectAttributes) {
        try {
            // Kiểm tra giá trị amount
            if (amount == null || amount.isEmpty()) {
                throw new IllegalArgumentException("Amount cannot be null or empty");
            }

            // Gọi phương thức tạo thanh toán PayPal
            Map<String, String> paymentResponse = vnpayService.createPayPalPayment(amount,
                    "Payment for order " + orderId, "http://localhost:8080/success", "http://localhost:8080/cancel");
            String approvalUrl = paymentResponse.get("approvalUrl");
            return "redirect:" + approvalUrl; // Chuyển hướng đến URL phê duyệt của PayPal
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error creating PayPal payment");
            return "redirect:/error";
        }
    }

}
