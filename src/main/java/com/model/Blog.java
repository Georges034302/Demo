package com.model;

import java.io.Serializable;

public class Blog implements Serializable{
    private int number;
    private int userID;
    private String text;

    public Blog() {
    }

    public Blog(int number, int userID, String text) {
        this.number = number;
        this.userID = userID;
        this.text = text;
    }  

    public Blog(int number, String text) {
        this.number = number;
        this.text = text;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }    

    @Override
    public String toString() {
        return "ID: "+userID+"- Blog#"+number+" --> "+text;
    }   
    
}
