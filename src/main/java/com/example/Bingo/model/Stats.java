/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ro Mario
 */
@Entity
@Table(name = "stats")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Stats.findAll", query = "SELECT s FROM Stats s"),
    @NamedQuery(name = "Stats.findByWins", query = "SELECT s FROM Stats s WHERE s.wins = :wins"),
    @NamedQuery(name = "Stats.findByGames", query = "SELECT s FROM Stats s WHERE s.games = :games"),
    @NamedQuery(name = "Stats.findByStatsId", query = "SELECT s FROM Stats s WHERE s.statsId = :statsId")})
public class Stats implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "wins")
    private Integer wins;
    @Basic(optional = false)
    @NotNull
    @Column(name = "games")
    private int games;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "stats_id")
    private Integer statsId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OneToOne(optional = false)
    private User userId;

    public Stats() {
    }

    public Stats(Integer statsId) {
        this.statsId = statsId;
    }

    public Stats(Integer statsId, int games) {
        this.statsId = statsId;
        this.games = games;
    }

    public Integer getWins() {
        return wins;
    }

    public void setWins(Integer wins) {
        this.wins = wins;
    }

    public int getGames() {
        return games;
    }

    public void setGames(int games) {
        this.games = games;
    }

    public Integer getStatsId() {
        return statsId;
    }

    public void setStatsId(Integer statsId) {
        this.statsId = statsId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (statsId != null ? statsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Stats)) {
            return false;
        }
        Stats other = (Stats) object;
        if ((this.statsId == null && other.statsId != null) || (this.statsId != null && !this.statsId.equals(other.statsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.Bingo.model.Stats[ statsId=" + statsId + " ]";
    }
    
}
