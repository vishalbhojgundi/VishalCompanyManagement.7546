
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | Vishal Technologies</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body.login-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: linear-gradient(135deg, #14213d, #294d83);
        }

        .login-card {
            width: 100%;
            max-width: 420px;
            padding: 36px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, .2);
        }

        .login-brand {
            text-align: center;
            margin-bottom: 26px;
        }

        .login-logo {
            display: inline-flex;
            width: 60px;
            height: 60px;
            align-items: center;
            justify-content: center;
            margin-bottom: 14px;
            border-radius: 16px;
            background: #2864e8;
            color: white;
            font-weight: 800;
            font-size: 21px;
        }

        .login-brand h1 {
            margin: 0;
            color: #14213d;
            font-size: 24px;
        }

        .login-brand p {
            margin: 6px 0 0;
            color: #667085;
        }

        .login-card .form-group {
            margin-bottom: 18px;
        }

        .login-card button {
            width: 100%;
            border: none;
            padding: 13px;
            border-radius: 7px;
            background: #2864e8;
            color: #ffffff;
            font-weight: 700;
            cursor: pointer;
        }

        .login-card button:hover {
            background: #194bb8;
        }

        .login-back {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>

<body class="login-page">

<div class="login-card">

    <div class="login-brand">
        <div class="login-logo">VT</div>
        <h1>Admin Login</h1>
        <p>Vishal Technologies Management Portal</p>
    </div>

    <% if (request.getAttribute("error") != null) { %>
        <p class="error">
            <%= org.apache.taglibs.standard.functions.Functions.escapeXml(
                    request.getAttribute("error").toString()) %>
        </p>
    <% } %>

    <% if ("success".equals(request.getParameter("logout"))) { %>
        <p class="success">You have logged out successfully.</p>
    <% } %>

    <form method="post"
          action="${pageContext.request.contextPath}/admin-login">

        <div class="form-group">
            <label for="username">Username</label>
            <input type="text"
                   id="username"
                   name="username"
                   autocomplete="username"
                   maxlength="50"
                   required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password"
                   id="password"
                   name="password"
                   autocomplete="current-password"
                   required>
        </div>

        <button type="submit">Sign In</button>
    </form>

    <a class="login-back"
       href="${pageContext.request.contextPath}/">
        ← Back to Main Website
    </a>

</div>
</body>
</html>
