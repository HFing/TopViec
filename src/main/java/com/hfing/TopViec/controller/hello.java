package com.hfing.TopViec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class hello {
    @GetMapping("/")
    public String helloTest() {
        return "hello";
    }

}
