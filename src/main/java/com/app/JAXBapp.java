package com.app;

import com.model.User;
import com.model.Users;
import com.model.dao.UserDAO;
import java.io.IOException;
import javax.xml.bind.JAXBException;

/**
 *
 * @author George
 */
public class JAXBapp {
    public static void main(String[] args) throws JAXBException, IOException {
        UserDAO userDAO = new UserDAO();
        
        Users users = new Users();
        User user = new User("Alice Ming", "alice.m@example.com", "Helloworld222", "1999-02-03");
        user.add("JAXB is useful");
        users.add(user);
        
        userDAO.save(users, "D:\\GitHub\\demo\\src\\main\\webapp\\WEB-INF\\users.xml");
    }
}
