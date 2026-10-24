
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Details | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: #f2f5fc;
            color: #172747;
            font-family: Arial, Helvetica, sans-serif;
        }

        .details-page {
            max-width: 1200px;
            margin: 0 auto;
            padding: 35px 24px 50px;
        }

        /* Top navigation */
        .details-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
        }

        .details-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #172747;
            font-size: 18px;
            font-weight: 800;
        }

        .brand-mark {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 46px;
            height: 46px;
            border-radius: 13px;
            background: linear-gradient(135deg, #2864e8, #7049d8);
            color: white;
            font-size: 17px;
        }

        .details-nav small {
            display: block;
            margin-top: 4px;
            color: #71809a;
            font-size: 12px;
            font-weight: 400;
        }

        .nav-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 11px 16px;
            border: 1px solid #d9e3f3;
            border-radius: 9px;
            background: white;
            color: #2457c5;
            text-decoration: none;
            font-weight: 700;
            transition: .2s;
        }

        .nav-back:hover {
            background: #eaf0ff;
        }

        /* Employee header */
        .details-hero {
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 25px;
            padding: 32px;
            margin-bottom: 25px;
            border-radius: 18px;
            background: linear-gradient(120deg, #172747, #2855a4 72%, #5145a5);
            color: white;
            box-shadow: 0 12px 30px rgba(31, 65, 130, .16);
        }

        .details-hero::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            right: -65px;
            top: -100px;
            border: 35px solid rgba(255, 255, 255, .08);
            border-radius: 50%;
            pointer-events: none;
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-label {
            display: inline-block;
            margin-bottom: 12px;
            padding: 7px 11px;
            border-radius: 6px;
            background: rgba(255, 255, 255, .15);
            color: #e3ebff;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.3px;
        }

        .details-hero h1 {
            margin: 0 0 10px;
            color: white;
            font-size: clamp(26px, 4vw, 36px);
        }

        .details-hero p {
            margin: 0;
            color: #dbe6ff;
            line-height: 1.7;
        }

        .hero-avatar {
            position: relative;
            z-index: 1;
            display: flex;
            flex-shrink: 0;
            align-items: center;
            justify-content: center;
            width: 95px;
            height: 95px;
            border: 1px solid rgba(255, 255, 255, .3);
            border-radius: 25px;
            background: rgba(255, 255, 255, .13);
            color: white;
            font-size: 30px;
            font-weight: 800;
        }

        /* Main details panel */
        .details-container {
            overflow: hidden;
            background: white;
            border: 1px solid #e0e8f4;
            border-radius: 16px;
            box-shadow: 0 8px 28px rgba(31, 51, 91, .06);
        }

        .panel-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            padding: 23px 28px;
            border-bottom: 1px solid #e8edf6;
        }

        .panel-heading h2 {
            margin: 0;
            color: #172747;
            font-size: 21px;
        }

        .employee-code {
            display: inline-block;
            padding: 8px 13px;
            border-radius: 20px;
            background: #eaf0ff;
            color: #2457c5;
            font-size: 13px;
            font-weight: 800;
        }

        .details-section {
            padding: 25px 28px;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 0 0 18px;
            color: #263958;
            font-size: 16px;
        }

        .section-dot {
            width: 10px;
            height: 10px;
            flex-shrink: 0;
            border-radius: 3px;
            background: #2864e8;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px;
        }

        .detail-item {
            min-width: 0;
            padding: 18px;
            border: 1px solid #e7edf7;
            border-left: 4px solid #2864e8;
            border-radius: 10px;
            background: #f8faff;
            transition: background .2s, transform .2s;
        }

        .detail-item:hover {
            background: #eff4ff;
            transform: translateY(-2px);
        }

        .detail-item:nth-child(4n + 2) {
            border-left-color: #7952d6;
        }

        .detail-item:nth-child(4n + 3) {
            border-left-color: #13a080;
        }

        .detail-item:nth-child(4n) {
            border-left-color: #e5a126;
        }

        .detail-label {
            display: block;
            margin-bottom: 9px;
            color: #71809a;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: .35px;
            text-transform: uppercase;
        }

        .detail-value {
            display: block;
            color: #172747;
            font-size: 15px;
            font-weight: 700;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .status-value {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 20px;
            background: #e2f8eb;
            color: #137943;
            font-size: 12px;
            font-weight: 800;
        }

        .details-divider {
            height: 1px;
            margin: 0 28px;
            background: #e8edf6;
        }

        /* Bottom actions */
        .details-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            padding: 22px 28px;
            background: #fafbfe;
            border-top: 1px solid #e8edf6;
        }

        .footer-note {
            margin: 0;
            color: #71809a;
            font-size: 13px;
            line-height: 1.6;
        }

        .back-button {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            gap: 9px;
            padding: 12px 19px;
            border: none;
            border-radius: 8px;
            background: #2864e8;
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            transition: background .2s, transform .2s;
        }

        .back-button:hover {
            background: #194bb8;
            transform: translateY(-1px);
        }

        .page-footer {
            padding: 22px 0 0;
            color: #8490a5;
            text-align: center;
            font-size: 12px;
        }

        @media (max-width: 650px) {
            .details-page {
                padding: 18px 12px 30px;
            }

            .details-hero {
                padding: 23px 20px;
            }

            .hero-avatar {
                width: 60px;
                height: 60px;
                border-radius: 16px;
                font-size: 21px;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .panel-heading,
            .details-section,
            .details-footer {
                padding: 20px;
            }

            .details-divider {
                margin: 0 20px;
            }

            .details-nav {
                align-items: flex-start;
            }

            .details-brand {
                font-size: 15px;
            }

            .nav-back {
                padding: 10px;
                font-size: 12px;
            }

            .details-footer {
                align-items: stretch;
                flex-direction: column;
            }

            .back-button {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<div class="details-page">

    <!-- Page navigation -->
    <nav class="details-nav" aria-label="Page navigation">

        <div class="details-brand">
            <span class="brand-mark">VT</span>
            <span>
                Vishal Technologies
                <small>Company Management System</small>
            </span>
        </div>

        <a class="nav-back"
           href="${pageContext.request.contextPath}/employees">
            <span aria-hidden="true">←</span>
            Employees
        </a>

    </nav>

    <!-- Colorful page header -->
    <header class="details-hero">

        <div class="hero-content">
            <span class="hero-label">EMPLOYEE DIRECTORY</span>

            <h1>Employee Details</h1>

            <p>
                Complete employee information at Vishal Technologies.
            </p>
        </div>

        <div class="hero-avatar" aria-hidden="true">VT</div>

    </header>

    <!-- Employee information -->
    <section class="details-container">

        <div class="panel-heading">
            <h2>Employee Information</h2>

            <span class="employee-code">
                <c:out value="${employee.employeeCode}"/>
            </span>
        </div>

        <!-- Personal information -->
        <section class="details-section">

            <h3 class="section-title">
                <span class="section-dot"></span>
                Personal Information
            </h3>

            <div class="details-grid">

                <div class="detail-item">
                    <span class="detail-label">Employee ID</span>
                    <span class="detail-value">
                        <c:out value="${employee.employeeId}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Employee Code</span>
                    <span class="detail-value">
                        <c:out value="${employee.employeeCode}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">First Name</span>
                    <span class="detail-value">
                        <c:out value="${employee.firstName}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Last Name</span>
                    <span class="detail-value">
                        <c:out value="${employee.lastName}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Gender</span>
                    <span class="detail-value">
                        <c:out value="${employee.gender}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Date of Birth</span>
                    <span class="detail-value">
                        <c:out value="${employee.dateOfBirth}"/>
                    </span>
                </div>

            </div>

        </section>

        <div class="details-divider"></div>

        <!-- Contact information -->
        <section class="details-section">

            <h3 class="section-title">
                <span class="section-dot" style="background:#13a080;"></span>
                Contact Information
            </h3>

            <div class="details-grid">

                <div class="detail-item">
                    <span class="detail-label">Email Address</span>
                    <span class="detail-value">
                        <c:out value="${employee.email}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Phone Number</span>
                    <span class="detail-value">
                        <c:out value="${employee.phone}"/>
                    </span>
                </div>

            </div>

        </section>

        <div class="details-divider"></div>

        <!-- Employment information -->
        <section class="details-section">

            <h3 class="section-title">
                <span class="section-dot" style="background:#7952d6;"></span>
                Employment Information
            </h3>

            <div class="details-grid">

                <div class="detail-item">
                    <span class="detail-label">Department</span>
                    <span class="detail-value">
                        <c:out value="${departmentName}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Designation</span>
                    <span class="detail-value">
                        <c:out value="${employee.designation}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Joining Date</span>
                    <span class="detail-value">
                        <c:out value="${employee.joiningDate}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Monthly Salary</span>
                    <span class="detail-value">
                        ₹<c:out value="${employee.salary}"/>
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Employment Status</span>
                    <span class="detail-value">
                        <span class="status-value">
                            <c:out value="${employee.status}"/>
                        </span>
                    </span>
                </div>

            </div>

        </section>

        <!-- Footer actions -->
        <footer class="details-footer">

            <p class="footer-note">
                Employee information for Vishal Technologies.
            </p>

            <a class="back-button"
               href="${pageContext.request.contextPath}/employees">
                <span aria-hidden="true">←</span>
                Back to Employees
            </a>

        </footer>

    </section>

    <footer class="page-footer">
        © 2026 Vishal Technologies · Company Management System
    </footer>

</div>

</body>
</html>
