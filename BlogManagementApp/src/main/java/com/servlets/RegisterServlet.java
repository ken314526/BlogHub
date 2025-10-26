package com.servlets;

import com.dao.UserDAO;
import com.model.User;
import com.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        if (role == null || (!role.equals("admin") && !role.equals("author"))) role = "author";

        String hashed = PasswordUtil.hashPassword(password);
        User user = new User(0, username, hashed, role);
        UserDAO dao = new UserDAO();
        boolean ok = dao.registerUser(user);

        if (ok) {
            req.setAttribute("msg", "Registration successful. Please login.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Registration failed (maybe username exists).");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession s = req.getSession(false);
        if (s != null && s.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath());
            return;
        }
        
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }
}
