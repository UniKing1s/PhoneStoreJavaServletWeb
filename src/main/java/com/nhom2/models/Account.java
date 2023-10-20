package com.nhom2.models;

import java.util.Date;

public class Account {
    private int id;
    private String tk;
    private String mk;
    private String email;
    private Date timeSignIn;
    private String name;
    private boolean isAdmin;
    
    public Account() {
        
    }
    
    public Account(int id, String tk, String mk, String email, Date timeSignIn, String name, boolean isAdmin) {
        this.id = id;
        this.tk = tk;
        this.mk = mk;
        this.email = email;
        this.timeSignIn = timeSignIn;
        this.name = name;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTk() {
        return tk;
    }
    public void setTk(String tk) {
        this.tk = tk;
    }
    public String getMk() {
        return mk;
    }
    public void setMk(String mk) {
        this.mk = mk;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Date getTimeSignIn() {
        return timeSignIn;
    }
    public void setTimeSignIn(Date timeSignIn) {
        this.timeSignIn = timeSignIn;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public boolean isAdmin() {
        return isAdmin;
    }
    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
}
