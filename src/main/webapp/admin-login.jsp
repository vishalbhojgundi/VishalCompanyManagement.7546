
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
            box-sizing: border-box;
            background: linear-gradient(135deg, #14213d, #294d83);
        }

        .login-card {
            width: 100%;
            max-width: 420px;
            padding: 36px;
            box-sizing: border-box;
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

        .login-card label {
            display: block;
            margin-bottom: 8px;
            color: #14213d;
            font-weight: 600;
        }

        .login-card input {
            display: block;
            width: 100%;
            box-sizing: border-box;
            padding: 13px 14px;
            border: 1px solid #d0d9e8;
            border-radius: 8px;
            background: #eaf1ff;
            color: #14213d;
            font-size: 16px;
        }

        .login-card input:focus {
            outline: 2px solid #2864e8;
            outline-offset: 1px;
        }

        /* Password field and eye button */
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .login-card .password-wrapper input {
            padding-right: 52px;
        }

        .password-wrapper .toggle-password {
            position: absolute;
            top: 50%;
            right: 8px;
            transform: translateY(-50%);

            display: flex;
            align-items: center;
            justify-content: center;

            width: 38px;
            height: 38px;
            padding: 8px;

            border: none;
            border-radius: 6px;
            background: transparent;
            color: #64748b;
            cursor: pointer;
        }

        .password-wrapper .toggle-password:hover {
            background: #dce7ff;
            color: #2864e8;
        }

        .password-wrapper .toggle-password:focus-visible {
            outline: 2px solid #2864e8;
            outline-offset: 2px;
        }

        .password-wrapper .toggle-password svg {
            width: 22px;
            height: 22px;
        }

        .login-card button.sign-in-button {
            display: block;
            width: 100%;
            border: none;
            padding: 14px;
            border-radius: 7px;
            background: #2864e8;
            color: #ffffff;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
        }

        .login-card button.sign-in-button:hover {
            background: #194bb8;
        }

        .login-card .error,
        .login-card .success {
            margin: 0 0 20px;
            padding: 14px;
            border-radius: 9px;
            line-height: 1.5;
        }

        .login-card .error {
            color: #b42318;
            background: #fff1f0;
            border: 1px solid #ffccc7;
        }

        .login-card .success {
            color: #18794e;
            background: #ecfdf3;
            border: 1px solid #abefc6;
        }

        .login-back {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #2864e8;
            text-decoration: none;
        }

        .login-back:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 26px 22px;
            }
        }
    </style>
</head>

<body class="login-page">

<div class="login-card">

    <!-- Company branding -->
    <div class="login-brand">
        <div class="login-logo">VT</div>
        <h1>Admin Login</h1>
        <p>Vishal Technologies Management Portal</p>
    </div>

    <!-- Login error message -->
    <c:if test="${not empty error}">
        <p class="error">
            <c:out value="${error}"/>
        </p>
    </c:if>

    <!-- Logout success message -->
    <c:if test="${param.logout eq 'success'}">
        <p class="success">
            You have logged out successfully.
        </p>
    </c:if>

    <!-- Login form -->
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

            <div class="password-wrapper">

                <input type="password"
                       id="password"
                       name="password"
                       autocomplete="current-password"
                       placeholder="Enter your password"
                       required>

                <!-- Show/hide password button -->
                <button type="button"
                        class="toggle-password"
                        id="togglePassword"
                        aria-label="Show password"
                        aria-pressed="false">

                    <!-- Eye icon -->
                    <svg id="eyeIcon"
                         xmlns="http://www.w3.org/2000/svg"
                         viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2"
                         stroke-linecap="round"
                         stroke-linejoin="round"
                         aria-hidden="true">

                        <path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/>
                        <circle cx="12" cy="12" r="3"/>
                    </svg>

                </button>
            </div>
        </div>

        <button type="submit" class="sign-in-button">
            Sign In
        </button>

    </form>

    <!-- Return to public home page -->
    <a class="login-back"
       href="${pageContext.request.contextPath}/">
        ← Back to Main Website
    </a>

</div>

<!-- Password visibility toggle -->
<script>
    const passwordInput = document.getElementById("password");
    const toggleButton = document.getElementById("togglePassword");
    const eyeIcon = document.getElementById("eyeIcon");

    const eyeOpen = `
        <path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/>
        <circle cx="12" cy="12" r="3"/>
    `;

    const eyeClosed = `
        <path d="M3 3l18 18"/>
        <path d="M10.6 10.6a2 2 0 002.8 2.8"/>
        <path d="M9.9 5.2A11 11 0 0112 5c6.4 0 10 7 10 7a15 15 0 01-4 4.5"/>
        <path d="M6.2 6.2A15 15 0 012 12s3.6 7 10 7a10 10 0 004-.8"/>
    `;

    toggleButton.addEventListener("click", function () {
        const showPassword = passwordInput.type === "password";

        passwordInput.type = showPassword ? "text" : "password";

        eyeIcon.innerHTML = showPassword ? eyeClosed : eyeOpen;

        toggleButton.setAttribute(
            "aria-label",
            showPassword ? "Hide password" : "Show password"
        );

        toggleButton.setAttribute(
            "aria-pressed",
            String(showPassword)
        );
    });
</script>

</body>
</html>
