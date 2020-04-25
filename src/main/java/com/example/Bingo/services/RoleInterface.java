/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.services;

import com.example.Bingo.model.Role;
import java.util.List;

/**
 *
 * @author Ro Mario
 */
public interface RoleInterface {
    
     public Role findRoleById(Integer id);
    
    public List<Role> getAllRoles();
}
