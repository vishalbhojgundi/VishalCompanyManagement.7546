<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

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

            <h2>Employee Management</h2>

            <p>
                All employees of Vishal Technologies
            </p>

        </div>


        <a href="${pageContext.request.contextPath}/addEmployee.jsp"
           class="btn btn-primary">

            + Add Employee

        </a>

    </div>


    <div class="table-container">

        <table>

            <thead>

            <tr>

                <th>ID</th>
                <th>Employee Code</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Joining Date</th>
                <th>Salary</th>
                <th>Status</th>

            </tr>

            </thead>


            <tbody>

            <c:choose>

                <c:when test="${empty employees}">

                    <tr>

                        <td colspan="10"
                            class="empty-message">

                            No employees found.

                        </td>

                    </tr>

                </c:when>


                <c:otherwise>

                    <c:forEach var="employee"
                               items="${employees}">

                        <tr>

                            <td>
                                ${employee.employeeId}
                            </td>

                            <td>
                                <strong>
                                    ${employee.employeeCode}
                                </strong>
                            </td>

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

                                <span class="status">
                                    ${employee.status}
                                </span>

                            </td>

                        </tr>

                    </c:forEach>

                </c:otherwise>

            </c:choose>

            </tbody>

        </table>

    </div>

</main>

</body>

</html>