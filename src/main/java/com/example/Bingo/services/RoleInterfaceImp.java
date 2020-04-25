/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.services;

import com.example.Bingo.model.Role;
import com.example.Bingo.repositories.RoleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ro Mario
 */
@Service
public class RoleInterfaceImp implements RoleInterface{
    
    @Autowired
    RoleRepository rr;
    
    @Override
    public Role findRoleById(Integer id) {
      return  rr.findById(id).get();
    }

    @Override
    public List<Role> getAllRoles() {
        List<Role> result = rr.findAll();
        
        return  result;
    }
    
    
    
}
