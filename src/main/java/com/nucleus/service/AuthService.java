package com.nucleus.service;

import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

@Service
public class AuthService {
    public void authWithHttpServletRequest(HttpServletRequest request, String username, String password) {
        try {
            System.out.println("this is auto login");
            request.login(username, password);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}