
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Management | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .employees-page {
            width: min(1450px, calc(100% - 40px));
            margin: 32px auto;
        }

        .employees-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 24px;
        }

        .employees-header h2 {
            margin: 0;
            color: #14213d;
            font-size: 28px;
        }

        .employees-header p {
            margin: 6px 0 0;
            color: #68778c;
        }

        .employees-panel {
            overflow: hidden;
            border: 1px solid #e0e7f0;
            border-radius: 12px;
            background: #ffffff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, 0.06);
        }

        .employees-panel-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            padding: 20px 22px;
            border-bottom: 1px solid #e0e7f0;
        }

        .employees-panel-heading h3 {
            margin: 0;
            color: #14213d;
            font-size: 18px;
        }

        .employees-count {
            padding: 5px 11px;
            border-radius: 20px;
            background: #eaf1ff;
            color: #244bb0;
            font-size: 12px;
            font-weight: 700;
        }

        .employees-table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .employees-table {
            width: 100%;
            min-width: 1050px;
            border-collapse: collapse;
            font-size: 13px;
        }

        .employees-table thead {
            background: #edf2fa;
        }

        .employees-table th {
            padding: 15px 16px;
            color: #243e68;
            font-size: 12px;
            font-weight: 750;
            text-align: left;
            white-space: nowrap;
            border-bottom: 1px solid #e0e7f0;
        }

        .employees-table td {
            padding: 14px 16px;
            color: #344054;
            border-bottom: 1px solid #edf0f5;
            white-space: nowrap;
        }

        .employees-table tbody tr:hover {
            background: #f8faff;
        }

        .employees-table tbody tr:last-child td {
            border-bottom: none;
        }

        .employee-name {
            color: #14213d;
            font-weight: 700;
        }

        .employee-status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #e9f8ef;
            color: #15803d;
            font-size: 11px;
            font-weight: 750;
        }

        .employee-status.inactive {
            background: #fff0f0;
            color: #c62828;
        }

        .employee-actions {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .employee-actions .btn {
            min-height: 32px;
            padding: 6px 10px;
            font-size: 12px;
            white-space: nowrap;
        }

        .employee-empty {
            padding: 45px 20px !important;
            color: #68778c !important;
            text-align: center;
            white-space: normal !important;
        }

        .employees-footer {
            padding: 18px;
            color: #68778c;
            font-size: 12px;
            text-align: center;
        }

        @media (max-width: 650px) {
            .employees-page {
                width: calc(100% - 24px);
                margin: 20px auto;
            }

            .employees-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .employees-header h2 {
                font-size: 23px;
            }

            .employees-header .btn {
                width: 100%;
            }

            .employees-panel-heading {
                padding: 16px;
            }
        }
    </style>
</head>

<body>

<header>
    <div>
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
    </div>

    <nav aria-label="Main navigation">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
        <a href="${pageContext.request.contextPath}/add-employee">Add Employee</a>
        <a href="${pageContext.request.contextPath}/searchEmployee.jsp">Search</a>
    </nav>
</header>

<main class="employees-page">

    <div class="employees-header">
        <div>
            <h2>Employee Management</h2>
            <p>View and manage employee information at Vishal Technologies.</p>
        </div>

        <a class="btn"
           href="${pageContext.request.contextPath}/add-employee">
            + Add Employee
        </a>
    </div>

    <section class="employees-panel">
        <div class="employees-panel-heading">
            <h3>Employee Directory</h3>
            <span class="employees-count">Employee Records</span>
        </div>

        <div class="employees-table-wrap">
            <table class="employees-table">
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
                        <td class="employee-name">
                            <c:out value="${employee.firstName}"/>
                            <c:out value="${employee.lastName}"/>
                        </td>

                        <td><c:out value="${employee.email}"/></td>
                        <td><c:out value="${employee.phone}"/></td>
                        <td><c:out value="${employee.departmentName}"/></td>
                        <td><c:out value="${employee.designation}"/></td>
                        <td><c:out value="${employee.joiningDate}"/></td>
                        <td>₹<c:out value="${employee.salary}"/></td>

                        <td>
                            <span class="employee-status ${employee.status eq 'ACTIVE' ? '' : 'inactive'}">
                                <c:out value="${employee.status}"/>
                            </span>
                        </td>

                        <td>
                            <div class="employee-actions">
                                <a class="btn btn-edit"
                                   href="${pageContext.request.contextPath}/edit-employee?id=${employee.employeeId}">
                                    Edit
                                </a>

                                <a class="btn btn-delete"
                                   href="${pageContext.request.contextPath}/delete-employee?id=${employee.employeeId}"
                                   onclick="return confirm('Are you sure you want to delete this employee?');">
                                    Delete
                                </a>

                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/employee-details?id=${employee.employeeId}">
                                    View
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty employees}">
                    <tr>
                        <td colspan="9" class="employee-empty">
                            No employees found. Add an employee to see records here.
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </section>

</main>

<footer class="employees-footer">
    © 2026 Vishal Technologies. All rights reserved.
</footer>

</body>
</html>
