<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Employees - Vishal Technologies</title>

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

    <!-- Page Header -->

    <section class="page-header">

        <div>
            <h2>Employee Management</h2>
            <p>All employees of Vishal Technologies</p>
        </div>

        <a href="${pageContext.request.contextPath}/addEmployee.jsp"
           class="btn btn-primary">
            + Add Employee
        </a>

    </section>


    <!-- Success Message -->

    <c:if test="${param.success == 'deleted'}">

        <div class="alert alert-success">
            Employee deleted successfully.
        </div>

    </c:if>


    <!-- Error Message -->

    <c:if test="${param.error == 'delete'}">

        <div class="alert alert-error">
            Failed to delete employee.
        </div>

    </c:if>


    <!-- Employee Table -->

    <section class="table-card">

        <table>

            <thead>

            <tr>

                <th>Name</th>

                <th>Email</th>

                <th>Phone</th>

                <th>Department</th>

                <th>Designation</th>

                <th>Joining Date</th>

                <th>Salary</th>

                <th>Status</th>

                <th>Actions</th>

            </tr>

            </thead>


            <tbody>

            <c:forEach var="employee" items="${employees}">

                <tr>

                    <td>
                        ${employee.firstName}
                        ${employee.lastName}
                    </td>

                    <td>
                        ${employee.email}
                    </td>

                    <td>
                        ${employee.phone}
                    </td>

                    <td>
                        ${employee.departmentName}
                    </td>

                    <td>
                        ${employee.designation}
                    </td>

                    <td>
                        ${employee.joiningDate}
                    </td>

                    <td>
                        ₹${employee.salary}
                    </td>

                    <td>

                        <span class="status-badge">
                            ${employee.status}
                        </span>

                    </td>

                    <td>

                        <div class="action-buttons">

                            <a href="${pageContext.request.contextPath}/edit-employee?id=${employee.employeeId}"
                               class="btn-edit">
                                Edit
                            </a>

                            <a href="${pageContext.request.contextPath}/delete-employee?id=${employee.employeeId}"
                               class="btn-delete"
                               onclick="return confirm('Are you sure you want to delete this employee?');">
                                Delete
                            </a>

                        </div>

                    </td>

                </tr>

            </c:forEach>


            <!-- No Employees -->

            <c:if test="${empty employees}">

                <tr>

                    <td colspan="9" class="no-data">
                        No employees found.
                    </td>

                </tr>

            </c:if>

            </tbody>

        </table>

    </section>

</main>


<footer class="footer">

    <p>
        © 2026 Vishal Technologies. All Rights Reserved.
    </p>

</footer>

</body>

</html>