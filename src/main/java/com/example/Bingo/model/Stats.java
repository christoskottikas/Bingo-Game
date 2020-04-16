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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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
    @NamedQuery(name = "Stats.findBySId", query = "SELECT s FROM Stats s WHERE s.sId = :sId"),
    @NamedQuery(name = "Stats.findBySWins", query = "SELECT s FROM Stats s WHERE s.sWins = :sWins"),
    @NamedQuery(name = "Stats.findBySGames", query = "SELECT s FROM Stats s WHERE s.sGames = :sGames")})
public class Stats implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "s_id")
    private Integer sId;
    @Column(name = "s_wins")
    private Integer sWins;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "s_games")
    private String sGames;
    @JoinColumn(name = "fku_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User fkuId;

    public Stats() {
    }

    public Stats(Integer sId) {
        this.sId = sId;
    }

    public Stats(Integer sId, String sGames) {
        this.sId = sId;
        this.sGames = sGames;
    }

    public Integer getSId() {
        return sId;
    }

    public void setSId(Integer sId) {
        this.sId = sId;
    }

    public Integer getSWins() {
        return sWins;
    }

    public void setSWins(Integer sWins) {
        this.sWins = sWins;
    }

    public String getSGames() {
        return sGames;
    }

    public void setSGames(String sGames) {
        this.sGames = sGames;
    }

    public User getFkuId() {
        return fkuId;
    }

    public void setFkuId(User fkuId) {
        this.fkuId = fkuId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sId != null ? sId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Stats)) {
            return false;
        }
        Stats other = (Stats) object;
        if ((this.sId == null && other.sId != null) || (this.sId != null && !this.sId.equals(other.sId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.Bingo.model.Stats[ sId=" + sId + " ]";
    }
    
}
