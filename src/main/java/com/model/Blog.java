package com.model;

import java.io.Serializable;

public class Blog implements Serializable{
    private int number;
    private String text;

    public Blog() {
    }

    public Blog(int number, String text) {
        this.number = number;
        this.text = text;
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
    
}
