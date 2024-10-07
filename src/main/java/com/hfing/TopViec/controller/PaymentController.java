package com.hfing.TopViec.controller;

import com.hfing.TopViec.service.VNPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
public class PaymentController {

    private final VNPayService vnpayService;

    @Autowired
    public PaymentController(VNPayService vnpayService) {
        this.vnpayService = vnpayService;
    }

    @GetMapping("/success")
    public String paypalReturn(@RequestParam("paymentId") String paymentId,
            @RequestParam("token") String token,
            @RequestParam("PayerID") String payerId,
            RedirectAttributes redirectAttributes) {
        try {
            // Call the method to execute the payment
            Map<String, String> response = vnpayService.executePayPalPayment(paymentId, payerId);
            String message = response.get("message");

            // Assuming you have transaction details to pass
            String transactionId = paymentId; // or however you get the transaction ID
            String amount = "10.00"; // Replace with actual amount
            String date = "2023-10-01"; // Replace with actual date

            redirectAttributes.addFlashAttribute("message", message);
            redirectAttributes.addFlashAttribute("transactionId", transactionId);
            redirectAttributes.addFlashAttribute("amount", amount);
            redirectAttributes.addFlashAttribute("date", date);

            return "redirect:/success-final"; // Redirect to the success page
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error executing PayPal payment");
            return "redirect:/error"; // Redirect to the error page
        }
    }

    @GetMapping("/success-final")
    public String getPricingPage5Job() {
        return "success-final";
    }
}