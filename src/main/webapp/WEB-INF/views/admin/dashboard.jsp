
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .admin-layout {
            min-height: 100vh;
            display: flex;
        }

        .admin-sidebar {
            width: 250px;
            padding: 24px 16px;
            background: #14213d;
            color: #ffffff;
            display: flex;
            flex-direction: column;
        }

        .admin-brand {
            color: #ffffff;
            font-size: 18px;
            font-weight: 800;
            padding: 10px;
            margin-bottom: 28px;
        }

        .admin-sidebar a {
            display: block;
            padding: 12px;
            margin-bottom: 6px;
            border-radius: 7px;
            color: #dbe5f4;
        }

        .admin-sidebar a:hover {
            background: #263a5e;
            color: #ffffff;
        }

        .admin-main {
            flex: 1;
            min-width: 0;
        }

        .admin-topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            padding: 22px 30px;
            background: #ffffff;
            border-bottom: 1px solid #e3e8f0;
        }

        .admin-topbar h1 {
            margin: 0;
            font-size: 24px;
            color: #14213d;
        }

        .admin-content {
            padding: 30px;
        }

        .admin-welcome {
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 12px;
            background: linear-gradient(120deg, #ffffff, #edf3ff);
            border: 1px solid #dce6fa;
        }

        .admin-welcome h2 {
            margin-top: 0;
            color: #14213d;
        }

        .admin-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .admin-stat {
            padding: 24px;
            background: #ffffff;
            border: 1px solid #e3e8f0;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(20, 33, 61, .05);
        }

        .admin-stat p {
            color: #667085;
            margin: 0 0 10px;
        }

        .admin-stat strong {
            color: #14213d;
            font-size: 32px;
        }

        .admin-modules {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .admin-module {
            padding: 23px;
            background: #ffffff;
            border: 1px solid #e3e8f0;
            border-radius: 12px;
        }

        .admin-module h3 {
            margin-top: 0;
            color: #14213d;
        }

        .admin-module p {
            color: #667085;
        }

        .admin-button {
            display: inline-block;
            padding: 10px 14px;
            background: #2864e8;
            color: #ffffff !important;
            border-radius: 7px;
            font-weight: 600;
        }

        .admin-button:hover {
            background: #194bb8;
        }

        .logout-form {
            margin-top: auto;
            padding-top: 20px;
        }

        .logout-form button {
            width: 100%;
            padding: 11px;
            border: 1px solid #52627c;
            border-radius: 7px;
            background: transparent;
            color: #ffffff;
            cursor: pointer;
            font: inherit;
        }

        .logout-form button:hover {
            background: #263a5e;
        }

        @media (max-width: 800px) {
            .admin-layout {
                flex-direction: column;
            }

            .admin-sidebar {
                width: 100%;
            }

            .admin-stats,
            .admin-modules {
                grid-template-columns: 1fr;
            }

            .admin-content {
                padding: 18px;
            }
        }
    </style>
</head>

<body>

<div class="admin-layout">

    <aside class="admin-sidebar">
        <div class="admin-brand">VT | Admin Portal</div>

        <a href="${pageContext.request.contextPath}/admin/dashboard">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/employees">
            Employees
        </a>

        <a href="${pageContext.request.contextPath}/departments">
            Departments
        </a>

        <a href="${pageContext.request.contextPath}/attendance">
            Attendance
        </a>

        <form class="logout-form"
              method="post"
              action="${pageContext.request.contextPath}/admin/logout">

            <button type="submit">Sign Out</button>
        </form>
    </aside>

    <div class="admin-main">

        <header class="admin-topbar">
            <h1>Admin Dashboard</h1>
            <div>
                Welcome,
                <strong><c:out value="${sessionScope.admin}"/></strong>
            </div>
        </header>

        <main class="admin-content">

            <section class="admin-welcome">
                <h2>Welcome to the Admin Portal</h2>
                <p>
                    Manage company employees, departments,
                    and attendance from one central location.
                </p>
            </section>

            <section class="admin-stats">

                <article class="admin-stat">
                    <p>Total Employees</p>
                    <strong><c:out value="${employeeCount}"/></strong>
                </article>

                <article class="admin-stat">
                    <p>Total Departments</p>
                    <strong><c:out value="${departmentCount}"/></strong>
                </article>

                <article class="admin-stat">
                    <p>Attendance Records Today</p>
                    <strong><c:out value="${attendanceToday}"/></strong>
                </article>

            </section>

            <h2>Manage Company</h2>

            <section class="admin-modules">

                <article class="admin-module">
                    <h3>Employee Management</h3>
                    <p>View, add, edit, search, and manage employee records.</p>
                    <a class="admin-button"
                       href="${pageContext.request.contextPath}/employees">
                        Open Employees
                    </a>
                </article>

                <article class="admin-module">
                    <h3>Department Management</h3>
                    <p>Maintain department names and descriptions.</p>
                    <a class="admin-button"
                       href="${pageContext.request.contextPath}/departments">
                        Open Departments
                    </a>
                </article>

                <article class="admin-module">
                    <h3>Attendance Management</h3>
                    <p>Review attendance records and daily attendance status.</p>
                    <a class="admin-button"
                       href="${pageContext.request.contextPath}/attendance">
                        Open Attendance
                    </a>
                </article>

                <article class="admin-module">
                    <h3>Main Dashboard</h3>
                    <p>Return to the main company management dashboard.</p>
                    <a class="admin-button"
                       href="${pageContext.request.contextPath}/">
                        Main Dashboard
                    </a>
                </article>

            </section>

        </main>
    </div>

</div>

</body>
</html>
