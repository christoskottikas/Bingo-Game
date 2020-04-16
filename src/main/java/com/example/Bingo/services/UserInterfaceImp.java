/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.services;

import com.example.Bingo.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.Bingo.repositories.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;


@Service
@Transactional
public class UserInterfaceImp implements UserInterface{

    @Autowired
    UserRepository ur;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    
    @Override
    public User findUserById(int id) {
        
        return  ur.findById(id).get();
    }

    @Override
    public void insertUser(User u) {
        ur.save(u);
    }

    @Override
    public User findByUsername(String username) {
        
         return  ur.findByUsername(username);
    }

    @Override
    public List<User> findAllUsers() {
        List<User> result = ur.findAll();
       return result;
    }

    @Override
    public boolean checkUsername(String username) {
       
        User u =  ur.findByUsername(username);
       
         if(u != null &&  username.equals(u.getUsername())){
         
         return true;
         }
         else
             return false;
    }

    @Override
    public boolean checkLogin(String username, String password) {
        
         User user = ur.findByUsername(username);
        List<User> allusers = ur.findAll();
        
        for(User u : allusers){
            if (user != null && username.equals(u.getUsername())&& passwordEncoder.matches(password,user.getPassword())){
                return true;
            }    

        }
        return false;
    }
    
}
