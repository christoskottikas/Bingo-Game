/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.repositories;

import com.example.Bingo.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Ro Mario
 */
public interface RoleRepository extends JpaRepository<Role, Integer>{
    
}
