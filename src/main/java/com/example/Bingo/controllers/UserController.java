package com.example.Bingo.controllers;

import com.example.Bingo.dto.UserDto;
import com.example.Bingo.model.Stats;
import com.example.Bingo.model.User;
import com.example.Bingo.services.StatsInterfaceImp;
import com.example.Bingo.services.UserInterfaceImp;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import com.example.Bingo.dto.MailRequest;
import com.example.Bingo.dto.MailResponse;
import com.example.Bingo.model.Role;
import com.example.Bingo.services.EmailService;
import com.example.Bingo.services.RoleInterfaceImp;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    UserInterfaceImp ui;

    @Autowired
    StatsInterfaceImp si;

    @Autowired
    private EmailService service;

    @Autowired
    RoleInterfaceImp ri;

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

                Role role = new Role();
                Stats playerStats = new Stats();
                User u = new User();
                u.setFirstname(ud.getFirstName());
                u.setLastname(ud.getLastName());
                u.setUsername(ud.getUsername());
                u.setPassword(passwordEncoder.encode(ud.getPassword()));
                u.setEmail(ud.getEmail());
                u.setBalance(200);
                u.setDateofbirth(ud.getDateOfBirth());

                if (u.getUsername().equalsIgnoreCase("admin")) {

                    role.setRoleId(2);
                    u.setRoleID(role);
                    ui.insertUser(u);
                } else {

                    role.setRoleId(1);
                    u.setRoleID(role);
                    ui.insertUser(u);
                }

                playerStats.setGames(0);
                playerStats.setWins(0);
                playerStats.setUserId(u);

                si.insertStats(playerStats);

                mm.addAttribute("user", u);

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


        if (ud.getUsername() != "" && ud.getPassword() != "") {

                    User user = ui.findByUsername(ud.getUsername());

            if (user.getRoleID().getRoleId() == 2 && ui.checkLogin(ud.getUsername(), ud.getPassword())) {

                hs.setAttribute("u", user);

                return "adminPage";
            }

            if (ui.checkLogin(ud.getUsername(), ud.getPassword())) {

                hs.setAttribute("u", user);

                return "successlogin";

            } else {

                br.rejectValue("username", "error.userName");

                return "login";
            }
        } else {
              br.rejectValue("username", "error.userName");

            return "login";
        }
    }

    @PostMapping("/adminLogin")
    public String adminLogin() {

        return "successlogin";
    }

    @GetMapping("/getAllUsers")
    public String getAllUsersUrl(ModelMap mm) {

        List<User> allUsers = ui.findAllUsers();
        mm.addAttribute("allusers", allUsers);

        return "allUsers";
    }

    @PostMapping("/getAllUsers")
    public String getAllUsers(ModelMap mm) {

        List<User> allUsers = ui.findAllUsers();
        mm.addAttribute("allusers", allUsers);

        return "allUsers";
    }

    @PostMapping("/getAllUsers/{balance}/{games}/{wins}")
    public String updatedAllUsers(@PathVariable("balance") Integer uptadedFunds, @PathVariable("games") Integer gamesPlayed, @PathVariable("wins") Integer totalWins, ModelMap mm, HttpSession hs) {

        Stats playerStats = new Stats();
        User user = (User) hs.getAttribute("u");
        user.setBalance(uptadedFunds);

        int statsId = user.getStats().getStatsId();
        playerStats.setStatsId(statsId);
        playerStats.setGames(gamesPlayed);
        playerStats.setWins(totalWins);
        playerStats.setUserId(user);

        si.insertStats(playerStats);
        ui.insertUser(user);

        List<User> allUsers = ui.findAllUsers();
        mm.addAttribute("allusers", allUsers);

        return "allUsers";
    }

    @GetMapping("/delete/{id}")
    public String deleteTrainer(@PathVariable("id") int id) {

        ui.deleteUser(ui.findUserById(id));

        return "redirect:/getAllUsers";
    }

    @GetMapping("/preupdate/{id}")
    public String preUpdate(@PathVariable("id") int id, ModelMap mm) {
        User u = ui.findUserById(id);

        u.setDateofbirth(null);
        mm.addAttribute("user", u);
        mm.addAttribute("allRoles", ri.getAllRoles());
        return "updateForm";
    }

    @PostMapping("/updateUser/{id}")
    public String updateTrainer(@Valid @ModelAttribute("user") User u, @PathVariable("id") int id, BindingResult br, ModelMap mm) {

        User temp = ui.findUserById(id);

        if (!temp.getUsername().equalsIgnoreCase(u.getUsername()) && ui.checkUsername(u.getUsername())) {

            br.rejectValue("username", "error.registerUsername");
            u.setDateofbirth(null);
            mm.addAttribute("allRoles", ri.getAllRoles());
            return "updateForm";
        } else if (!temp.getEmail().equalsIgnoreCase(u.getEmail()) && ui.checkEmail(u.getEmail())) {

            br.rejectValue("email", "error.email");
            u.setDateofbirth(null);
            mm.addAttribute("allRoles", ri.getAllRoles());
            return "updateForm";
        } else {

            u.setId(id);
            u.setDateofbirth(u.getDateofbirth());

            ui.insertUser(u);

            return "redirect:/getAllUsers";
        }
    }

    @PostMapping("/logout/{balance}/{games}/{wins}")
    public String logout(@PathVariable("balance") Integer uptadedFunds, @PathVariable("games") Integer gamesPlayed, @PathVariable("wins") Integer totalWins, HttpSession hs) {
        Stats playerStats = new Stats();
        User user = (User) hs.getAttribute("u");
        user.setBalance(uptadedFunds);

        int statsId = user.getStats().getStatsId();
        playerStats.setStatsId(statsId);
        playerStats.setGames(gamesPlayed);
        playerStats.setWins(totalWins);
        playerStats.setUserId(user);

        si.insertStats(playerStats);
        ui.insertUser(user);
        hs.invalidate();

        return "redirect:/";
    }

    @PostMapping("/logoutAdmin")
    public String logoutAdmin(HttpSession hs) {
        hs.invalidate();
        return "redirect:/";
    }

    @PostMapping("/gameOver/{games}/{wins}/{balanceUpdated}")
    public String gameOver(@PathVariable("games") Integer gamesPlayed, @PathVariable("wins") Integer totalWins, @PathVariable("balanceUpdated") Integer balance, HttpSession hs) {
        Stats playerStats = new Stats();
        User user = (User) hs.getAttribute("u");

        user.setBalance(balance);
        int statsId = user.getStats().getStatsId();

        playerStats.setStatsId(statsId);
        playerStats.setGames(gamesPlayed);
        playerStats.setWins(totalWins);
        playerStats.setUserId(user);
        ui.insertUser(user);

        si.insertStats(playerStats);

        hs.invalidate();
        return "redirect:/prelogin";
    }

    @ResponseBody
    @PostMapping("/sendingEmail")
    public MailResponse sendEmail(@RequestBody MailRequest request) {
        Map<String, Object> model = new HashMap<>();
        model.put("Name", request.getName());
        model.put("location", "Bingo Greece");
        return service.sendEmail(request, model);

    }
}
