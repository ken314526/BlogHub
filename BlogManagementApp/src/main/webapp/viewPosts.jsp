<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.PostDAO,com.dao.UserDAO,com.model.Post,com.model.User,java.util.List,java.util.ArrayList" %>
<%
    User user = null;
	if (session != null) user = (User) session.getAttribute("user");
	if (user == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	
    PostDAO postDAO = new PostDAO();
    List<Post> posts = new ArrayList<>();

	if (user != null) {
	    posts = postDAO.getAllPosts();
	}
	UserDAO userDAO = new UserDAO();
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Posts</title>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen font-sans">

<div class="max-w-4xl mx-auto mt-16 p-8 bg-white rounded-xl shadow border border-gray-200">
    <h2 class="text-3xl font-bold text-gray-900 mb-6 text-center">All Posts</h2>

    <div class="mb-6 text-center text-gray-700">
        <% if (user != null) { %>
            Logged in as: <span class="font-semibold"><%= user.getUsername() %></span> (<%= user.getRole() %>) &nbsp;|&nbsp;
            <a href="addPost" class="hover:underline">Add Post</a> &nbsp;|&nbsp;
            <a href="logout" class="hover:underline">Logout</a>
        <% } %>
    </div>

    <hr class="border-gray-300 mb-6" />

    <% if (posts.isEmpty()) { %>
        <p class="text-center text-gray-600">No posts yet.</p>
    <% } else { 
           for (Post p : posts) {
               User author = userDAO.findById(p.getAuthorId());
    %>
        <div class="border border-gray-300 rounded-lg p-6 mb-6 hover:shadow-md transition-shadow">
            <div class="flex justify-between items-center mb-4 text-gray-600">
                <div><h3 class="text-xl font-semibold text-gray-900 mb-2"><%= p.getTitle() %></h3></div>
                <small class="text-right">
                    By <span class="font-semibold"><%= (author != null ? author.getUsername() : "Unknown") %></span> 
                    on <%= p.getCreatedAt() %>
                </small>
            </div>

            <p class="whitespace-pre-wrap text-gray-800 mb-4"><%= p.getContent() %></p>

            <% if (user != null && (user.getRole().equals("admin") || user.getUsername().equals(author.getUsername()))) { %>
                <div class="flex justify-end gap-3">
                    <a href="editPost.jsp?id=<%= p.getId() %>" 
                        class="px-4 py-2 bg-gray-100 text-gray-800 rounded hover:bg-gray-200 transition text-sm"
                    >Edit</a>
                    <a href="deletePost?id=<%= p.getId() %>" 
                        onclick="return confirm('Are you sure you want to delete this post?');"
                        class="px-4 py-2 bg-gray-100 text-gray-800 rounded hover:bg-gray-200 transition text-sm"
                    >Delete</a>
                </div>
            <% } %>
        </div>
    <% } 
       } %>
</div>

</body>
</html>
