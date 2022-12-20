/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rest.client;

import com.model.Location;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author George
 */
public class LocationServiceClient {

    public static void showInfo(String ip) {
        String uri = "http://ip-api.com/xml/" + ip;
        Client client = Client.create();
        WebResource r = client.resource(uri);
        ClientResponse response = r.type(MediaType.APPLICATION_XML).get(ClientResponse.class);
        int status = response.getStatus();
        System.out.println("Server Status: "+ ((status == 200) ? "Running":"Failed"));

         
        if (status == 200) {
            Location location = response.getEntity(Location.class);
            System.out.println("Query about IP:  \t" + location.getIp());
            System.out.println("Country: \t\t" + location.getCountry());
            System.out.println("Country Code: \t\t" + location.getCountryCode());
            System.out.println("Region Code: \t\t" + location.getRegion());
            System.out.println("Region Name: \t\t" + location.getRegionName());
            System.out.println("City: \t\t\t" + location.getCity());
            System.out.println("PostCode: \t\t" + location.getZip());
            System.out.println("Latitude: \t\t" + location.getLatitude());
            System.out.println("Longitude: \t\t" + location.getLongitude());
            System.out.println("Timezone: \t\t" + location.getTimezone());
            System.out.println("ISP: \t\t\t" + location.getIsp());
            System.out.println("Organization: \t\t" + location.getOrg());
            System.out.println("Info: \t\t\t" + location.getInfo());
        } else {
            System.out.println("ERROR: Web service returned with status: " + status);
        }

    }
}
