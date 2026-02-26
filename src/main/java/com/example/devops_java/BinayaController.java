package com.example.devops_java;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BinayaController {
    @GetMapping("/binaya")
    public String index() {
        return "New route added to test the CI/CD pipeline. Developer doesn't care how deployment happens as long as it happens successfully.";
    }
}
