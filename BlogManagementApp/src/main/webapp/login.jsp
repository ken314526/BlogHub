<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.Post,com.model.User" %>
<%
    User user = null;
	if (session != null) user = (User) session.getAttribute("user");
	if (user != null) {
		response.sendRedirect(request.getContextPath());
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Blog</title>
    <meta charset="UTF-8" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen flex items-center justify-center font-sans">

<div class="max-w-md w-full p-8 rounded-xl shadow border border-gray-200 bg-white">
    <h2 class="text-2xl font-bold text-gray-900 mb-6 text-center">Login</h2>

    <c:if test="${not empty error}">
        <p class="text-red-600 mb-4 text-center font-medium">${error}</p>
    </c:if>

    <form method="post" action="login" class="flex flex-col gap-4">
        <label for="username" class="block text-gray-700 font-medium">Username</label>
        <input
            type="text"
            id="username"
            name="username"
            required
            class="w-full px-3 py-2 border border-gray-300 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        />

        <label for="password" class="block text-gray-700 font-medium">Password</label>
        <input
            type="password"
            id="password"
            name="password"
            required
            class="w-full px-3 py-2 border border-gray-300 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        />

        <button
            type="submit"
            class="w-full py-3 mt-4 rounded bg-gray-900 text-white font-semibold hover:bg-gray-800 transition"
        >
            Login
        </button>
    </form>

    <p class="mt-6 text-center text-gray-700">
        New user? <a href="register.jsp" class="text-gray-900 hover:underline font-semibold">Register here</a>
    </p>
</div>

</body>
</html>
