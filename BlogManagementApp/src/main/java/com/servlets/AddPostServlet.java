package com.servlets;

import com.dao.PostDAO;
import com.model.Post;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addPost")
public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User user = (User) s.getAttribute("user");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        Post post = new Post(0, title, content, user.getId(), null);
        PostDAO dao = new PostDAO();
        boolean ok = dao.addPost(post);

        if (ok) {
            resp.sendRedirect("viewPosts.jsp");
        } else {
            req.setAttribute("error", "Failed to add post");
            req.getRequestDispatcher("addPost.jsp").forward(req, resp);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        req.getRequestDispatcher("addPost.jsp").forward(req, resp);
    }
}
