
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Search Employees | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        /* ===== Search page layout ===== */
        .search-page {
            width: min(1400px, calc(100% - 48px));
            margin: 32px auto 44px;
        }

        .search-heading {
            margin-bottom: 24px;
        }

        .search-heading h2 {
            margin: 0;
            color: #14213d;
            font-size: clamp(26px, 3vw, 34px);
            font-weight: 800;
            line-height: 1.3;
        }

        .search-heading p {
            margin: 8px 0 0;
            color: #68778c;
            font-size: 15px;
        }

        /* ===== Explicit header styling ===== */
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

        .site-header .brand {
            flex: 0 1 auto;
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
            color: #edf3ff;
            background: transparent;
            font-size: 14px;
            font-weight: 650;
            text-decoration: none;
            white-space: nowrap;
            transition: background .2s ease, color .2s ease;
        }

        .site-header .main-nav a:hover {
            color: #ffffff;
            background: rgba(255, 255, 255, .14);
        }

        .site-header .main-nav a.active {
            color: #14213d;
            background: #ffffff;
        }

        /* ===== Search form ===== */
        .search-panel {
            padding: 26px;
            margin-bottom: 24px;
            border: 1px solid #e0e7f0;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, .06);
        }

        .search-form {
            display: flex;
            align-items: flex-end;
            gap: 14px;
        }

        .search-form .form-group {
            flex: 1 1 auto;
            min-width: 0;
            margin: 0;
        }

        .search-form label {
            display: block;
            margin-bottom: 8px;
            color: #34445a;
            font-size: 14px;
            font-weight: 700;
        }

        .search-form input[type="text"] {
            display: block;
            width: 100%;
            min-height: 48px;
            padding: 12px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 9px;
            background: #ffffff;
            color: #202c3c;
            font: inherit;
            outline: none;
            transition: border-color .2s ease, box-shadow .2s ease;
        }

        .search-form input[type="text"]:focus {
            border-color: #315fce;
            box-shadow: 0 0 0 3px rgba(49, 95, 206, .13);
        }

        .search-form button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex: 0 0 auto;
            min-height: 48px;
            padding: 11px 22px;
            border: 1px solid #315fce;
            border-radius: 9px;
            background: #315fce;
            color: #ffffff;
            font-size: 14px;
            font-weight: 750;
            cursor: pointer;
            transition: background .2s ease, transform .2s ease;
        }

        .search-form button:hover {
            border-color: #244bb0;
            background: #244bb0;
            transform: translateY(-1px);
        }

        /* ===== Search results ===== */
        .results-panel {
            overflow: hidden;
            margin-bottom: 26px;
            border: 1px solid #e0e7f0;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, .06);
        }

        .results-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            padding: 21px 25px;
            border-bottom: 1px solid #e0e7f0;
        }

        .results-heading h3 {
            margin: 0;
            color: #14213d;
            font-size: 21px;
            font-weight: 800;
        }

        .results-table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .results-table {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
            background: #ffffff;
            font-size: 13px;
        }

        .results-table thead {
            background: #edf2fa;
        }

        .results-table th {
            padding: 15px;
            border-bottom: 1px solid #e0e7f0;
            color: #243e68;
            font-size: 13px;
            font-weight: 750;
            text-align: left;
            white-space: nowrap;
        }

        .results-table td {
            padding: 14px 15px;
            border-bottom: 1px solid #edf0f5;
            color: #344054;
            vertical-align: middle;
        }

        .results-table tbody tr:last-child td {
            border-bottom: none;
        }

        .results-table tbody tr:hover {
            background: #f8faff;
        }

        .results-table td strong {
            color: #14213d;
        }

        .results-empty {
            padding: 35px 20px !important;
            color: #68778c !important;
            text-align: center;
            white-space: normal;
        }

        /* ===== Footer ===== */
        .search-footer {
            padding: 22px 20px;
            margin-top: 38px;
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
        }

        @media (max-width: 600px) {
            .search-page {
                width: calc(100% - 24px);
                margin: 22px auto 30px;
            }

            .search-heading h2 {
                font-size: 25px;
            }

            .search-panel {
                padding: 18px;
            }

            .search-form {
                align-items: stretch;
                flex-direction: column;
            }

            .search-form button {
                width: 100%;
            }

            .results-heading {
                padding: 18px;
            }
        }

        @media print {
            body > header.site-header,
            .search-panel,
            .search-footer {
                display: none !important;
            }

            body {
                background: #ffffff;
            }

            .search-page {
                width: 100%;
                margin: 0;
            }

            .results-panel {
                border: 1px solid #cccccc;
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
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
        <a href="${pageContext.request.contextPath}/add-employee">Add Employee</a>
        <a class="active"
           href="${pageContext.request.contextPath}/searchEmployee.jsp">
            Search
        </a>
    </nav>
</header>

<main class="search-page">

    <section class="search-heading">
        <h2>Search Employees</h2>
        <p>Find employee records using the search field below.</p>
    </section>

    <section class="search-panel">
        <form action="${pageContext.request.contextPath}/search-employee"
              method="get"
              class="search-form">

            <div class="form-group">
                <label for="keyword">Employee search</label>

                <input type="text"
                       id="keyword"
                       name="keyword"
                       value="<c:out value='${param.keyword}'/>"
                       placeholder="Enter employee name, email, or code"
                       autocomplete="off"
                       required>
            </div>

            <button type="submit">Search Employees</button>
        </form>
    </section>

    <section class="results-panel">
        <div class="results-heading">
            <h3>Search Results</h3>
        </div>

        <div class="results-table-wrap">
            <table class="results-table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Joining Date</th>
                    <th>Status</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${not empty employees}">
                        <c:forEach var="employee" items="${employees}">
                            <tr>
                                <td>
                                    <strong>
                                        <c:out value="${employee.firstName}"/>
                                        <c:out value="${employee.lastName}"/>
                                    </strong>
                                </td>

                                <td>
                                    <c:out value="${employee.email}"/>
                                </td>

                                <td>
                                    <c:out value="${employee.phone}"/>
                                </td>

                                <td>
                                    <c:out value="${employee.departmentName}"/>
                                </td>

                                <td>
                                    <c:out value="${employee.designation}"/>
                                </td>

                                <td>
                                    <c:out value="${employee.joiningDate}"/>
                                </td>

                                <td>
                                    <c:out value="${employee.status}"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="7" class="results-empty">
                                <c:choose>
                                    <c:when test="${not empty param.keyword}">
                                        No matching employees were found.
                                        Try another name, email, or employee code.
                                    </c:when>
                                    <c:otherwise>
                                        Enter an employee name, email, or code
                                        above to search employee records.
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </section>

</main>

<footer class="search-footer">
    © 2026 Vishal Technologies. All rights reserved.
</footer>

</body>
</html>
