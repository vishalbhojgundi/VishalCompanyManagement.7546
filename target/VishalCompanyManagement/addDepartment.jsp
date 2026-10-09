<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Department | Vishal Technologies</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="container">

    <header>
        <h1>Add Department</h1>
        <p>Create a department for Vishal Technologies</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
        <a href="${pageContext.request.contextPath}/departments">Departments</a>
        <a href="${pageContext.request.contextPath}/employees">Employees</a>
    </nav>

    <main>
        <h2>Department Information</h2>

        <% if ("required".equals(request.getParameter("error"))) { %>
            <p class="error">Department name is required.</p>
        <% } %>

        <% if ("duplicate".equals(request.getParameter("error"))) { %>
            <p class="error">That department name already exists.</p>
        <% } %>

        <% if ("failed".equals(request.getParameter("error"))) { %>
            <p class="error">Department could not be added. Please try again.</p>
        <% } %>

        <form method="post"
              action="${pageContext.request.contextPath}/add-department">

            <div class="form-group">
                <label for="departmentName">Department Name *</label>
                <input type="text"
                       id="departmentName"
                       name="departmentName"
                       maxlength="100"
                       required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description"
                          name="description"
                          maxlength="255"
                          rows="4"></textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    Save Department
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