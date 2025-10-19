package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "Welcome to Java Project running on Kubernetes 🚀";
    }

    @GetMapping("/greeting")
    public String greeting() {
        return "Hello from Java Project 👋";
    }

    @GetMapping("/health")
    public String health() {
        return "UP";
    }
}

