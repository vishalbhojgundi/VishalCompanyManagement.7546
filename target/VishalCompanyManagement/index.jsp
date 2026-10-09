
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Vishal Technologies | Dashboard</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .dashboard-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .dashboard-header {
            text-align: center;
            padding: 35px 20px;
            background: #173b67;
            color: white;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .dashboard-header h1 {
            margin: 0 0 10px;
        }

        .dashboard-header p {
            margin: 0;
        }

        .dashboard-section h2 {
            margin-bottom: 20px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .dashboard-card {
            background: white;
            border: 1px solid #e0e5ec;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .dashboard-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.10);
        }

        .dashboard-card h3 {
            margin-top: 0;
            color: #173b67;
        }

        .dashboard-card p {
            color: #555;
            line-height: 1.6;
            min-height: 48px;
        }

        .dashboard-button {
            display: inline-block;
            padding: 10px 16px;
            background: #173b67;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 8px;
        }

        .dashboard-button:hover {
            background: #24558f;
            color: white;
        }

        .dashboard-footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            color: #666;
        }
    </style>
</head>

<body>

<div class="dashboard-container">

    <header class="dashboard-header">
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
        <p>Manage your employees and departments in one place.</p>
    </header>

    <main class="dashboard-section">

        <h2>Management Dashboard</h2>

        <div class="dashboard-grid">

            <!-- View Employees -->
            <section class="dashboard-card">
                <h3>Employee Management</h3>
                <p>View employee records and their information.</p>
                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/employees">
                    View Employees
                </a>
            </section>

            <!-- Add Employee -->
            <section class="dashboard-card">
                <h3>Add Employee</h3>
                <p>Register a new employee in the company.</p>
                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/add-employee">
                    Add Employee
                </a>
            </section>

            <!-- Search Employee -->
            <section class="dashboard-card">
                <h3>Search Employee</h3>
                <p>Find an employee using the search page.</p>
                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/searchEmployee.jsp">
                    Search Employee
                </a>
            </section>

            <!-- Department Management -->
            <section class="dashboard-card">
                <h3>Department Management</h3>
                <p>View, add, edit, and delete company departments.</p>
                <a class="dashboard-button"
                   href="${pageContext.request.contextPath}/departments">
                    Manage Departments
                </a>
            </section>

        </div>

    </main>

    <footer class="dashboard-footer">
        <p>&copy; 2026 Vishal Technologies. All rights reserved.</p>
    </footer>

</div>

</body>
</html>
