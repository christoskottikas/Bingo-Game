/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.services;

import com.example.Bingo.model.Stats;
import com.example.Bingo.repositories.StatsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class StatsInterfaceImp implements StatsInterface{

    @Autowired
    StatsRepository sr;
    
    
    @Override
    public void insertStats(Stats st) {
        
        sr.save(st);
        
    }
    
}
