
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulk Attendance | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            background: #f3f6fc;
            color: #172747;
            font-family: Arial, Helvetica, sans-serif;
        }

        .bulk-page {
            max-width: 1250px;
            margin: 0 auto;
            padding: 28px 20px 45px;
        }

        .bulk-header {
            padding: 28px;
            margin-bottom: 22px;
            border-radius: 15px;
            background: linear-gradient(120deg, #14213d, #2864e8);
            color: white;
        }

        .bulk-header h1 {
            margin: 0 0 10px;
            color: white;
            font-size: 30px;
        }

        .bulk-header p {
            margin: 0;
            color: #dce7ff;
            line-height: 1.6;
        }

        .bulk-panel {
            margin-bottom: 22px;
            padding: 22px;
            border: 1px solid #e0e7f0;
            border-radius: 13px;
            background: white;
            box-shadow: 0 5px 20px rgba(20, 33, 61, .04);
        }

        .date-form {
            display: flex;
            align-items: end;
            flex-wrap: wrap;
            gap: 14px;
        }

        .date-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: 700;
        }

        .date-form input {
            min-height: 42px;
            padding: 9px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
        }

        .btn {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            min-height: 42px;
            padding: 10px 16px;
            border: none;
            border-radius: 7px;
            background: #2864e8;
            color: white;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
        }

        .btn:hover { background: #194bb8; }

        .btn-light {
            background: #eaf0ff;
            color: #2457c5;
        }

        .btn-light:hover { background: #dce7ff; }

        .message {
            padding: 13px 16px;
            margin-bottom: 18px;
            border-radius: 8px;
            line-height: 1.5;
        }

        .success {
            color: #176b3a;
            background: #e5f8ec;
        }

        .error {
            color: #a61b1b;
            background: #fff0f0;
        }

        .table-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 14px;
            margin-bottom: 18px;
        }

        .table-heading h2 {
            margin: 0 0 6px;
            font-size: 22px;
        }

        .table-heading p {
            margin: 0;
            color: #64748b;
            line-height: 1.5;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
        }

        table {
            width: 100%;
            min-width: 750px;
            border-collapse: collapse;
        }

        thead { background: #edf2fa; }

        th, td {
            padding: 13px 14px;
            border-bottom: 1px solid #e8edf5;
            text-align: left;
            vertical-align: middle;
        }

        th {
            color: #243e68;
            font-size: 13px;
        }

        td { font-size: 14px; }

        tbody tr:hover { background: #f8faff; }

        .employee-code {
            color: #64748b;
            font-size: 12px;
        }

        .status-select, .remarks-input {
            width: 100%;
            min-width: 140px;
            min-height: 40px;
            padding: 8px 10px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            background: white;
            color: #172747;
        }

        .remarks-input { min-width: 180px; }

        .bottom-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 14px;
            margin-top: 20px;
        }

        .bottom-actions p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        .empty-message {
            padding: 30px;
            text-align: center;
            color: #64748b;
        }

        @media (max-width: 600px) {
            .bulk-page { padding: 15px 10px 30px; }
            .bulk-header, .bulk-panel { padding: 18px; }
            .bulk-header h1 { font-size: 24px; }
            .date-form > div { width: 100%; }
            .date-form input { width: 100%; }
            .date-form .btn { width: 100%; }
            .bottom-actions .btn { width: 100%; }
        }
    </style>
</head>

<body>

<div class="bulk-page">

    <header class="bulk-header">
        <h1>Bulk Attendance Management</h1>
        <p>
            Record attendance for all active employees in one place.
            Select the date, review each status, and save once.
        </p>
    </header>

    <c:if test="${param.success eq 'saved'}">
        <div class="message success">
            Bulk attendance saved successfully.
        </div>
    </c:if>

    <c:if test="${param.error eq 'invalid'}">
        <div class="message error">
            Some information is invalid or incomplete. Reload the page and try again.
        </div>
    </c:if>

    <c:if test="${param.error eq 'duplicate'}">
        <div class="message error">
            An attendance conflict occurred. Reload the page and try again.
        </div>
    </c:if>

    <section class="bulk-panel">

        <form class="date-form" method="get"
              action="${pageContext.request.contextPath}/admin/bulk-attendance">

            <div>
                <label for="date">Attendance Date</label>
                <input type="date"
                       id="date"
                       name="date"
                       value="${selectedDate}"
                       required>
            </div>

            <button class="btn" type="submit">Load Employees</button>

            <a class="btn btn-light"
               href="${pageContext.request.contextPath}/admin/dashboard">
                Back to Admin Dashboard
            </a>

        </form>

    </section>

    <section class="bulk-panel">

        <div class="table-heading">
            <div>
                <h2>Employee Attendance</h2>
                <p>
                    Select a status for every employee.
                    Existing records for this date are loaded automatically.
                </p>
            </div>

            <button class="btn btn-light"
                    type="button"
                    onclick="markAllPresent()">
                Mark All Present
            </button>
        </div>

        <c:choose>
            <c:when test="${empty employees}">
                <div class="empty-message">
                    No active employees were found.
                </div>
            </c:when>

            <c:otherwise>

                <form id="bulkForm"
                      method="post"
                      action="${pageContext.request.contextPath}/admin/bulk-attendance">

                    <input type="hidden"
                           name="attendanceDate"
                           value="${selectedDate}">

                    <div class="table-wrap">
                        <table>
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Employee</th>
                                <th>Attendance Status</th>
                                <th>Remarks (Optional)</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="emp" items="${employees}" varStatus="loop">
                                <tr>
                                    <td><c:out value="${loop.count}"/></td>

                                    <td>
                                        <strong>
                                            <c:out value="${emp.employeeName}"/>
                                        </strong>
                                        <br>
                                        <span class="employee-code">
                                            <c:out value="${emp.employeeCode}"/>
                                        </span>

                                        <input type="hidden"
                                               name="employeeId"
                                               value="${emp.employeeId}">
                                    </td>

                                    <td>
                                        <select class="status-select"
                                                name="status"
                                                required>

                                            <option value=""
                                                <c:if test="${empty emp.status}">
                                                    selected
                                                </c:if>>
                                                Select Status
                                            </option>

                                            <option value="PRESENT"
                                                <c:if test="${emp.status eq 'PRESENT'}">
                                                    selected
                                                </c:if>>
                                                Present
                                            </option>

                                            <option value="ABSENT"
                                                <c:if test="${emp.status eq 'ABSENT'}">
                                                    selected
                                                </c:if>>
                                                Absent
                                            </option>

                                            <option value="LEAVE"
                                                <c:if test="${emp.status eq 'LEAVE'}">
                                                    selected
                                                </c:if>>
                                                Leave
                                            </option>

                                            <option value="HALF DAY"
                                                <c:if test="${emp.status eq 'HALF DAY'}">
                                                    selected
                                                </c:if>>
                                                Half Day
                                            </option>

                                        </select>
                                    </td>

                                    <td>
                                        <input class="remarks-input"
                                               type="text"
                                               name="remarks"
                                               maxlength="255"
                                               value="<c:out value='${emp.remarks}'/>"
                                               placeholder="Optional note">
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="bottom-actions">
                        <p>
                            Review all employee statuses before saving.
                        </p>

                        <button class="btn" type="submit">
                            Save All Attendance
                        </button>
                    </div>

                </form>

            </c:otherwise>
        </c:choose>

    </section>

</div>

<script>
    function markAllPresent() {
        const confirmed = confirm(
            "Mark every active employee as PRESENT for this date?"
        );

        if (!confirmed) {
            return;
        }

        document.querySelectorAll(".status-select").forEach(function (select) {
            select.value = "PRESENT";
        });
    }

    document.getElementById("bulkForm")?.addEventListener("submit", function (event) {
        const selects = document.querySelectorAll(".status-select");

        for (const select of selects) {
            if (!select.value) {
                event.preventDefault();
                alert("Please select a status for every employee.");
                select.focus();
                return;
            }
        }

        if (!confirm("Save attendance for all employees on this date?")) {
            event.preventDefault();
        }
    });
</script>

</body>
</html>
