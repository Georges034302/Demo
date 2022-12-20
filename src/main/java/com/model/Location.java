/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author George
 */
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "query")
public class Location implements Serializable{

    @XmlElement(name = "country")
    private String country;
    @XmlElement(name = "countryCode")
    private String countryCode;
    @XmlElement(name = "region")
    private String region;
    @XmlElement(name = "regionName")
    private String regionName;
    @XmlElement(name = "city")
    private String city;
    @XmlElement(name = "zip")
    private String zip;
    @XmlElement(name = "lat")
    private double latitude;
    @XmlElement(name = "lon")
    private double longitude;
    @XmlElement(name = "timezone")
    private String timezone;
    @XmlElement(name = "isp")
    private String isp;
    @XmlElement(name = "org")
    private String org;
    @XmlElement(name = "as")
    private String info;
    @XmlElement(name = "query")
    private String ip;

    public Location() {
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String countryName) {
        this.country = countryName;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String regionCode) {
        this.region = regionCode;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zipCode) {
        this.zip = zipCode;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getIsp() {
        return isp;
    }

    public void setIsp(String isp) {
        this.isp = isp;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org ) {
        this.org = org ;
    }

    public String getTimezone() {
        return timezone;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
