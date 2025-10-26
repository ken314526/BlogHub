<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%
    User user = null;
    if (session != null) user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Post</title>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen font-sans">

<div class="max-w-lg mx-auto mt-16 bg-white rounded-xl shadow border border-gray-200 p-8">
    <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Add Post</h2>
    <form method="post" action="addPost" class="flex flex-col gap-4">
        <label class="block text-gray-700 font-medium mb-1" for="title">Title</label>
        <input
            type="text"
            id="title"
            name="title"
            required
            class="w-full px-3 py-2 border border-gray-200 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        />

        <label class="block text-gray-700 font-medium mb-1" for="content">Content</label>
        <textarea
            id="content"
            name="content"
            rows="10"
            required
            class="w-full px-3 py-2 border border-gray-200 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        ></textarea>

        <button
            type="submit"
            class="w-full py-3 mt-2 rounded bg-gray-800 text-white font-semibold hover:bg-gray-700 transition"
        >
            Publish
        </button>
    </form>
    <div class="mt-6 flex justify-center gap-6">
        <a href="viewPosts.jsp"
           class="text-gray-700 hover:underline">View Posts</a>
        <span class="text-gray-300">|</span>
        <a href="logout"
           class="text-gray-700 hover:underline">Logout</a>
    </div>
</div>

</body>
</html>
