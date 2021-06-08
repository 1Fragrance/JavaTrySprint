package net.investmentAttractivenessAnalyzer.controllers;

import net.investmentAttractivenessAnalyzer.models.User;
import net.investmentAttractivenessAnalyzer.validator.UserValidator;
import net.investmentAttractivenessAnalyzer.services.interfaces.ISecurityService;
import net.investmentAttractivenessAnalyzer.services.interfaces.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ISecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.saveUser(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Неверный логин или пароль.");
        }

        if (logout != null) {
            model.addAttribute("message", "Вы вышли из системы.");
        }

        return "login";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "main";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("users", userService.findAll());

        return "admin";
    }

    @RequestMapping(value = "/blockUser", method = RequestMethod.GET)
    public String blockUser(Model model, @RequestParam(value = "id") final Long id) {
        userService.blockUser(id);
        model.addAttribute("users", userService.findAll());

        return "admin";
    }

    @RequestMapping(value = "/restoreUser", method = RequestMethod.GET)
    public String restoreUser(Model model, @RequestParam(value = "id") final Long id) {
        userService.restoreUser(id);
        model.addAttribute("users", userService.findAll());

        return "admin";
    }
}
