<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*,com.model.User" %>
<%
com.model.User user = null;
    if (session != null && session.getAttribute("user") != null) {
        user = (com.model.User) session.getAttribute("user");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blog Management Application</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen font-sans">

<header class="bg-gray-800 text-white py-6 border-b border-gray-200">
    <h2 class="text-3xl font-bold text-center">Blog Management System</h2>
</header>

<div class="container mx-auto mt-16 max-w-xl bg-white p-10 rounded-xl shadow border border-gray-200 flex flex-col items-center">
    <%
        if (user != null) {
    %>
        <h3 class="text-2xl font-semibold mb-4 text-gray-800">Welcome, <%= user.getUsername() %>!</h3>
        <div class="flex flex-col gap-4 w-full items-center">
            <a href="addPost.jsp"
               class="w-full text-center bg-gray-100 text-gray-800 py-3 rounded-lg hover:bg-gray-200 transition border border-gray-200">Create New Post</a>
            <a href="viewPosts.jsp"
               class="w-full text-center bg-gray-100 text-gray-800 py-3 rounded-lg hover:bg-gray-200 transition border border-gray-200">View All Posts</a>
            <a href="logout"
               class="w-full text-center bg-gray-100 text-gray-800 py-3 rounded-lg hover:bg-gray-200 transition border border-gray-200">Logout</a>
        </div>
    <%
        } else {
    %>
        <h1 class="text-3xl font-bold mb-4 text-gray-800">Welcome to the Blog!</h1>
        <p class="text-lg mb-8 text-gray-600">Login or Register to get started.</p>
        <div class="flex gap-4 w-full justify-center">
            <a href="login.jsp"
               class="bg-gray-100 text-gray-800 py-3 px-8 rounded-lg hover:bg-gray-200 transition border border-gray-200">Login</a>
            <a href="register.jsp"
               class="bg-gray-100 text-gray-800 py-3 px-8 rounded-lg hover:bg-gray-200 transition border border-gray-200">Register</a>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
