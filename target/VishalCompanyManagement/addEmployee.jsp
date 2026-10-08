<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Add Employee - Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<header class="header">

    <div>
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
    </div>

    <nav>
        <a href="${pageContext.request.contextPath}/">Home</a>
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

        <h2>Add New Employee</h2>

        <p>
            Enter employee information below.
        </p>

    </div>


    <% if ("true".equals(request.getParameter("error"))) { %>

        <div class="error-message">
            Employee could not be added.
            Please check the entered information.
        </div>

    <% } %>


    <form action="${pageContext.request.contextPath}/add-employee"
          method="post"
          class="employee-form">


        <div class="form-grid">

            <div class="form-group">

                <label>Employee Code</label>

                <input type="text"
                       name="employeeCode"
                       placeholder="EMP006"
                       required>

            </div>


            <div class="form-group">

                <label>First Name</label>

                <input type="text"
                       name="firstName"
                       required>

            </div>


            <div class="form-group">

                <label>Last Name</label>

                <input type="text"
                       name="lastName">

            </div>


            <div class="form-group">

                <label>Email</label>

                <input type="email"
                       name="email"
                       required>

            </div>


            <div class="form-group">

                <label>Phone</label>

                <input type="text"
                       name="phone">

            </div>


            <div class="form-group">

                <label>Gender</label>

                <select name="gender">

                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>

                </select>

            </div>


            <div class="form-group">

                <label>Date of Birth</label>

                <input type="date"
                       name="dateOfBirth">

            </div>


            <div class="form-group">

                <label>Department</label>

                <select name="departmentId"
                        required>

                    <option value="">
                        Select Department
                    </option>

                    <option value="1">
                        Information Technology
                    </option>

                    <option value="2">
                        Human Resources
                    </option>

                    <option value="3">
                        Finance
                    </option>

                    <option value="4">
                        Marketing
                    </option>

                    <option value="5">
                        Administration
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label>Designation</label>

                <input type="text"
                       name="designation"
                       placeholder="Java Developer"
                       required>

            </div>


            <div class="form-group">

                <label>Joining Date</label>

                <input type="date"
                       name="joiningDate"
                       required>

            </div>


            <div class="form-group">

                <label>Salary</label>

                <input type="number"
                       name="salary"
                       step="0.01"
                       min="0"
                       placeholder="55000"
                       required>

            </div>


            <div class="form-group">

                <label>Status</label>

                <select name="status">

                    <option value="ACTIVE">
                        Active
                    </option>

                    <option value="INACTIVE">
                        Inactive
                    </option>

                    <option value="ON_LEAVE">
                        On Leave
                    </option>

                </select>

            </div>

        </div>


        <div class="form-actions">

            <button type="submit"
                    class="btn btn-primary">
                Add Employee
            </button>

            <a href="${pageContext.request.contextPath}/employees"
               class="btn btn-secondary">
                Cancel
            </a>

        </div>

    </form>

</main>

</body>
</html>