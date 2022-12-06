package com.model.dao;

import com.model.Users;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

/**
 *
 * @author George
 */
public class UserDAO implements Serializable{
    private Users users;
    private String filename;
    
    public UserDAO(){  }
    
    public void save(Users users, String filename) throws JAXBException, FileNotFoundException, IOException{
        this.users = users;
        this.filename = filename;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filename);
        m.marshal(users, fout);
        m.marshal(users, System.out);
        fout.close();
    }
}
