package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author George
 */
public class SqlDBConnector extends SqlDB{
    public SqlDBConnector() throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        super.conenction = DriverManager.getConnection(URL, dbuser, dbpassword);
    }
    
    public Connection connection(){
        return this.conenction;
    }
    
    public void closeConnection() throws SQLException{
        this.conenction.close();
    }
}
