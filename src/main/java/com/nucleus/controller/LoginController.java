package com.nucleus.controller;

import com.nucleus.model.Person;
import com.nucleus.repository.PersonDaoImpl;
import com.nucleus.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    PersonDaoImpl personDao;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private AuthService authService;

    @GetMapping("/sign")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        Person person = new Person();
        model.addAttribute("user", person);
        return "register"; // JSP page name for registration
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") Person person, HttpServletRequest request) {
        String password = person.getPersonPassword();
        personDao.registerUser(person);
        authService.authWithHttpServletRequest(request, person.getPersonName(), password);
        return "redirect:/brewery";
    }
}