
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
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f3f6fc;
            color: #14213d;
            font-family: Arial, Helvetica, sans-serif;
        }

        a {
            text-decoration: none;
        }

        .admin-layout {
            min-height: 100vh;
            display: flex;
        }

        /* Sidebar */
        .admin-sidebar {
            width: 250px;
            flex-shrink: 0;
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

        .admin-sidebar nav a {
            display: block;
            padding: 12px;
            margin-bottom: 6px;
            border-radius: 7px;
            color: #dbe5f4;
        }

        .admin-sidebar nav a:hover,
        .admin-sidebar nav a.active {
            background: #2864e8;
            color: #ffffff;
        }

        .sidebar-label {
            padding: 0 10px;
            color: #9eafc9;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .logout-form {
            margin-top: auto;
            padding-top: 25px;
        }

        .logout-form button {
            width: 100%;
            padding: 12px;
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

        /* Main content */
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
            font-size: 26px;
            color: #14213d;
        }

        .admin-topbar p {
            margin: 6px 0 0;
            color: #667085;
        }

        .admin-content {
            padding: 30px;
        }

        /* Welcome panel */
        .admin-welcome {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            padding: 28px;
            margin-bottom: 25px;
            border-radius: 12px;
            background: linear-gradient(120deg, #ffffff, #edf3ff);
            border: 1px solid #dce6fa;
        }

        .admin-welcome h2 {
            margin-top: 0;
            color: #14213d;
        }

        .admin-welcome p {
            margin-bottom: 0;
            color: #667085;
            line-height: 1.7;
        }

        .welcome-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            width: 80px;
            height: 80px;
            border-radius: 20px;
            background: #14213d;
            color: #ffffff;
            font-size: 28px;
            font-weight: 800;
        }

        /* Statistics */
        .admin-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 32px;
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
            margin: 0 0 12px;
        }

        .admin-stat strong {
            color: #14213d;
            font-size: 32px;
        }

        .stat-description {
            display: block;
            margin-top: 8px;
            color: #8490a5;
            font-size: 13px;
        }

        /* Management cards */
        .section-heading {
            margin: 0 0 18px;
        }

        .section-heading h2 {
            margin: 0 0 6px;
            font-size: 23px;
        }

        .section-heading p {
            margin: 0;
            color: #667085;
        }

        .admin-modules {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .admin-module {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 24px;
            background: #ffffff;
            border: 1px solid #e3e8f0;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(20, 33, 61, .04);
            transition: transform .2s, box-shadow .2s;
        }

        .admin-module:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 28px rgba(20, 33, 61, .09);
        }

        .module-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            margin-bottom: 16px;
            border-radius: 12px;
            background: #e8efff;
            color: #2864e8;
            font-size: 17px;
            font-weight: 800;
        }

        .module-icon.add {
            background: #e2f8eb;
            color: #16834a;
        }

        .module-icon.department {
            background: #f1eaff;
            color: #7141c7;
        }

        .module-icon.attendance {
            background: #fff0db;
            color: #a85b00;
        }

        .admin-module h3 {
            margin: 0 0 10px;
            color: #14213d;
            font-size: 19px;
        }

        .admin-module p {
            margin: 0 0 20px;
            color: #667085;
            line-height: 1.7;
            flex: 1;
        }

        .admin-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 11px 15px;
            background: #2864e8;
            color: #ffffff !important;
            border-radius: 7px;
            font-weight: 700;
        }

        .admin-button:hover {
            background: #194bb8;
        }

       .admin-button.green {
           background: #2864e8;
       }

       .admin-button.green:hover {
           background: #194bb8;
       }

        .admin-footer {
            padding: 20px 30px;
            color: #8490a5;
            font-size: 13px;
            border-top: 1px solid #e3e8f0;
            background: #ffffff;
        }

        /* Responsive design */
        @media (max-width: 900px) {
            .admin-stats {
                grid-template-columns: 1fr;
            }

            .admin-modules {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {
            .admin-layout {
                flex-direction: column;
            }

            .admin-sidebar {
                width: 100%;
            }

            .admin-content {
                padding: 18px;
            }

            .admin-topbar {
                padding: 20px 18px;
            }

            .admin-welcome {
                padding: 20px;
            }

            .welcome-logo {
                display: none;
            }
        }
    </style>
</head>

<body>

<div class="admin-layout">

    <!-- Admin sidebar -->
    <aside class="admin-sidebar">

        <div class="admin-brand">
            VT | Admin Portal
        </div>

        <p class="sidebar-label">MAIN MENU</p>

        <nav aria-label="Admin navigation">

            <a class="active"
               href="${pageContext.request.contextPath}/admin/dashboard">
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/employees">
                Employee Management
            </a>

            <a href="${pageContext.request.contextPath}/departments">
                Department Management
            </a>

            <a href="${pageContext.request.contextPath}/attendance">
                Attendance Management
            </a>

        </nav>

        <form class="logout-form"
              method="post"
              action="${pageContext.request.contextPath}/admin/logout">

            <button type="submit">Sign Out</button>

        </form>

    </aside>

    <!-- Main dashboard -->
    <div class="admin-main">

        <header class="admin-topbar">

            <div>
                <h1>Admin Dashboard</h1>
                <p>Company management and administration</p>
            </div>

            <div>
                Welcome,
                <strong><c:out value="${sessionScope.admin}"/></strong>
            </div>

        </header>

        <main class="admin-content">

            <!-- Welcome panel -->
            <section class="admin-welcome">

                <div>
                    <h2>Welcome to the Admin Portal</h2>
                    <p>
                        Manage employees, departments, and attendance
                        from one central location.
                    </p>
                </div>

                <div class="welcome-logo" aria-hidden="true">
                    VT
                </div>

            </section>

            <!-- Statistics -->
            <section class="admin-stats"
                     aria-label="Company statistics">

                <article class="admin-stat">
                    <p>Total Employees</p>
                    <strong>
                        <c:out value="${employeeCount}"/>
                    </strong>
                    <span class="stat-description">
                        Employee records in the system
                    </span>
                </article>

                <article class="admin-stat">
                    <p>Total Departments</p>
                    <strong>
                        <c:out value="${departmentCount}"/>
                    </strong>
                    <span class="stat-description">
                        Departments in the company
                    </span>
                </article>

                <article class="admin-stat">
                    <p>Attendance Records Today</p>
                    <strong>
                        <c:out value="${attendanceToday}"/>
                    </strong>
                    <span class="stat-description">
                        Records entered for today
                    </span>
                </article>

            </section>

            <!-- Admin-only management options -->
            <section aria-labelledby="manage-heading">

                <div class="section-heading">
                    <h2 id="manage-heading">Manage Company</h2>
                    <p>Select an operation to continue.</p>
                </div>

                <div class="admin-modules">


<!-- Bulk Attendance -->
<article class="admin-module">

    <div class="module-icon attendance">BA</div>

    <h3>Bulk Attendance</h3>

    <p>
        Mark attendance for all active employees at once.
        Select a date and save all attendance records together.
    </p>

    <a class="admin-button"
       href="${pageContext.request.contextPath}/admin/bulk-attendance">
        Open Bulk Attendance <span>→</span>
    </a>

</article>


                    <!-- Employee list -->
                    <article class="admin-module">

                        <div class="module-icon">EM</div>

                        <h3>Employee Management</h3>

                        <p>
                            View employee records and access existing
                            employee information.
                        </p>

                        <a class="admin-button"
                           href="${pageContext.request.contextPath}/employees">
                            Open Employees <span>→</span>
                        </a>

                    </article>

                    <!-- Add Employee -->
                    <article class="admin-module">

                        <div class="module-icon add">＋</div>

                        <h3>Add Employee</h3>

                        <p>
                            Register new employees and enter their
                            personal, department, and employment details.
                        </p>

                        <a class="admin-button green"
                           href="${pageContext.request.contextPath}/add-employee">
                            Add Employee <span>→</span>
                        </a>

                    </article>

                    <!-- Department Management -->
                    <article class="admin-module">

                        <div class="module-icon department">DP</div>

                        <h3>Department Management</h3>

                        <p>
                            View, add, edit, and maintain company
                            department records.
                        </p>

                        <a class="admin-button"
                           href="${pageContext.request.contextPath}/departments">
                            Open Departments <span>→</span>
                        </a>

                    </article>

                    <!-- Attendance Management -->
                    <article class="admin-module">

                        <div class="module-icon attendance">AT</div>

                        <h3>Attendance Management</h3>

                        <p>
                            Mark employee attendance and review
                            attendance records and daily status.
                        </p>

                        <a class="admin-button"
                           href="${pageContext.request.contextPath}/attendance">
                            Open Attendance <span>→</span>
                        </a>

                    </article>

                </div>

            </section>

        </main>

        <footer class="admin-footer">
            © 2026 Vishal Technologies | Admin Portal
        </footer>

    </div>

</div>

</body>
</html>
