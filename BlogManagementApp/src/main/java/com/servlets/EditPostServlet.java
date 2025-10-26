package com.servlets;

import com.dao.PostDAO;
import com.model.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editPost")
public class EditPostServlet extends HttpServlet {
    private PostDAO postDAO;

    @Override
    public void init() {
        postDAO = new PostDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postIdStr = request.getParameter("id");
        if (postIdStr == null) {
            response.sendRedirect("viewPosts.jsp");
            return;
        }

        try {
            int postId = Integer.parseInt(postIdStr);
            request.getRequestDispatcher("editPost.jsp?id=" + postId).forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("viewPosts.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postIdStr = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (postIdStr == null || title == null || content == null ||
            title.trim().isEmpty() || content.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            doGet(request, response);
            return;
        }

        try {
            int postId = Integer.parseInt(postIdStr);
            Post existingPost = postDAO.findById(postId);
            if (existingPost == null) {
                response.sendRedirect("viewPosts.jsp");
                return;
            }

            existingPost.setTitle(title.trim());
            existingPost.setContent(content.trim());

            postDAO.updatePost(existingPost);

            response.sendRedirect("viewPosts.jsp");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid post ID.");
            doGet(request, response);
        }
    }
}
