/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Bingo.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findByUId", query = "SELECT u FROM User u WHERE u.uId = :uId"),
    @NamedQuery(name = "User.findByUFirstname", query = "SELECT u FROM User u WHERE u.uFirstname = :uFirstname"),
    @NamedQuery(name = "User.findByULastname", query = "SELECT u FROM User u WHERE u.uLastname = :uLastname"),
    @NamedQuery(name = "User.findByUDateofbirth", query = "SELECT u FROM User u WHERE u.uDateofbirth = :uDateofbirth"),
    @NamedQuery(name = "User.findByUUsername", query = "SELECT u FROM User u WHERE u.uUsername = :uUsername"),
    @NamedQuery(name = "User.findByUPassword", query = "SELECT u FROM User u WHERE u.uPassword = :uPassword"),
    @NamedQuery(name = "User.findByUEmail", query = "SELECT u FROM User u WHERE u.uEmail = :uEmail"),
    @NamedQuery(name = "User.findByUBalance", query = "SELECT u FROM User u WHERE u.uBalance = :uBalance")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "u_id")
    private Integer uId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "u_firstname")
    private String uFirstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "u_lastname")
    private String uLastname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "u_dateofbirth")
    @Temporal(TemporalType.DATE)
    private Date uDateofbirth;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "u_username")
    private String uUsername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "u_password")
    private String uPassword;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "u_email")
    private String uEmail;
    @Basic(optional = false)
    @NotNull
    @Column(name = "u_balance")
    private int uBalance;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkuId")
    private Collection<Stats> statsCollection;

    public User() {
    }

    public User(Integer uId) {
        this.uId = uId;
    }

    public User(Integer uId, String uFirstname, String uLastname, Date uDateofbirth, String uUsername, String uPassword, String uEmail, int uBalance) {
        this.uId = uId;
        this.uFirstname = uFirstname;
        this.uLastname = uLastname;
        this.uDateofbirth = uDateofbirth;
        this.uUsername = uUsername;
        this.uPassword = uPassword;
        this.uEmail = uEmail;
        this.uBalance = uBalance;
    }

    public Integer getUId() {
        return uId;
    }

    public void setUId(Integer uId) {
        this.uId = uId;
    }

    public String getUFirstname() {
        return uFirstname;
    }

    public void setUFirstname(String uFirstname) {
        this.uFirstname = uFirstname;
    }

    public String getULastname() {
        return uLastname;
    }

    public void setULastname(String uLastname) {
        this.uLastname = uLastname;
    }

    public Date getUDateofbirth() {
        return uDateofbirth;
    }

    public void setUDateofbirth(Date uDateofbirth) {
        this.uDateofbirth = uDateofbirth;
    }

    public String getUUsername() {
        return uUsername;
    }

    public void setUUsername(String uUsername) {
        this.uUsername = uUsername;
    }

    public String getUPassword() {
        return uPassword;
    }

    public void setUPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getUEmail() {
        return uEmail;
    }

    public void setUEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public int getUBalance() {
        return uBalance;
    }

    public void setUBalance(int uBalance) {
        this.uBalance = uBalance;
    }

    @XmlTransient
    public Collection<Stats> getStatsCollection() {
        return statsCollection;
    }

    public void setStatsCollection(Collection<Stats> statsCollection) {
        this.statsCollection = statsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (uId != null ? uId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.uId == null && other.uId != null) || (this.uId != null && !this.uId.equals(other.uId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.Bingo.model.User[ uId=" + uId + " ]";
    }
    
}
