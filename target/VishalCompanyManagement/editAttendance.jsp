
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Attendance | Vishal Technologies</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Edit Attendance</h1>
        <p>Update an attendance record</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
        <a href="${pageContext.request.contextPath}/attendance">Attendance</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
    </nav>

    <main>
        <c:if test="${param.error == 'time'}">
            <p class="error">Check-out time must not be earlier than check-in time.</p>
        </c:if>

        <h2>Attendance Information</h2>

        <form method="post" action="${pageContext.request.contextPath}/edit-attendance">
            <input type="hidden" name="attendanceId"
                   value="${attendance.attendanceId}">

            <div class="form-group">
                <label for="employeeId">Employee *</label>
                <select id="employeeId" name="employeeId" required>
                    <c:forEach var="emp" items="${employees}">
                        <option value="${emp.employeeId}"
                            <c:if test="${emp.employeeId == attendance.employeeId}">selected</c:if>>
                            <c:out value="${emp.employeeCode}"/> -
                            <c:out value="${emp.employeeName}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="attendanceDate">Attendance Date *</label>
                <input type="date" id="attendanceDate" name="attendanceDate"
                       value="${attendance.attendanceDate}" required>
            </div>

            <div class="form-group">
                <label for="status">Status *</label>
                <select id="status" name="status" required>
                    <option value="PRESENT" <c:if test="${attendance.status == 'PRESENT'}">selected</c:if>>Present</option>
                    <option value="ABSENT" <c:if test="${attendance.status == 'ABSENT'}">selected</c:if>>Absent</option>
                    <option value="LEAVE" <c:if test="${attendance.status == 'LEAVE'}">selected</c:if>>Leave</option>
                    <option value="HALF DAY" <c:if test="${attendance.status == 'HALF DAY'}">selected</c:if>>Half Day</option>
                </select>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-in Time</label>
                <input type="time" id="checkIn" name="checkIn"
                       value="${attendance.checkIn}">
            </div>

            <div class="form-group">
                <label for="checkOut">Check-out Time</label>
                <input type="time" id="checkOut" name="checkOut"
                       value="${attendance.checkOut}">
            </div>

            <div class="form-group">
                <label for="remarks">Remarks</label>
                <textarea id="remarks" name="remarks" maxlength="255" rows="3"><c:out value="${attendance.remarks}"/></textarea>
            </div>

            <button class="btn btn-primary" type="submit">Update Attendance</button>
            <a class="btn" href="${pageContext.request.contextPath}/attendance">Cancel</a>
        </form>
    </main>
</div>
</body>
</html>
