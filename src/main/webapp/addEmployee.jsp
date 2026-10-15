
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Employee | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        /* ===== Page layout ===== */
        .add-employee-page {
            width: min(1100px, calc(100% - 40px));
            margin: 32px auto 48px;
        }

        .add-page-heading {
            margin-bottom: 24px;
        }

        .add-page-heading h2 {
            margin: 0;
            color: #14213d;
            font-size: clamp(26px, 3vw, 34px);
            font-weight: 800;
            line-height: 1.3;
        }

        .add-page-heading p {
            margin: 8px 0 0;
            color: #68778c;
            font-size: 15px;
        }

        /* ===== Explicit header and navigation ===== */
        body > header.site-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            padding: 18px 4%;
            background: linear-gradient(120deg, #14213d, #203b64);
            color: #ffffff;
            box-shadow: 0 4px 18px rgba(20, 33, 61, .15);
        }

        .site-header .brand h1 {
            margin: 0;
            color: #ffffff;
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
            color: #ffffff;
        }

        .site-header .main-nav a.active {
            background: #ffffff;
            color: #14213d;
        }

        /* ===== Form card ===== */
        .employee-form-card {
            padding: 30px;
            border: 1px solid #e0e7f0;
            border-radius: 16px;
            background: #ffffff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, .06);
        }

        .form-card-heading {
            margin-bottom: 25px;
            padding-bottom: 18px;
            border-bottom: 1px solid #e8edf5;
        }

        .form-card-heading h3 {
            margin: 0;
            color: #14213d;
            font-size: 20px;
            font-weight: 800;
        }

        .form-card-heading p {
            margin: 6px 0 0;
            color: #68778c;
            font-size: 14px;
        }

        /* ===== Employee form fields ===== */
        .employee-form {
            width: 100%;
        }

        .employee-form .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 21px 24px;
        }

        .employee-form .form-group {
            min-width: 0;
            margin: 0;
        }

        .employee-form .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #34445a;
            font-size: 13px;
            font-weight: 750;
        }

        .employee-form input:not([type="checkbox"]),
        .employee-form select {
            display: block;
            width: 100%;
            min-width: 0;
            min-height: 46px;
            padding: 11px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 9px;
            outline: none;
            background: #ffffff;
            color: #202c3c;
            font-family: inherit;
            font-size: 14px;
            transition: border-color .2s ease, box-shadow .2s ease;
        }

        .employee-form input:focus,
        .employee-form select:focus {
            border-color: #315fce;
            box-shadow: 0 0 0 3px rgba(49, 95, 206, .13);
        }

        .employee-form input::placeholder {
            color: #94a3b8;
        }

        /* ===== Form actions ===== */
        .employee-form .form-actions {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 30px;
            padding-top: 22px;
            border-top: 1px solid #e8edf5;
        }

        .employee-form .form-actions .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 45px;
            padding: 11px 22px;
            border: 1px solid transparent;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 750;
            text-decoration: none;
            cursor: pointer;
            transition: background .2s ease, transform .2s ease;
        }

        .employee-form .form-actions .btn-primary {
            border-color: #315fce;
            background: #315fce;
            color: #ffffff;
        }

        .employee-form .form-actions .btn-primary:hover {
            border-color: #244bb0;
            background: #244bb0;
            transform: translateY(-1px);
        }

        .employee-form .form-actions .btn-secondary {
            border-color: #d5deea;
            background: #ffffff;
            color: #34445a;
        }

        .employee-form .form-actions .btn-secondary:hover {
            background: #edf2fa;
            color: #14213d;
        }

        /* ===== Error message ===== */
        .error-message {
            padding: 14px 17px;
            margin-bottom: 22px;
            border: 1px solid #f2c3c3;
            border-radius: 9px;
            background: #fff0f0;
            color: #a61f1f;
            font-size: 14px;
        }

        /* ===== Footer ===== */
        .add-page-footer {
            padding: 22px 20px;
            margin-top: 40px;
            background: #14213d;
            color: #d3deef;
            font-size: 13px;
            text-align: center;
        }

        /* ===== Responsive design ===== */
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
        }

        @media (max-width: 600px) {
            .add-employee-page {
                width: calc(100% - 24px);
                margin: 22px auto 30px;
            }

            .employee-form-card {
                padding: 19px;
            }

            .employee-form .form-grid {
                grid-template-columns: minmax(0, 1fr);
                gap: 18px;
            }

            .employee-form .form-actions {
                align-items: stretch;
                flex-direction: column;
            }

            .employee-form .form-actions .btn {
                width: 100%;
            }
        }

        @media print {
            body > header.site-header,
            .employee-form .form-actions,
            .add-page-footer {
                display: none !important;
            }

            body {
                background: #ffffff;
            }

            .add-employee-page {
                width: 100%;
                margin: 0;
            }

            .employee-form-card {
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

        <a href="${pageContext.request.contextPath}/employees">
            Employees
        </a>

        <a class="active"
           href="${pageContext.request.contextPath}/addEmployee.jsp">
            Add Employee
        </a>

        <a href="${pageContext.request.contextPath}/searchEmployee.jsp">
            Search
        </a>
    </nav>
</header>

<main class="add-employee-page">

    <section class="add-page-heading">
        <h2>Add New Employee</h2>
        <p>Enter employee information below.</p>
    </section>

    <% if ("true".equals(request.getParameter("error"))) { %>
        <div class="error-message" role="alert">
            Employee could not be added.
            Please check the entered information.
        </div>
    <% } %>

    <section class="employee-form-card">

        <div class="form-card-heading">
            <h3>Employee Information</h3>
            <p>Fields marked as required must be completed.</p>
        </div>

        <form action="${pageContext.request.contextPath}/add-employee"
              method="post"
              class="employee-form">

            <div class="form-grid">

                <div class="form-group">
                    <label for="employeeCode">Employee Code *</label>
                    <input type="text"
                           id="employeeCode"
                           name="employeeCode"
                           placeholder="EMP006"
                           required>
                </div>

                <div class="form-group">
                    <label for="firstName">First Name *</label>
                    <input type="text"
                           id="firstName"
                           name="firstName"
                           autocomplete="given-name"
                           required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text"
                           id="lastName"
                           name="lastName"
                           autocomplete="family-name">
                </div>

                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email"
                           id="email"
                           name="email"
                           autocomplete="email"
                           required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="tel"
                           id="phone"
                           name="phone"
                           autocomplete="tel">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth</label>
                    <input type="date"
                           id="dateOfBirth"
                           name="dateOfBirth">
                </div>

                <div class="form-group">
                    <label for="departmentId">Department *</label>
                    <select id="departmentId"
                            name="departmentId"
                            required>
                        <option value="">Select Department</option>
                        <option value="1">Information Technology</option>
                        <option value="2">Human Resources</option>
                        <option value="3">Finance</option>
                        <option value="4">Marketing</option>
                        <option value="5">Administration</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="designation">Designation *</label>
                    <input type="text"
                           id="designation"
                           name="designation"
                           placeholder="Java Developer"
                           required>
                </div>

                <div class="form-group">
                    <label for="joiningDate">Joining Date *</label>
                    <input type="date"
                           id="joiningDate"
                           name="joiningDate"
                           required>
                </div>

                <div class="form-group">
                    <label for="salary">Salary *</label>
                    <input type="number"
                           id="salary"
                           name="salary"
                           step="0.01"
                           min="0"
                           placeholder="55000"
                           required>
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status">
                        <option value="ACTIVE">Active</option>
                        <option value="INACTIVE">Inactive</option>
                        <option value="ON_LEAVE">On Leave</option>
                    </select>
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    Add Employee
                </button>

                <a href="${pageContext.request.contextPath}/employees"
                   class="btn btn-secondary">
                    Cancel
                </a>
            </div>

        </form>
    </section>

</main>

<footer class="add-page-footer">
    © 2026 Vishal Technologies. All rights reserved.
</footer>

</body>
</html>
