/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.services;

import com.example.Bingo.model.User;
import java.util.List;


public interface UserInterface {
    
    public User findUserById(int id);
    
    public void insertUser (User u);
    
    public User findByUsername(String username);
    
    public List<User> findAllUsers();
    
    public boolean checkUsername(String username);
    
    public boolean checkLogin(String username,String password);
    
    public User findByEmail(String email);
    
    public boolean checkEmail(String email);
    
}
