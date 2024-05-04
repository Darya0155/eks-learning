package com.asm;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {


    @Value("${app_name}")
    String appName;

    @GetMapping
    public String  helloWorld(){
        return "Hello World ::"+appName;
    }



}
