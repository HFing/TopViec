package com.hfing.TopViec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class hello {
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
