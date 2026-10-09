
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
        .attendance-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
            gap: 15px;
            margin: 20px 0;
        }

        .summary-card {
            background: #f1f5fb;
            padding: 18px;
            border-radius: 10px;
            text-align: center;
        }

        .summary-card h3 {
            margin: 0 0 8px;
            font-size: 15px;
        }

        .summary-card strong {
            font-size: 26px;
        }

        .attendance-actions {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
        }

        .date-filter {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            margin: 15px 0;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 5px;
            background: #edf0f5;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">

    <header>
        <h1>Attendance Management</h1>
        <p>Track employee attendance and working hours</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
        <a href="${pageContext.request.contextPath}/departments">Departments</a>
        <a href="${pageContext.request.contextPath}/attendance">Attendance</a>
    </nav>

    <main>

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

        <div class="attendance-actions">
            <h2>Attendance Records</h2>

            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/mark-attendance">
                + Mark Attendance
            </a>
        </div>

        <form class="date-filter" method="get"
              action="${pageContext.request.contextPath}/attendance">

            <label for="date">Select Date:</label>

            <input type="date" id="date" name="date"
                   value="${selectedDate}" required>

            <button class="btn btn-primary" type="submit">Search</button>

            <a class="btn"
               href="${pageContext.request.contextPath}/attendance">
                View All
            </a>
        </form>

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
                        <td colspan="9">No attendance records found for this date.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <p>
            <a href="${pageContext.request.contextPath}/">
                ← Back to Dashboard
            </a>
        </p>

    </main>
</div>

</body>
</html>
