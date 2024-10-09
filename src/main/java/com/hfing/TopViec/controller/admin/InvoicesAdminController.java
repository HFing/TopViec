package com.hfing.TopViec.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.hfing.TopViec.service.PaymentHistoryService;
import com.hfing.TopViec.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class InvoicesAdminController {
    private final PaymentHistoryService paymentHistoryService;
    private final UserService userService;

    public InvoicesAdminController(PaymentHistoryService paymentHistoryService, UserService userService) {
        this.paymentHistoryService = paymentHistoryService;
        this.userService = userService;
    }

    @GetMapping("/admin/invoice")
    public String getInvoicePage(Model model) {
        model.addAttribute("invoices", paymentHistoryService.getAll());
        return "admin/invoice/show";
    }

    @GetMapping("/admin/invoice/delete")
    public String deleteInvoice(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        paymentHistoryService.deleteById(id);
        redirectAttributes.addFlashAttribute("message", "Invoice deleted successfully!");
        return "redirect:/admin/invoice";
    }

}
