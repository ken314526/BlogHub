<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" import="jakarta.servlet.http.*, jakarta.servlet.*,com.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navbar</title>
    <style>
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            color: white;
            padding: 10px 20px;
            font-family: Arial, sans-serif;
        }

        .navbar .left {
            font-size: 20px;
            font-weight: bold;
        }

        .navbar .right a, .navbar .right span {
            color: white;
            text-decoration: none;
            margin-left: 15px;
        }

        .navbar .right a:hover {
            text-decoration: underline;
        }

        .navbar .right button {
            background-color: #555;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .navbar .right button:hover {
            background-color: #777;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="left">WebApp</div>
        <div class="right">
            <%
				com.model.User user = null;
				if (session != null && session.getAttribute("user") != null) {
				    user = (com.model.User) session.getAttribute("user");
				}
                if (user != null) {
            %>
                <span>Welcome, <%= user.getUsername() %></span>
                <form action="logout" method="post" style="display:inline;">
                    <button type="submit">Logout</button>
                </form>
            <%
                } else {
            %>
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
