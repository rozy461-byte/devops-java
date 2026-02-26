package com.example.devops_java;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AboutController {
    @GetMapping("/about")
    public String index() {
        return "This is the about page that we have added recently to test the CI/CD pipeline.";
    }
}
