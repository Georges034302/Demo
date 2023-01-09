package com.app;

import com.model.Blog;
import com.model.User;
import com.model.dao.BlogSqlDAO;
import com.model.dao.SqlDBConnector;
import com.model.dao.UserSqlDAO;
import com.utils.In;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author George
 */
/* 
 * Run Maven Standalone Java app (on localhost or other server)
 * (Assuming UserSqlApp is the main class)
 * (Assuming com.app is the main class package)
 *
 * In CLI Execute: mvn exec:java -Dexec.mainClass="com.app.UserSqlApp"
 */
public class UserSqlApp {
    private SqlDBConnector connector;
    private Connection connection;
    private UserSqlDAO userSqlDAO;
    private BlogSqlDAO blogSqlDAO;
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        UserSqlApp app = new UserSqlApp();
        app.menu();
    }
    
    public UserSqlApp() throws ClassNotFoundException, SQLException{
        connector = new SqlDBConnector();
        connection = connector.connection();
        userSqlDAO = new UserSqlDAO(connection);
        blogSqlDAO = new BlogSqlDAO(connection);
    }
    
    private String read(String prompt){
        System.out.print(prompt);
        return In.nextLine();
    }
    
    //Testing the SQL Create Query
    private void testCreate() throws SQLException{
        System.out.println("Creating a new user: ");
        userSqlDAO.create(read("Name: "), read("Email: "), read("Password: "), read("Date of Birth: "));
        System.out.println("Used has been added to the database");
    }
    
    //Testing the SQL Read Query - Read by ID
    private void testRead() throws SQLException{
        int ID = Integer.parseInt(read("ID: "));
        User user = userSqlDAO.getUser(ID);        
        String exists = (user!= null) ? "User "+user.getName()+" exists in the database": "User does not exist";
        System.out.println(exists);
    }
    
    //Testing the SQL Read - Many Query
    private void testGetAll() throws SQLException{
        List<User> users = userSqlDAO.getUsers();
        users.forEach(u -> System.out.println(u));
    }
    
    //Testing the SQL Update Query - Update (name, password) by ID
    private void testUpdate() throws SQLException{
        int ID = Integer.parseInt(read("ID: "));
        User user = userSqlDAO.getUser(ID); 
        if(user != null){
            System.out.println("Update user record: ");
            String name = read("Name: ");
            String password = read("Password: ");
            userSqlDAO.update(name, password, ID);
        }else{
            System.out.println("User does not exist");
        }
    }
    
    //Testing the SQL Delete Query - by ID
    private void testDelete() throws SQLException{
        int ID = Integer.parseInt(read("ID: "));
        User user = userSqlDAO.getUser(ID); 
        if(user != null){
            System.out.println("Deleting user record: ");
            userSqlDAO.delete(ID);
        }else{
            System.out.println("User does not exist");
        }
    }
    
    //Testing Read User Blogs by ID
    private void getUserBlogs() throws SQLException{
        int ID = Integer.parseInt(read("ID: "));
        User user = userSqlDAO.getUser(ID); 
        if(user != null){
           List<Blog> blogs = blogSqlDAO.getBlogs(ID);
           blogs.forEach(b -> System.out.println(b));
        }else{
            System.out.println("User does not exist");
        }
    }
    
    //Testing Read all Blogs
    private void getAllBlogs() throws SQLException{
        List<Blog> blogs = blogSqlDAO.getBlogs();
        blogs.forEach(b -> System.out.println(b));
    }
    
    private void menu() throws SQLException{
        char c;
        help();
        while((c=read("Command [c/r/u/d/f/b/a/x]: ").charAt(0)) != 'x'){
            switch(c){
                case 'c': testCreate();break;
                case 'r': testRead(); break;
                case 'u': testUpdate(); break;
                case 'd': testDelete();break;
                case 'f': testGetAll();break;
                case 'b': getUserBlogs(); break;
                case 'a': getAllBlogs();break;
                default: help(); break;
            }
        }
    }
    private void help(){
        System.out.println("Database Operations: \n"
                + "c = Create User \n"
                + "r = Read User by ID-Password \n"
                + "u = Update User by ID \n"
                + "d = Delete User by ID\n"
                + "f = Fetch all Users\n"
                + "b = Get User Blogs\n"
                + "a = Get all Blogs");
    }
}
