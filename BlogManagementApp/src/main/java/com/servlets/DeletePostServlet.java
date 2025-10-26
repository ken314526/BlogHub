package com.servlets;

import java.io.IOException;

import com.dao.PostDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postIdStr = request.getParameter("id");
        if (postIdStr == null) {
            response.sendRedirect("viewPosts.jsp");
            return;
        }

        try {
            int postId = Integer.parseInt(postIdStr);
            PostDAO postDAO = new PostDAO();
            postDAO.deletePost(postId);
        } catch (NumberFormatException e) { }
        
        response.sendRedirect("viewPosts.jsp");
    }
}
