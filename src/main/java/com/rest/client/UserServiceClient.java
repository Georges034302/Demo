package com.rest.client;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author George
 */
public class UserServiceClient {
    public static String xmlPath(String api,String fileName) throws MalformedURLException, IOException{
        URL uri = new URL(api);
        HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/xml");
        
        if(connection.getResponseCode() != 200){
            throw new RuntimeException("Failed: HTTP error code: "+connection.getInputStream());
        }
        
        BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        
        File file = new File("D:\\GitHub\\demo\\src\\main\\webapp\\WEB-INF\\"+fileName);        
        if(!file.exists())
            file.createNewFile();
        
        FileWriter writer = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(writer);
        
        String output ="";
        
        while((output = br.readLine()) != null)
            bw.write(output);
        
        bw.close();
        connection.disconnect();
        return file.getAbsolutePath();
    }
    
    public static String fetchUsers() throws IOException{
        return xmlPath("http://localhost:8080/demo/rest/userapi/users","usersgen.xml");
    }
    
    public static String getUsers() throws IOException{
        return xmlPath("http://localhost:8080/demo/rest/sqlapi/users","usersgen.xml");
    }
    
    public static String fetchUser(int ID) throws IOException{
        return xmlPath("http://localhost:8080/demo/rest/userapi/user/ID/"+ID,"usergen.xml");
    }
}
