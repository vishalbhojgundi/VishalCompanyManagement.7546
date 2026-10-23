
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home | Vishal Technologies</title>

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
                Home
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/employees">
                <span class="nav-icon">♙</span>
                Employee Management
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/searchEmployee.jsp">
                <span class="nav-icon">⌕</span>
                Search Employee
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/admin-login">
                <span class="nav-icon">♙</span>
                Admin Login
            </a>

        </nav>

        <div class="sidebar-bottom">
            <div class="sidebar-help">
                <strong>Company Workspace</strong>
                <p>Access employee information and company services.</p>
            </div>
            <small>Vishal Technologies</small>
        </div>

    </aside>

    <!-- Main application area -->
    <div class="main-area">

        <!-- Header -->
        <header class="top-header">
            <div>
                <p class="eyebrow">VISHAL TECHNOLOGIES</p>
                <h1>Company Home Page</h1>
            </div>

            <div class="header-profile">
                <span class="profile-avatar">VT</span>
                <div>
                    <strong>Company Portal</strong>
                    <small>Employee Services</small>
                </div>
            </div>
        </header>

        <!-- Main content -->
        <main class="page-content">

            <article class="welcome-panel">
                <div>
                    <span class="welcome-tag">WELCOME</span>
                    <h2>Welcome to Vishal Technologies</h2>
                    <p>
                        Access employee records and search for employee
                        information through the company portal.
                        Administrative operations are available through
                        Admin Login.
                    </p>
                </div>

                <div class="welcome-mark" aria-hidden="true">VT</div>
            </article>

            <section class="section-heading">
                <div>
                    <h2>Employee Services</h2>
                    <p>Select a service to continue.</p>
                </div>
            </section>

            <!-- Only two home page cards -->
            <section class="dashboard-grid"
                     aria-label="Employee services">

                <!-- Employee Management -->
                <article class="dashboard-card">

                    <div class="card-top">
                        <span class="card-icon employee-icon">EM</span>
                        <span class="card-category">EMPLOYEES</span>
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

                <!-- Search Employee -->
                <article class="dashboard-card">

                    <div class="card-top">
                        <span class="card-icon search-icon">S</span>
                        <span class="card-category">DIRECTORY</span>
                    </div>

                    <h3>Search Employee</h3>

                    <p>
                        Find employee records quickly using
                        the employee search feature.
                    </p>

                    <a class="card-action"
                       href="${pageContext.request.contextPath}/searchEmployee.jsp">
                        Search Employees <span>→</span>
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
