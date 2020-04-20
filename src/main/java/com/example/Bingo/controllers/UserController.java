package com.example.Bingo.controllers;

import com.example.Bingo.dto.UserDto;
import com.example.Bingo.model.User;
import com.example.Bingo.services.UserInterfaceImp;
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
    UserInterfaceImp ui;

    @GetMapping("/")
    public String showHomePage() {
        return "home";
    }

    @GetMapping("/preregister")
    public String preRegisterUser(ModelMap mm) {

        UserDto userdto = new UserDto();
        mm.addAttribute("RegisterDto", userdto);

        return "registerform";

    }

    @PostMapping("/register")
    public String insertTrainer(@Valid @ModelAttribute("RegisterDto") UserDto ud, BindingResult br, ModelMap mm) {

        if (ud.getPassword().equals(ud.getPasswordConfirm())) {

            if (ui.checkUsername(ud.getUsername())) {

                br.rejectValue("username", "error.registerUsername");
                ud.setDateOfBirth(null);

                return "registerform";

            }
            if (ui.checkEmail(ud.getEmail())) {

                br.rejectValue("email", "error.email");
                ud.setDateOfBirth(null);

                return "registerform";
            } else {

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

            br.rejectValue("password", "error.password");
            ud.setDateOfBirth(null);

            return "registerform";

        } else if (br.hasErrors()) {

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
    public String login(@ModelAttribute("user") UserDto ud, ModelMap mm, HttpSession hs, BindingResult br) {

        User user = ui.findByUsername(ud.getUsername());

        if (ui.checkLogin(ud.getUsername(), ud.getPassword())) {

            hs.setAttribute("u", user);

            return "successlogin";

        } else {

            br.rejectValue("username", "error.userName");

            return "login";

        }

    }

    @PostMapping("/logout")
    public String logout(HttpSession hs) {
        hs.invalidate();
        return "redirect:/prelogin";
    }
}
