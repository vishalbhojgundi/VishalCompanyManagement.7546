<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <title>Search Employee - Vishal Technologies</title>

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

            <h2>Search Employee</h2>

            <p>
                Search by employee code, name, email or designation.
            </p>

        </div>

    </div>


    <form action="${pageContext.request.contextPath}/search-employee"
          method="get"
          class="search-form">

        <input type="text"
               name="keyword"
               value="${keyword}"
               placeholder="Enter employee code, name, email..."
               required>

        <button type="submit"
                class="btn btn-primary">

            Search

        </button>

    </form>


    <div class="table-container">

        <table>

            <thead>

            <tr>

                <th>ID</th>
                <th>Employee Code</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Salary</th>
                <th>Status</th>

            </tr>

            </thead>


            <tbody>

            <c:choose>

                <c:when test="${empty employees}">

                    <tr>

                        <td colspan="8"
                            class="empty-message">

                            No employee found.

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
                                ${employee.employeeCode}
                            </td>

                            <td>
                                ${employee.firstName}
                                ${employee.lastName}
                            </td>

                            <td>
                                ${employee.email}
                            </td>

                            <td>
                                ${employee.departmentName}
                            </td>

                            <td>
                                ${employee.designation}
                            </td>

                            <td>
                                ₹${employee.salary}
                            </td>

                            <td>
                                ${employee.status}
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