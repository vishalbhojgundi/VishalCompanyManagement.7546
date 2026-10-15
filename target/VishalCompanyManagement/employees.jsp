
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
        /* ===== Global page ===== */
        body {
            margin: 0;
            background: #f4f7fc;
            color: #202c3c;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        /* ===== Professional header ===== */
        body > header.site-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            padding: 18px 4%;
            background: linear-gradient(120deg, #14213d, #203b64);
            color: #fff;
            box-shadow: 0 4px 18px rgba(20, 33, 61, .15);
        }

        .site-header .brand h1 {
            margin: 0;
            color: #fff;
            font-size: 25px;
            font-weight: 800;
            line-height: 1.3;
        }

        .site-header .brand p {
            margin: 5px 0 0;
            color: #d3deef;
            font-size: 13px;
        }

        .site-header .main-nav {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            flex-wrap: wrap;
            gap: 7px;
        }

        .site-header .main-nav a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 14px;
            border: 1px solid transparent;
            border-radius: 8px;
            background: transparent;
            color: #edf3ff;
            font-size: 14px;
            font-weight: 650;
            text-decoration: none;
            white-space: nowrap;
            transition: background .2s ease, color .2s ease;
        }

        .site-header .main-nav a:hover {
            background: rgba(255, 255, 255, .14);
            color: #fff;
        }

        .site-header .main-nav a.active {
            background: #fff;
            color: #14213d;
        }

        /* ===== Main content ===== */
        .employees-page {
            width: min(1450px, calc(100% - 48px));
            margin: 32px auto 44px;
        }

        .employees-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 18px;
            margin-bottom: 25px;
        }

        .employees-heading h2 {
            margin: 0;
            color: #14213d;
            font-size: clamp(26px, 3vw, 34px);
            font-weight: 800;
            line-height: 1.3;
        }

        .employees-heading p {
            margin: 8px 0 0;
            color: #68778c;
            font-size: 15px;
        }

        /* ===== Buttons ===== */
        .employees-page .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            min-height: 38px;
            padding: 9px 13px;
            border: 1px solid transparent;
            border-radius: 8px;
            font-family: inherit;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
            white-space: nowrap;
            cursor: pointer;
            transition: background .2s ease, transform .2s ease;
        }

        .employees-page .btn:hover {
            transform: translateY(-1px);
        }

        .employees-page .btn-add {
            min-height: 44px;
            padding: 11px 18px;
            background: #315fce;
            color: #fff;
        }

        .employees-page .btn-add:hover {
            background: #244bb0;
        }

        .employees-page .btn-edit {
            background: #eaf1ff;
            color: #244bb0;
        }

        .employees-page .btn-edit:hover {
            background: #dce8ff;
        }

        .employees-page .btn-delete {
            background: #dc2626;
            color: #fff;
        }

        .employees-page .btn-delete:hover {
            background: #b91c1c;
        }

        .employees-page .btn-view {
            background: #f0f3f8;
            color: #34445a;
        }

        .employees-page .btn-view:hover {
            background: #e1e8f2;
        }

        /* ===== Employee table card ===== */
        .employees-panel {
            overflow: hidden;
            border: 1px solid #e0e7f0;
            border-radius: 14px;
            background: #fff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, .06);
        }

        .employees-panel-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            padding: 21px 25px;
            border-bottom: 1px solid #e0e7f0;
        }

        .employees-panel-heading h3 {
            margin: 0;
            color: #14213d;
            font-size: 21px;
            font-weight: 800;
        }

        .employees-count {
            display: inline-flex;
            align-items: center;
            padding: 7px 13px;
            border-radius: 25px;
            background: #eaf1ff;
            color: #244bb0;
            font-size: 12px;
            font-weight: 750;
        }

        .employees-table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .employees-table {
            width: 100%;
            min-width: 1050px;
            border-collapse: collapse;
            background: #fff;
            font-size: 13px;
        }

        .employees-table thead {
            background: #edf2fa;
        }

        .employees-table th {
            padding: 15px 16px;
            border-bottom: 1px solid #e0e7f0;
            color: #243e68;
            font-size: 13px;
            font-weight: 750;
            text-align: left;
            white-space: nowrap;
        }

        .employees-table td {
            padding: 15px 16px;
            border-bottom: 1px solid #edf0f5;
            color: #344054;
            vertical-align: middle;
            white-space: nowrap;
        }

        .employees-table tbody tr:hover {
            background: #f8faff;
        }

        .employees-table tbody tr:last-child td {
            border-bottom: none;
        }

        .employee-name {
            color: #14213d !important;
            font-weight: 750;
        }

        .employee-status {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 25px;
            background: #e9f8ef;
            color: #15803d;
            font-size: 11px;
            font-weight: 800;
        }

        .employee-status.inactive {
            background: #fff0f0;
            color: #c62828;
        }

        .employee-status.other {
            background: #fff5df;
            color: #925f08;
        }

        .employee-actions {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .employee-empty {
            padding: 42px 20px !important;
            color: #68778c !important;
            text-align: center;
            white-space: normal !important;
        }

        /* ===== Footer ===== */
        .employees-footer {
            padding: 22px 20px;
            margin-top: 40px;
            background: #14213d;
            color: #d3deef;
            font-size: 13px;
            text-align: center;
        }

        /* ===== Responsive layout ===== */
        @media (max-width: 800px) {
            body > header.site-header {
                align-items: flex-start;
                flex-direction: column;
                padding: 18px 22px;
            }

            .site-header .main-nav {
                width: 100%;
                justify-content: flex-start;
            }

            .site-header .main-nav a {
                padding: 9px 11px;
            }

            .employees-page {
                width: calc(100% - 28px);
                margin-top: 23px;
            }
        }

        @media (max-width: 600px) {
            .employees-heading {
                align-items: stretch;
                flex-direction: column;
            }

            .employees-heading h2 {
                font-size: 25px;
            }

            .employees-heading .btn-add {
                width: 100%;
            }

            .employees-panel-heading {
                padding: 18px;
            }
        }

        @media print {
            body > header.site-header,
            .employees-heading .btn-add,
            .employee-actions,
            .employees-footer {
                display: none !important;
            }

            body {
                background: #fff;
            }

            .employees-page {
                width: 100%;
                margin: 0;
            }

            .employees-panel {
                box-shadow: none;
            }
        }
    </style>
</head>

<body>

<header class="site-header">
    <div class="brand">
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
    </div>

    <nav class="main-nav" aria-label="Main navigation">
        <a href="${pageContext.request.contextPath}/">Home</a>

        <a class="active"
           href="${pageContext.request.contextPath}/employees">
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

<main class="employees-page">

    <section class="employees-heading">
        <div>
            <h2>Employee Management</h2>
            <p>View and manage employee information at Vishal Technologies.</p>
        </div>

        <a class="btn btn-add"
           href="${pageContext.request.contextPath}/add-employee">
            + Add Employee
        </a>
    </section>

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
                            <c:choose>
                                <c:when test="${employee.status eq 'ACTIVE'}">
                                    <span class="employee-status">ACTIVE</span>
                                </c:when>

                                <c:when test="${employee.status eq 'INACTIVE'}">
                                    <span class="employee-status inactive">INACTIVE</span>
                                </c:when>

                                <c:otherwise>
                                    <span class="employee-status other">
                                        <c:out value="${employee.status}"/>
                                    </span>
                                </c:otherwise>
                            </c:choose>
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

                                <a class="btn btn-view"
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
