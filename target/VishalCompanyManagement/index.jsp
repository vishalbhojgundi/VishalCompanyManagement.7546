<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <title>Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .dashboard {
            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 25px;
        }

        .card {
            background: white;

            padding: 30px;

            border-radius: 10px;

            box-shadow:
                0 2px 8px
                rgba(0,0,0,0.08);
        }

        .card h3 {
            margin-top: 0;
        }

        .card a {
            display: inline-block;

            margin-top: 15px;

            text-decoration: none;
        }

    </style>

</head>


<body>

<header class="header">

    <div>

        <h1>Vishal Technologies</h1>

        <p>Company Management System</p>

    </div>


    <nav>

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/employees">
            Employees
        </a>

        <a href="${pageContext.request.contextPath}/addEmployee.jsp">
            Add Employee
        </a>

        <a href="${pageContext.request.contextPath}/searchEmployee.jsp">
            Search
        </a>

    </nav>

</header>


<main class="container">

    <div class="page-header">

        <div>

            <h2>Company Dashboard</h2>

            <p>
                Welcome to Vishal Technologies
                Company Management System
            </p>

        </div>

    </div>


    <div class="dashboard">


        <div class="card">

            <h3>👨‍💼 Employee Management</h3>

            <p>
                Manage employee information,
                departments and designations.
            </p>

            <a href="${pageContext.request.contextPath}/employees"
               class="btn btn-primary">

                View Employees

            </a>

        </div>


        <div class="card">

            <h3>➕ Add Employee</h3>

            <p>
                Add a new employee to
                Vishal Technologies.
            </p>

            <a href="${pageContext.request.contextPath}/addEmployee.jsp"
               class="btn btn-primary">

                Add Employee

            </a>

        </div>


        <div class="card">

            <h3>🔎 Search Employee</h3>

            <p>
                Quickly find employees
                using employee information.
            </p>

            <a href="${pageContext.request.contextPath}/searchEmployee.jsp"
               class="btn btn-primary">

                Search Employee

            </a>

        </div>


    </div>

</main>

</body>

</html>