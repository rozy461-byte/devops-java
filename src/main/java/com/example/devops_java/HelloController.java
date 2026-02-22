package com.example.devops_java;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() {
        return "DevOps Lab: Java Backend is officially RUNNING!";
    }
}
