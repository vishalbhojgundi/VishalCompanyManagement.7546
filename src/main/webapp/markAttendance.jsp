
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mark Attendance | Vishal Technologies</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Mark Attendance</h1>
        <p>Record employee attendance</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
        <a href="${pageContext.request.contextPath}/attendance">Attendance</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
    </nav>

    <main>
        <c:if test="${param.error == 'duplicate'}">
            <p class="error">Attendance has already been recorded for this employee on that date.</p>
        </c:if>
        <c:if test="${param.error == 'time'}">
            <p class="error">Check-out time must not be earlier than check-in time.</p>
        </c:if>
        <c:if test="${param.error == 'invalid'}">
            <p class="error">Please check your form entries and try again.</p>
        </c:if>

        <h2>Attendance Information</h2>

        <form method="post" action="${pageContext.request.contextPath}/mark-attendance">
            <div class="form-group">
                <label for="employeeId">Employee *</label>
                <select id="employeeId" name="employeeId" required>
                    <option value="">Select Employee</option>
                    <c:forEach var="emp" items="${employees}">
                        <option value="${emp.employeeId}">
                            <c:out value="${emp.employeeCode}"/> -
                            <c:out value="${emp.employeeName}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="attendanceDate">Attendance Date *</label>
                <input type="date" id="attendanceDate" name="attendanceDate"
                       value="${today}" required>
            </div>

            <div class="form-group">
                <label for="status">Status *</label>
                <select id="status" name="status" required>
                    <option value="PRESENT">Present</option>
                    <option value="ABSENT">Absent</option>
                    <option value="LEAVE">Leave</option>
                    <option value="HALF DAY">Half Day</option>
                </select>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-in Time</label>
                <input type="time" id="checkIn" name="checkIn">
            </div>

            <div class="form-group">
                <label for="checkOut">Check-out Time</label>
                <input type="time" id="checkOut" name="checkOut">
            </div>

            <div class="form-group">
                <label for="remarks">Remarks</label>
                <textarea id="remarks" name="remarks" maxlength="255" rows="3"></textarea>
            </div>

            <button class="btn btn-primary" type="submit">Save Attendance</button>
            <a class="btn" href="${pageContext.request.contextPath}/attendance">Cancel</a>
        </form>
    </main>
</div>
</body>
</html>
