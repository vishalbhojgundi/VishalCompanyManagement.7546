
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Search Employee | Vishal Technologies</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .search-page {
            width: min(1250px, calc(100% - 40px));
            margin: 32px auto;
        }

        .search-heading {
            margin-bottom: 24px;
        }

        .search-heading h2 {
            margin: 0;
            color: #14213d;
            font-size: 28px;
        }

        .search-heading p {
            margin: 7px 0 0;
            color: #68778c;
        }

        .search-panel {
            padding: 24px;
            margin-bottom: 24px;
            border: 1px solid #e0e7f0;
            border-radius: 12px;
            background: #fff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, .06);
        }

        .search-form {
            display: flex;
            align-items: end;
            gap: 14px;
        }

        .search-form .form-group {
            flex: 1;
            margin: 0;
        }

        .search-form label {
            display: block;
            margin-bottom: 7px;
            color: #34445a;
            font-weight: 700;
        }

        .search-form input {
            width: 100%;
            min-height: 44px;
            padding: 11px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
        }

        .search-form button {
            min-height: 44px;
            padding: 10px 22px;
            border: 0;
            border-radius: 8px;
            background: #315fce;
            color: #fff;
            font-weight: 700;
            cursor: pointer;
        }

        .search-form button:hover {
            background: #244bb0;
        }

        .results-panel {
            overflow: hidden;
            border: 1px solid #e0e7f0;
            border-radius: 12px;
            background: #fff;
            box-shadow: 0 5px 22px rgba(20, 33, 61, .06);
        }

        .results-heading {
            padding: 20px 22px;
            border-bottom: 1px solid #e0e7f0;
        }

        .results-heading h3 {
            margin: 0;
            color: #14213d;
            font-size: 18px;
        }

        .results-table-wrap {
            overflow-x: auto;
        }

        .results-table {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
            font-size: 13px;
        }

        .results-table thead {
            background: #edf2fa;
        }

        .results-table th {
            padding: 14px;
            color: #243e68;
            text-align: left;
            white-space: nowrap;
            border-bottom: 1px solid #e0e7f0;
        }

        .results-table td {
            padding: 13px 14px;
            border-bottom: 1px solid #edf0f5;
            white-space: nowrap;
        }

        .results-table tbody tr:hover {
            background: #f8faff;
        }

        .results-empty {
            padding: 35px !important;
            color: #68778c;
            text-align: center;
        }

        .search-footer {
            padding: 20px;
            color: #68778c;
            font-size: 12px;
            text-align: center;
        }

        @media (max-width: 650px) {
            .search-page {
                width: calc(100% - 24px);
                margin: 20px auto;
            }

            .search-heading h2 {
                font-size: 23px;
            }

            .search-panel {
                padding: 17px;
            }

            .search-form {
                align-items: stretch;
                flex-direction: column;
            }

            .search-form button {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<header>
    <div>
        <h1>Vishal Technologies</h1>
        <p>Company Management System</p>
    </div>

    <nav aria-label="Main navigation">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
        <a href="${pageContext.request.contextPath}/add-employee">Add Employee</a>
        <a href="${pageContext.request.contextPath}/searchEmployee.jsp">Search</a>
    </nav>
</header>

<main class="search-page">

    <div class="search-heading">
        <h2>Search Employees</h2>
        <p>Find employee records using the search field below.</p>
    </div>

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
                                <td><c:out value="${employee.email}"/></td>
                                <td><c:out value="${employee.phone}"/></td>
                                <td><c:out value="${employee.departmentName}"/></td>
                                <td><c:out value="${employee.designation}"/></td>
                                <td><c:out value="${employee.joiningDate}"/></td>
                                <td><c:out value="${employee.status}"/></td>
                            </tr>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="7" class="results-empty">
                                Enter a search term to find employees,
                                or no matching employees were found.
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
