<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Department | Vishal Technologies</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="container">

    <header>
        <h1>Edit Department</h1>
        <p>Update department information</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
        <a href="${pageContext.request.contextPath}/departments">Departments</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
    </nav>

    <main>
        <h2>Department Information</h2>

        <c:if test="${param.error == 'required'}">
            <p class="error">Department name is required.</p>
        </c:if>

        <c:if test="${param.error == 'duplicate'}">
            <p class="error">That department name already exists.</p>
        </c:if>

        <form method="post"
              action="${pageContext.request.contextPath}/edit-department">

            <input type="hidden"
                   name="departmentId"
                   value="<c:out value='${department.departmentId}'/>">

            <div class="form-group">
                <label for="departmentName">Department Name *</label>
                <input type="text"
                       id="departmentName"
                       name="departmentName"
                       maxlength="100"
                       value="<c:out value='${department.departmentName}'/>"
                       required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description"
                          name="description"
                          maxlength="255"
                          rows="4"><c:out value="${department.description}"/></textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    Update Department
                </button>

                <a class="btn"
                   href="${pageContext.request.contextPath}/departments">
                    Cancel
                </a>
            </div>
        </form>
    </main>
</div>

</body>
</html>