
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Vishal Technologies</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="app-layout">

    <!-- Sidebar -->
    <aside class="sidebar">
        <a class="brand" href="${pageContext.request.contextPath}/">
            <span class="brand-logo">VT</span>
            <span class="brand-text">
                <strong>Vishal Technologies</strong>
                <small>Company Portal</small>
            </span>
        </a>

        <p class="sidebar-label">MAIN MENU</p>

        <nav class="sidebar-nav" aria-label="Main navigation">
            <a class="nav-link active"
               href="${pageContext.request.contextPath}/">
                <span class="nav-icon">⌂</span>
                Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/employees">
                <span class="nav-icon">♙</span>
                Employees
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/add-employee">
                <span class="nav-icon">＋</span>
                Add Employee
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/searchEmployee.jsp">
                <span class="nav-icon">⌕</span>
                Search Employee
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/departments">
                <span class="nav-icon">▦</span>
                Departments
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/attendance">
                <span class="nav-icon">◷</span>
                Attendance
            </a>
        </nav>

        <div class="sidebar-bottom">
            <div class="sidebar-help">
                <strong>Company Workspace</strong>
                <p>Manage your company operations in one place.</p>
            </div>
            <small>Vishal Technologies</small>
        </div>
    </aside>

    <!-- Main application area -->
    <div class="main-area">

        <!-- Header -->
        <header class="top-header">
            <div>
                <p class="eyebrow">COMPANY MANAGEMENT SYSTEM</p>
                <h1>Management Dashboard</h1>
            </div>

            <div class="header-profile">
                <span class="profile-avatar">VT</span>
                <div>
                    <strong>Administrator</strong>
                    <small>Management Portal</small>
                </div>
            </div>
        </header>

        <!-- Article / main content -->
        <main class="page-content">

            <article class="welcome-panel">
                <div>
                    <span class="welcome-tag">WELCOME</span>
                    <h2>Welcome to Vishal Technologies</h2>
                    <p>
                        Manage employees, departments, and attendance
                        through your company management workspace.
                    </p>
                </div>
                <div class="welcome-mark" aria-hidden="true">VT</div>
            </article>

            <section class="section-heading">
                <div>
                    <h2>Management Modules</h2>
                    <p>Select a module to continue your work.</p>
                </div>
            </section>

            <section class="dashboard-grid"
                     aria-label="Management modules">

                <article class="dashboard-card">
                    <div class="card-top">
                        <span class="card-icon employee-icon">EM</span>
                        <span class="card-category">PEOPLE</span>
                    </div>
                    <h3>Employee Management</h3>
                    <p>
                        View employee records, personal information,
                        designations, and employment status.
                    </p>
                    <a class="card-action"
                       href="${pageContext.request.contextPath}/employees">
                        View Employees <span>→</span>
                    </a>
                </article>

                <article class="dashboard-card">
                    <div class="card-top">
                        <span class="card-icon add-icon">＋</span>
                        <span class="card-category">PEOPLE</span>
                    </div>
                    <h3>Add Employee</h3>
                    <p>
                        Register new employees and enter their
                        company and employment details.
                    </p>
                    <a class="card-action"
                       href="${pageContext.request.contextPath}/add-employee">
                        Add Employee <span>→</span>
                    </a>
                </article>

                <article class="dashboard-card">
                    <div class="card-top">
                        <span class="card-icon search-icon">S</span>
                        <span class="card-category">DIRECTORY</span>
                    </div>
                    <h3>Search Employee</h3>
                    <p>
                        Find employee records quickly using
                        the existing employee search feature.
                    </p>
                    <a class="card-action"
                       href="${pageContext.request.contextPath}/searchEmployee.jsp">
                        Search Employees <span>→</span>
                    </a>
                </article>

                <article class="dashboard-card">
                    <div class="card-top">
                        <span class="card-icon department-icon">DP</span>
                        <span class="card-category">ORGANIZATION</span>
                    </div>
                    <h3>Department Management</h3>
                    <p>
                        View, add, edit, and maintain
                        your company department records.
                    </p>
                    <a class="card-action"
                       href="${pageContext.request.contextPath}/departments">
                        Manage Departments <span>→</span>
                    </a>
                </article>

                <article class="dashboard-card">
                    <div class="card-top">
                        <span class="card-icon attendance-icon">AT</span>
                        <span class="card-category">TIME & ATTENDANCE</span>
                    </div>
                    <h3>Attendance Management</h3>
                    <p>
                        Record employee attendance, check-in times,
                        check-out times, and daily summaries.
                    </p>
                    <a class="card-action"
                       href="${pageContext.request.contextPath}/attendance">
                        Manage Attendance <span>→</span>
                    </a>
                </article>

            </section>

        </main>

        <!-- Footer -->
        <footer class="app-footer">
            <span>© 2026 Vishal Technologies</span>
            <span>Company Management System</span>
        </footer>

    </div>
</div>

</body>
</html>
