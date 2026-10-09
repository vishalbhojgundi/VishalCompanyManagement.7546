
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details - Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .details-container {
            max-width: 850px;
            margin: 35px auto;
            padding: 30px;
            background: white;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px;
            margin: 25px 0;
        }

        .detail-item {
            padding: 14px;
            background: #f5f7fb;
            border-radius: 8px;
            overflow-wrap: anywhere;
        }

        .detail-label {
            display: block;
            color: #64748b;
            font-size: 13px;
            margin-bottom: 7px;
        }

        .detail-value {
            color: #172033;
            font-weight: 600;
        }

        .back-button {
            display: inline-block;
            padding: 11px 18px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

        @media (max-width: 600px) {
            .details-container {
                margin: 15px;
                padding: 20px;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="details-container">

    <h1>Employee Details</h1>
    <p>Complete employee information at Vishal Technologies.</p>

    <div class="details-grid">

        <div class="detail-item">
            <span class="detail-label">Employee ID</span>
            <span class="detail-value">${employee.employeeId}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Employee Code</span>
            <span class="detail-value">${employee.employeeCode}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">First Name</span>
            <span class="detail-value">${employee.firstName}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Last Name</span>
            <span class="detail-value">${employee.lastName}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Email</span>
            <span class="detail-value">${employee.email}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Phone</span>
            <span class="detail-value">${employee.phone}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Gender</span>
            <span class="detail-value">${employee.gender}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Date of Birth</span>
            <span class="detail-value">${employee.dateOfBirth}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Department</span>
            <span class="detail-value">${departmentName}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Designation</span>
            <span class="detail-value">${employee.designation}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Joining Date</span>
            <span class="detail-value">${employee.joiningDate}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Salary</span>
            <span class="detail-value">₹${employee.salary}</span>
        </div>

        <div class="detail-item">
            <span class="detail-label">Employment Status</span>
            <span class="detail-value">${employee.status}</span>
        </div>

    </div>

    <a class="back-button"
       href="${pageContext.request.contextPath}/employees">
        Back to Employees
    </a>

</div>

</body>
</html>
