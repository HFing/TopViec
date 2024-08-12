package com.hfing.TopViec.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {
    @GetMapping("/")
    public String helloTest() {
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String register() {
        return "client/auth/register";
    }

    @GetMapping("/login")
    public String getLogInPage() {
        return "client/auth/login";
    }
}