package com.app;

import com.model.Users;
import com.model.dao.UserDAO;
import com.model.dao.XmlTransformer;
import java.io.FileNotFoundException;
import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.stream.StreamResult;

/**
 *
 * @author George
 */
public class TransformerApp {
    public static void main(String[] args) throws JAXBException, FileNotFoundException, TransformerException {
        XmlTransformer transformer = new XmlTransformer();
        String xslPath = "D:\\GitHub\\demo\\src\\main\\webapp\\xsl\\users.xsl";
        UserDAO userDAO = new UserDAO();
        String xmlPath = "D:\\GitHub\\demo\\src\\main\\webapp\\WEB-INF\\users.xml";
        userDAO.setFileName(xmlPath);
        Users users = userDAO.getUsers();
        String output = "D:\\GitHub\\demo\\src\\main\\webapp\\output.html";
        
        transformer.transform(xslPath, users, new StreamResult(output));
    }
}

