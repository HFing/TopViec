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

    @GetMapping("/create-payment")
    public String createPayment(@RequestParam("orderId") String orderId,
            @RequestParam("amount") long amount,
            RedirectAttributes redirectAttributes) {
        try {
            String paymentUrl = vnpayService.createPaymentUrl(orderId, amount);
            return "redirect:" + paymentUrl;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error creating payment URL");
            return "redirect:/error";
        }
    }

    @GetMapping("/vnpay-return")
    public String vnpayReturn(@RequestParam Map<String, String> params, RedirectAttributes redirectAttributes) {
        // Xử lý phản hồi từ VNPay
        String vnp_ResponseCode = params.get("vnp_ResponseCode");
        if ("00".equals(vnp_ResponseCode)) {
            redirectAttributes.addFlashAttribute("message", "Payment successful!");
            return "redirect:/success";
        } else {
            redirectAttributes.addFlashAttribute("error", "Payment failed!");
            return "redirect:/error";
        }
    }

}
