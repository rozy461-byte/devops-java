package com.example.devops_java;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NewController {
    @GetMapping("/new")
    public String index() {
        return "Hellow from newController to check the CI/CD pipeline";
    }
}
