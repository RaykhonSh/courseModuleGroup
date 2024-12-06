<%@ page import="uz.pdp.demo10.repo.ModuleRepo" %>
<%@ page import="uz.pdp.demo10.tables.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/12/24
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Module</title>
</head>
<body>
<%
    ModuleRepo moduleRepo = new ModuleRepo();
    List<Module> modules = moduleRepo.findAll();
    int courseId = Integer.parseInt(request.getParameter("courseId"));
    List<Module> moduleList = modules.stream().filter(module -> module.getCourse().getId().equals(courseId)).toList();
%>
<form action="addModule.jsp" method="post">
    <input type="hidden" name="courseId" value="<%=courseId%>">
    <button class="btn btn-dark p-3">Add module</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Course</th>
        <th>Module</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Module module : moduleList) {
            %>
    <tr>
        <td><%=module.getId()%></td>
        <td><%=module.getCourse().getName()%></td>
        <td><%=module.getName()%></td>
        <td class="d-flex gap-2">

            <form action="groups.jsp" method="post">
                <input type="hidden" name="moduleId" value="<%=module.getId()%>">
                <button class="btn btn-info">groups</button>
            </form>
            <form action="addModule.jsp" method="post">
                <input type="hidden" name="moduleId" value="<%=module.getId()%>">
                <input type="hidden" name="courseId" value="<%=module.getCourse().getId()%>">
                <button class="btn btn-dark">update</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<a href="course.jsp" class="btn btn-dark">Back</a>
</body>
</html>
