<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dao.PostDAO, com.model.Post" %>
<%
    String postIdStr = request.getParameter("id");
    if (postIdStr == null) {
        response.sendRedirect("viewPosts.jsp");
        return;
    }

    int postId = 0;
    try {
        postId = Integer.parseInt(postIdStr);
    } catch (NumberFormatException e) {
        response.sendRedirect("viewPosts.jsp");
        return;
    }

    PostDAO postDAO = new PostDAO();
    Post post = postDAO.findById(postId);

    if (post == null) {
        response.sendRedirect("viewPosts.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
    <meta charset="UTF-8" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen font-sans flex items-center justify-center">

<div class="max-w-lg w-full p-8 rounded-xl shadow border border-gray-200 bg-white">
    <h2 class="text-2xl font-bold text-gray-900 mb-6 text-center">Edit Post</h2>

    <form method="post" action="editPost?id=<%= post.getId() %>" class="flex flex-col gap-4">
        <label for="title" class="block text-gray-700 font-medium">Title</label>
        <input
            type="text"
            id="title"
            name="title"
            required
            value="<%= post.getTitle() %>"
            class="w-full px-3 py-2 border border-gray-300 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        />

        <label for="content" class="block text-gray-700 font-medium">Content</label>
        <textarea
            id="content"
            name="content"
            rows="10"
            required
            class="w-full px-3 py-2 border border-gray-300 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        ><%= post.getContent() %></textarea>

        <button
            type="submit"
            class="w-full py-3 mt-4 rounded bg-gray-900 text-white font-semibold hover:bg-gray-800 transition"
        >
            Update Post
        </button>
    </form>

    <p class="mt-6 text-center">
        <a href="viewPosts.jsp" class="text-gray-900 hover:underline font-semibold">Back to Posts</a>
    </p>
</div>

</body>
</html>
