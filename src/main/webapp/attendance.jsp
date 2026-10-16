
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Attendance Management | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        /* ===== Page layout ===== */
        .container {
            max-width: 1500px;
            margin: 0 auto;
            padding: 24px 30px;
        }

        /* ===== Company header ===== */
        .app-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 24px;
            padding: 26px 32px;
            background: linear-gradient(120deg, #142747, #244a80);
            color: #ffffff;
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(20, 39, 71, 0.15);
        }

        .header-brand {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .brand-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 54px;
            height: 54px;
            flex-shrink: 0;
            border-radius: 14px;
            background: #ffffff;
            color: #244a80;
            font-size: 21px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .brand-info h1 {
            margin: 0;
            color: #ffffff;
            font-size: 23px;
            font-weight: 750;
        }

        .brand-info p {
            margin: 5px 0 0;
            color: #d7e4f8;
            font-size: 13px;
        }

        .header-page-info {
            text-align: right;
        }

        .header-page-info h2 {
            margin: 0;
            color: #ffffff;
            font-size: 24px;
        }

        .header-page-info p {
            margin: 7px 0 0;
            color: #d7e4f8;
            font-size: 14px;
        }

        /* ===== Main navigation ===== */
        .app-nav {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 8px;
            margin: 14px 0 28px;
            padding: 9px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            box-shadow: 0 4px 14px rgba(15, 23, 42, 0.05);
        }

        .app-nav a {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            padding: 12px 17px;
            border-radius: 8px;
            color: #40516b;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: background 0.2s ease, color 0.2s ease;
        }

        .app-nav a:hover {
            background: #edf4ff;
            color: #2458c6;
        }

        .app-nav a.active {
            background: #315fd1;
            color: #ffffff;
        }

        .nav-icon {
            font-size: 17px;
            line-height: 1;
        }

        /* ===== Main content ===== */
        main {
            min-width: 0;
        }

        .attendance-actions {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .attendance-actions h2 {
            margin: 0;
            color: #203653;
            font-size: 26px;
        }

        .date-filter {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin: 18px 0 24px;
        }

        .date-filter label {
            font-weight: 600;
            color: #334155;
        }

        .date-filter input[type="date"] {
            min-width: 220px;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            background: #ffffff;
            color: #203653;
            font: inherit;
        }

        /* ===== Summary cards ===== */
        .attendance-summary {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 16px;
            margin: 24px 0;
        }

        .summary-card {
            padding: 23px 18px;
            background: #ffffff;
            border: 1px solid #e6edf5;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
        }

        .summary-card h3 {
            margin: 0 0 12px;
            color: #52627a;
            font-size: 15px;
            font-weight: 600;
        }

        .summary-card strong {
            color: #203653;
            font-size: 30px;
        }

        /* ===== Attendance table ===== */
        .table-container {
            width: 100%;
            overflow-x: auto;
            margin-top: 24px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(15, 23, 42, 0.04);
        }

        .table-container table {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
        }

        .table-container th,
        .table-container td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #e8edf4;
            white-space: nowrap;
        }

        .table-container th {
            background: #edf3fb;
            color: #203653;
            font-size: 13px;
            font-weight: 700;
        }

        .table-container td {
            color: #475569;
            font-size: 14px;
        }

        .table-container tbody tr:hover {
            background: #f7faff;
        }

        .table-container tbody tr:last-child td {
            border-bottom: none;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 6px;
            background: #edf0f5;
            color: #334155;
            font-size: 12px;
            font-weight: 700;
        }

        /* ===== Messages and links ===== */
        .success {
            padding: 12px 16px;
            border: 1px solid #a7e4bf;
            border-radius: 8px;
            background: #ecfdf3;
            color: #166534;
        }

        .error {
            padding: 12px 16px;
            border: 1px solid #fecaca;
            border-radius: 8px;
            background: #fef2f2;
            color: #b91c1c;
        }

        .back-link {
            display: inline-block;
            margin: 24px 0 10px;
            color: #315fd1;
            font-weight: 600;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        /* ===== Responsive design ===== */
        @media (max-width: 900px) {
            .attendance-summary {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .container {
                padding: 20px;
            }
        }

        @media (max-width: 600px) {
            .container {
                padding: 12px;
            }

            .app-header {
                padding: 20px 16px;
                align-items: flex-start;
                border-radius: 10px;
            }

            .brand-logo {
                width: 46px;
                height: 46px;
            }

            .brand-info h1 {
                font-size: 18px;
            }

            .header-page-info {
                width: 100%;
                text-align: left;
            }

            .header-page-info h2 {
                font-size: 21px;
            }

            .app-nav {
                gap: 5px;
                margin-bottom: 22px;
            }

            .app-nav a {
                padding: 10px;
                font-size: 12px;
            }

            .nav-icon {
                font-size: 14px;
            }

            .attendance-actions h2 {
                font-size: 22px;
            }

            .date-filter {
                align-items: stretch;
            }

            .date-filter input[type="date"] {
                width: 100%;
                min-width: 0;
            }

            .attendance-summary {
                gap: 10px;
            }

            .summary-card {
                padding: 18px 10px;
            }

            .summary-card strong {
                font-size: 26px;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <!-- Company header -->
    <header class="app-header">
        <div class="header-brand">
            <div class="brand-logo">VT</div>

            <div class="brand-info">
                <h1>Vishal Technologies</h1>
                <p>Employee Management System</p>
            </div>
        </div>

        <div class="header-page-info">
            <h2>Attendance Management</h2>
            <p>Track employee attendance and working hours</p>
        </div>
    </header>

    <!-- Main navigation: only one navigation bar -->
    <nav class="app-nav" aria-label="Main navigation">
        <a href="${pageContext.request.contextPath}/">
            <span class="nav-icon" aria-hidden="true">&#9632;</span>
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/employees">
            <span class="nav-icon" aria-hidden="true">&#128100;</span>
            Employees
        </a>

        <a href="${pageContext.request.contextPath}/departments">
            <span class="nav-icon" aria-hidden="true">&#127970;</span>
            Departments
        </a>

        <a class="active"
           href="${pageContext.request.contextPath}/attendance"
           aria-current="page">
            <span class="nav-icon" aria-hidden="true">&#128197;</span>
            Attendance
        </a>
    </nav>

    <main>

        <!-- Success and error messages -->
        <c:if test="${param.success == 'added'}">
            <p class="success">Attendance saved successfully.</p>
        </c:if>

        <c:if test="${param.success == 'updated'}">
            <p class="success">Attendance updated successfully.</p>
        </c:if>

        <c:if test="${param.error == 'duplicate'}">
            <p class="error">
                An attendance record already exists for this employee and date.
            </p>
        </c:if>

        <!-- Page actions -->
        <div class="attendance-actions">
            <h2>Attendance Records</h2>

            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/mark-attendance">
                + Mark Attendance
            </a>
        </div>

        <!-- Date filter -->
        <form class="date-filter"
              method="get"
              action="${pageContext.request.contextPath}/attendance">

            <label for="date">Select Date:</label>

            <input type="date"
                   id="date"
                   name="date"
                   value="${selectedDate}"
                   required>

            <button class="btn btn-primary" type="submit">
                Search
            </button>

            <a class="btn"
               href="${pageContext.request.contextPath}/attendance">
                View All
            </a>
        </form>

        <!-- Attendance summary -->
        <div class="attendance-summary">

            <div class="summary-card">
                <h3>Present</h3>
                <strong><c:out value="${presentCount}"/></strong>
            </div>

            <div class="summary-card">
                <h3>Absent</h3>
                <strong><c:out value="${absentCount}"/></strong>
            </div>

            <div class="summary-card">
                <h3>On Leave</h3>
                <strong><c:out value="${leaveCount}"/></strong>
            </div>

            <div class="summary-card">
                <h3>Half Day</h3>
                <strong><c:out value="${halfDayCount}"/></strong>
            </div>

        </div>

        <!-- Attendance records table -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Employee Code</th>
                        <th>Employee Name</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Check-in</th>
                        <th>Check-out</th>
                        <th>Remarks</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="a" items="${records}">
                        <tr>
                            <td><c:out value="${a.attendanceId}"/></td>
                            <td><c:out value="${a.employeeCode}"/></td>
                            <td><c:out value="${a.employeeName}"/></td>
                            <td><c:out value="${a.attendanceDate}"/></td>

                            <td>
                                <span class="status-badge">
                                    <c:out value="${a.status}"/>
                                </span>
                            </td>

                            <td><c:out value="${a.checkIn}" default="—"/></td>
                            <td><c:out value="${a.checkOut}" default="—"/></td>
                            <td><c:out value="${a.remarks}" default="—"/></td>

                            <td>
                                <a class="btn btn-edit"
                                   href="${pageContext.request.contextPath}/edit-attendance?id=${a.attendanceId}">
                                    Edit
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty records}">
                        <tr>
                            <td colspan="9">
                                No attendance records found for this date.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <a class="back-link"
           href="${pageContext.request.contextPath}/">
            &larr; Back to Dashboard
        </a>

    </main>
</div>

</body>
</html>
