package com.hfing.TopViec;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class TopViecApplication {
	public static void main(String[] args) {
		SpringApplication.run(TopViecApplication.class, args);
	}
}
