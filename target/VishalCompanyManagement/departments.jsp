<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Management | Vishal Technologies</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="container">

    <header>
        <h1>Department Management</h1>
        <p>Manage departments at Vishal Technologies</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
        <a href="${pageContext.request.contextPath}/departments">Departments</a>
    </nav>

    <main>
        <c:if test="${param.success == 'added'}">
            <p class="success">Department added successfully.</p>
        </c:if>

        <c:if test="${param.success == 'updated'}">
            <p class="success">Department updated successfully.</p>
        </c:if>

        <c:if test="${param.success == 'deleted'}">
            <p class="success">Department deleted successfully.</p>
        </c:if>

        <c:if test="${param.success == 'notfound'}">
            <p class="error">Department was not found or was not deleted.</p>
        </c:if>

        <c:if test="${param.error == 'duplicate'}">
            <p class="error">A department with that name already exists.</p>
        </c:if>

        <c:if test="${param.error == 'hasEmployees'}">
            <p class="error">
                This department has employees assigned to it.
                Reassign those employees before deleting the department.
            </p>
        </c:if>

        <div class="page-actions">
            <h2>All Departments</h2>
            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/add-department">
                + Add Department
            </a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Department Name</th>
                    <th>Description</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="department" items="${departments}">
                    <tr>
                        <td>
                            <c:out value="${department.departmentId}"/>
                        </td>
                        <td>
                            <c:out value="${department.departmentName}"/>
                        </td>
                        <td>
                            <c:out value="${department.description}"
                                   default="—"/>
                        </td>
                        <td>
                            <c:out value="${department.createdAt}"
                                   default="—"/>
                        </td>
                        <td>
                            <a class="btn btn-edit"
                               href="${pageContext.request.contextPath}/edit-department?id=${department.departmentId}">
                                Edit
                            </a>

                            <form method="post"
                                  action="${pageContext.request.contextPath}/delete-department"
                                  style="display:inline"
                                  onsubmit="return confirm('Are you sure you want to delete this department?');">

                                <input type="hidden" name="id"
                                       value="${department.departmentId}">

                                <button type="submit" class="btn btn-delete">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty departments}">
                    <tr>
                        <td colspan="5">No departments found.</td>
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