
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Vishal Technologies | Company Management System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .dashboard-container {
            max-width: 1200px;
            margin: 35px auto;
            padding: 20px;
        }

        .dashboard-header {
            background: #172338;
            color: #ffffff;
            padding: 35px 25px;
            border-radius: 12px;
            text-align: center;
            margin-bottom: 35px;
        }

        .dashboard-header h1 {
            margin: 0 0 12px;
            font-size: 32px;
        }

        .dashboard-header p {
            margin: 8px 0;
            color: #e1e8f2;
        }

        .dashboard-section h2 {
            color: #172338;
            margin-bottom: 22px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px;
        }

        .dashboard-card {
            background: #ffffff;
            border: 1px solid #e0e6ef;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .dashboard-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 22px rgba(0, 0, 0, 0.10);
        }

        .dashboard-card h3 {
            color: #173b67;
            margin-top: 0;
            margin-bottom: 12px;
            font-size: 21px;
        }

        .dashboard-card p {
            color: #596579;
            line-height: 1.7;
            min-height: 50px;
        }

        .dashboard-button {
            display: inline-block;
            background: #2864e8;
            color: #ffffff;
            text-decoration: none;
            padding: 11px 18px;
            border-radius: 7px;
            font-weight: 600;
            margin-top: 8px;
            transition: background 0.2s;
        }

        .dashboard-button:hover {
            background: #174bbd;
            color: #ffffff;
        }

        .dashboard-footer {
            margin-top: 40px;
            padding: 20px;
            text-align: center;
            color: #667085;
            border-top: 1px solid #e0e6ef;
        }

        @media (max-width: 650px) {
            .dashboard-container {
                margin: 15px auto;
                padding: 12px;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .dashboard-header h1 {
                font-size: 25px;
            }

            .dashboard-card {
                padding: 20px;
            }
        }
    </style>
</head>

<body>

<div class="dashboard-container">

    <!-- Company Header -->
    <header class="dashboard-header">
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
        <p>Manage employees, departments, and attendance in one place.</p>
    </header>

    <!-- Dashboard Modules -->
    <main class="dashboard-section">

        <h2>Management Dashboard</h2>

        <div class="dashboard-grid">

            <!-- Employee Management -->
            <section class="dashboard-card">
                <h3>Employee Management</h3>

                <p>
                    View employee records, personal information,
                    department details, and employment status.
                </p>

                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/employees">
                    View Employees
                </a>
            </section>

            <!-- Add Employee -->
            <section class="dashboard-card">
                <h3>Add Employee</h3>

                <p>
                    Register a new employee and enter their
                    company and employment details.
                </p>

                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/add-employee">
                    Add Employee
                </a>
            </section>

            <!-- Search Employee -->
            <section class="dashboard-card">
                <h3>Search Employee</h3>

                <p>
                    Search for an employee and find their
                    information quickly.
                </p>

                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/searchEmployee.jsp">
                    Search Employee
                </a>
            </section>

            <!-- Department Management -->
            <section class="dashboard-card">
                <h3>Department Management</h3>

                <p>
                    View, add, edit, and delete departments
                    within Vishal Technologies.
                </p>

                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/departments">
                    Manage Departments
                </a>
            </section>

            <!-- Attendance Management -->
            <section class="dashboard-card">
                <h3>Attendance Management</h3>

                <p>
                    Mark employee attendance, record check-in
                    and check-out times, and view daily summaries.
                </p>

                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/attendance">
                    Manage Attendance
                </a>
            </section>

        </div>

    </main>

    <!-- Footer -->
    <footer class="dashboard-footer">
        <p>&copy; 2026 Vishal Technologies. All rights reserved.</p>
    </footer>

</div>

</body>
</html>
