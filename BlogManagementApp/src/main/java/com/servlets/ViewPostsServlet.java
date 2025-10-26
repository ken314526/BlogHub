package com.servlets;

import com.dao.PostDAO;
import com.model.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/posts")
public class ViewPostsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        List<Post> posts = dao.getAllPosts();
        req.setAttribute("posts", posts);
        req.getRequestDispatcher("viewPosts.jsp").forward(req, resp);
    }
}
