package com.hfing.TopViec.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BotAdminController {
    @GetMapping("/admin/bot")
    public String getBotAdminPage() {
        return "admin/bot/show";
    }

}
