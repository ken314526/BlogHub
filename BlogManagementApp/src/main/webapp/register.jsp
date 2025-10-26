<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Blog</title>
    <meta charset="UTF-8" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen flex items-center justify-center font-sans">

<div class="max-w-md w-full p-8 rounded-xl shadow border border-gray-200 bg-white">
    <h2 class="text-2xl font-bold text-gray-900 mb-6 text-center">Register</h2>

    <c:if test="${not empty error}">
        <p class="text-red-600 mb-2 text-center font-medium">${error}</p>
    </c:if>
    <c:if test="${not empty msg}">
        <p class="text-green-600 mb-4 text-center font-medium">${msg}</p>
    </c:if>

    <form method="post" action="register" class="flex flex-col gap-4">
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

        <label for="role" class="block text-gray-700 font-medium">Role</label>
        <select
            id="role"
            name="role"
            class="w-full px-3 py-2 border border-gray-300 rounded bg-gray-50 focus:outline-none focus:border-gray-400 transition"
        >
            <option value="author">Author</option>
            <option value="admin">Admin</option>
        </select>

        <button
            type="submit"
            class="w-full py-3 mt-4 rounded bg-gray-900 text-white font-semibold hover:bg-gray-800 transition"
        >
            Register
        </button>
    </form>

    <p class="mt-6 text-center text-gray-700">
        <a href="login.jsp" class="text-gray-900 hover:underline font-semibold">Back to Login</a>
    </p>
</div>

</body>
</html>
