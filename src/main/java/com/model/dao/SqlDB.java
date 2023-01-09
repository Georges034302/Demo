package com.model.dao;

import java.sql.Connection;

/**
 *
 * @author George
 */
public class SqlDB {
    protected String URL = "jdbc:mysql://localhost:1433/mydb?useSSL=false&serverTimezone=UTC";
    protected String driver = "com.mysql.cj.jdbc.Driver";
    protected String db = "mydb";
    protected String dbuser = "root";
    protected String dbpassword = "<Your password goes here>";
    protected Connection conenction;
}
