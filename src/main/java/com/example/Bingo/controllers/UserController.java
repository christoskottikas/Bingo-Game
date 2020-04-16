package com.example.Bingo.controllers;

import com.example.Bingo.dto.UserDto;
import com.example.Bingo.model.User;
import com.example.Bingo.services.UserInterfaceImp;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    ServletContext sc;

    @Autowired
    UserInterfaceImp ui;

    @GetMapping("/")
    public String showHomePage() {
        return "home";
    }

    @GetMapping("/preregister")
    public String preRegisterUser(ModelMap mm) {

        UserDto userdto = new UserDto();

        mm.addAttribute("UserDto", userdto);

        return "registerform";

    }

    @PostMapping("/register")
    public String insertTrainer(@Valid @ModelAttribute("RegisterDto") UserDto ud, BindingResult br, ModelMap mm) {

        if (ud.getPassword().equals(ud.getPasswordConfirm())) {

            if (ui.checkUsername(ud.getUsername())) {

                sc.setAttribute("wrongUsername", "username already exists");

                return "redirect:/preregister";

            } 
            if (ui.checkEmail(ud.getEmail())){
                
                sc.setAttribute("wrongEmail", "email already exists");
                
                return "redirect:/preregister";
            }
            
            else {

                User u = new User();
                u.setFirstname(ud.getFirstName());
                u.setLastname(ud.getLastName());
                u.setUsername(ud.getUsername());
                u.setPassword(passwordEncoder.encode(ud.getPassword()));
                u.setEmail(ud.getEmail());
                u.setBalance(200);
               
                u.setDateofbirth(ud.getDateOfBirth());

                ui.insertUser(u);
                return "successRegister";
            }

        } else if (!ud.getPassword().equals(ud.getPasswordConfirm())) {

            sc.setAttribute("wrongPassword", "passwords do not match");

            return "redirect:/preregister";
        }
        else if (br.hasErrors()){
            
            return "redirect:/preregister";
        }
        return "redirect:/preregister";

    }

    @GetMapping("/prelogin")
    public String preLogin(ModelMap mm) {

        UserDto rd = new UserDto();
        mm.addAttribute("user", rd);
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") UserDto ud, ModelMap mm, HttpSession hs) {

        User user = ui.findByUsername(ud.getUsername());

        if (ui.checkLogin(ud.getUsername(), ud.getPassword())) {

            hs.setAttribute("u", user);

            return "successlogin";

        } else {
            
            sc.setAttribute("message", "wrong username or password");
            
            return "redirect:/prelogin";
            
        }

       
    }
}
