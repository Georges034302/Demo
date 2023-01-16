/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Blog;
import com.model.User;
import com.model.dao.BlogSqlDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author George
 */
public class BlogServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        BlogSqlDAO blogSqlDAO = (BlogSqlDAO) session.getAttribute("blogSqlDAO");
        User user = (User) session.getAttribute("user");
        String text = request.getParameter("blog");
        if (text != null) {
            try {
                blogSqlDAO.createBlog(user.getID(), text);
            } catch (SQLException ex) {
                Logger.getLogger(BlogServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        session.setAttribute("user", user);
        request.getRequestDispatcher("main.jsp").include(request, response);
    }    
}
