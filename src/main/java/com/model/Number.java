package com.model;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author George
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Number implements Serializable{
    private int n;
    
    public Number(){
        super();
    }
    
    public Number(int n){
        super();
        this.n = n;
    }
    
    @XmlElement
    public int getN(){
        return this.n;
    }
    
    @XmlElement
    public double getPower(){
        return Math.pow(n, 2);
    }
    
    @XmlElement
    public double getExponent(){
        return Math.exp(n);
    }
    
    private int factorial(int n){
        int f = 1;
        for(int i = 2; i <= n; i++)
            f *= i;
        return f;
    }
    
    @XmlElement
    public int getFactorial(){
        return factorial(n);
    }
}
