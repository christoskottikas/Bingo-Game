/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.repositories;

import com.example.Bingo.model.Stats;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Ro Mario
 */

    
@Repository
public interface StatsRepository  extends JpaRepository<Stats,Integer>{
    
  
    
}

