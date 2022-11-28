package com.demo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author George
 */
public class User implements Serializable{
    private int ID;
    private String name;
    private String email;
    private String password;
    private String DOB;
    private List<Blog> blogs = new ArrayList();

    public User() {
    }

    public User(String name, String email, String password, String DOB) {
        this.ID = (new Random()).nextInt(999);
        this.name = name;
        this.email = email;
        this.password = password;
        this.DOB = DOB;
    }

    public boolean login(String email, String password){
        return this.email.equals(email)&&this.password.equals(password);
    }    
    
    public boolean match(int ID){
        return this.ID == ID;
    }
    
    public boolean match(String email){
        return this.email.equals(email);
    }
    
    public void add(String text){
        this.blogs.add(new Blog(blogs.size()+1, text));
    }
    
    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }
    
    
}
