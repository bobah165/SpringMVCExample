package com.crud.controller;


import com.crud.model.Product;
import com.crud.model.User;
import com.crud.service.ProductService;
import com.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

    private UserService userService;
    private User currentUser;
    private ProductService productService;


    @Autowired
    public void setProductService(ProductService productService) {this.productService = productService;}

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView mainPage() {
        List<User> users = userService.allUsers();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("mainPage");
        modelAndView.addObject("userList",users);
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(value = "login") String log, @RequestParam(value = "password") String pass) {
        List<User> users = userService.allUsers();
        ModelAndView modelAndView = new ModelAndView();
        boolean flagIsExist = false;

        for(User to: users ) {
            if (log.equals(to.getName())&&pass.equals(to.getPassword())) {
                currentUser = to;
                flagIsExist = true;
                modelAndView.addObject("thisUser",to);
                modelAndView.setViewName("redirect:/userPage");
            }
        }

        if (flagIsExist==false) modelAndView.setViewName("redirect:/add");

        return modelAndView;

    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("regForm");
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addUser(@RequestParam(value = "login") String log, @RequestParam(value = "password") String pass)
    {
        currentUser = new User(log,pass);
        ModelAndView modelAndView = new ModelAndView();
        userService.add(currentUser);
        modelAndView.setViewName("redirect:/userPage");
        return modelAndView;
    }

    @RequestMapping(value = "/userPage", method = RequestMethod.GET)
    public ModelAndView mainUserPage() {
        List<Product> products = productService.allProduct();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userPage");
        modelAndView.addObject("currentUser",currentUser);
        modelAndView.addObject("prodList",products);
        return modelAndView;
    }


    @RequestMapping(value = "/userPage/{id}",method = RequestMethod.GET)
    public ModelAndView addProdToUser (@PathVariable("id") int id) {
        Product product = productService.getByID(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addProdToUser");
        modelAndView.addObject("product",product);
        return modelAndView;
    }


    @RequestMapping(value ="/userPage",method =RequestMethod.POST)
    public ModelAndView editProd (@ModelAttribute("product") Product product) {
        ModelAndView modelAndView = new ModelAndView();
       // modelAndView.setViewName("addProdToUser");
        modelAndView.setViewName("redirect:/userPage");
        productService.edit(product);
        return modelAndView;
    }


    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public ModelAndView editPage (@PathVariable("id") int id) {
        User user = userService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editUser");
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public ModelAndView editUser (@ModelAttribute("user") User user) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/");
        userService.edit(user);
        return modelAndView;
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/");
        User user = userService.getById(id);
        userService.delete(user);
        return modelAndView;
    }
}
