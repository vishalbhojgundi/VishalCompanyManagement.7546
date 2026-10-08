<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Edit Employee - Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<header class="header">

    <div>
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
    </div>

</header>


<main class="container">

    <section class="form-card">

        <div class="page-header">

            <div>
                <h2>Edit Employee</h2>
                <p>Update employee information</p>
            </div>

            <a href="${pageContext.request.contextPath}/employees"
               class="btn btn-secondary">
                ← Back to Employees
            </a>

        </div>


        <form action="${pageContext.request.contextPath}/edit-employee"
              method="post">


            <!-- Employee ID -->

            <input type="hidden"
                   name="employeeId"
                   value="${employee.employeeId}">


            <div class="form-grid">


                <!-- Employee Code -->

                <div class="form-group">

                    <label>Employee Code</label>

                    <input type="text"
                           name="employeeCode"
                           value="${employee.employeeCode}"
                           required>

                </div>


                <!-- First Name -->

                <div class="form-group">

                    <label>First Name</label>

                    <input type="text"
                           name="firstName"
                           value="${employee.firstName}"
                           required>

                </div>


                <!-- Last Name -->

                <div class="form-group">

                    <label>Last Name</label>

                    <input type="text"
                           name="lastName"
                           value="${employee.lastName}">

                </div>


                <!-- Email -->

                <div class="form-group">

                    <label>Email</label>

                    <input type="email"
                           name="email"
                           value="${employee.email}"
                           required>

                </div>


                <!-- Phone -->

                <div class="form-group">

                    <label>Phone</label>

                    <input type="text"
                           name="phone"
                           value="${employee.phone}">

                </div>


                <!-- Gender -->

                <div class="form-group">

                    <label>Gender</label>

                    <select name="gender">

                        <option value="">Select Gender</option>

                        <option value="Male"
                            ${employee.gender == 'Male' ? 'selected' : ''}>
                            Male
                        </option>

                        <option value="Female"
                            ${employee.gender == 'Female' ? 'selected' : ''}>
                            Female
                        </option>

                        <option value="Other"
                            ${employee.gender == 'Other' ? 'selected' : ''}>
                            Other
                        </option>

                    </select>

                </div>


                <!-- Date of Birth -->

                <div class="form-group">

                    <label>Date of Birth</label>

                    <input type="date"
                           name="dateOfBirth"
                           value="${employee.dateOfBirth}">

                </div>


                <!-- Department -->

                <div class="form-group">

                    <label>Department ID</label>

                    <input type="number"
                           name="departmentId"
                           value="${employee.departmentId}"
                           required>

                </div>


                <!-- Designation -->

                <div class="form-group">

                    <label>Designation</label>

                    <input type="text"
                           name="designation"
                           value="${employee.designation}"
                           required>

                </div>


                <!-- Joining Date -->

                <div class="form-group">

                    <label>Joining Date</label>

                    <input type="date"
                           name="joiningDate"
                           value="${employee.joiningDate}"
                           required>

                </div>


                <!-- Salary -->

                <div class="form-group">

                    <label>Salary</label>

                    <input type="number"
                           name="salary"
                           step="0.01"
                           value="${employee.salary}"
                           required>

                </div>


                <!-- Status -->

                <div class="form-group">

                    <label>Status</label>

                    <select name="status">

                        <option value="ACTIVE"
                            ${employee.status == 'ACTIVE' ? 'selected' : ''}>
                            ACTIVE
                        </option>

                        <option value="INACTIVE"
                            ${employee.status == 'INACTIVE' ? 'selected' : ''}>
                            INACTIVE
                        </option>

                        <option value="ON_LEAVE"
                            ${employee.status == 'ON_LEAVE' ? 'selected' : ''}>
                            ON LEAVE
                        </option>

                    </select>

                </div>


            </div>


            <div class="form-actions">

                <a href="${pageContext.request.contextPath}/employees"
                   class="btn btn-secondary">
                    Cancel
                </a>

                <button type="submit"
                        class="btn btn-primary">
                    Update Employee
                </button>

            </div>


        </form>

    </section>

</main>


<footer class="footer">

    <p>
        © 2026 Vishal Technologies. All Rights Reserved.
    </p>

</footer>

</body>

</html>