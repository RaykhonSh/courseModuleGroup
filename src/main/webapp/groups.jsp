<%@ page import="uz.pdp.demo10.repo.GroupRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo10.tables.Groups" %>
<%@ page import="uz.pdp.demo10.repo.ModuleRepo" %>
<%@ page import="uz.pdp.demo10.tables.Module" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04/12/24
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Groups</title>
</head>
<body>
<%
    int moduleId = Integer.parseInt(request.getParameter("moduleId"));
    Module module = ModuleRepo.getById(moduleId);
    GroupRepo groupRepo = new GroupRepo();
    List<Groups> groups = groupRepo.findAll();
    List<Groups> groupsList = groups.stream().filter(groups1 -> groups1.getModule().getId().equals(moduleId)).toList();

%>
<table class="table">
    <form action="addGroup.jsp" method="post">
        <input type="hidden" name="moduleId" value="<%=moduleId%>">
        <button class="btn btn-dark">Add group</button>
    </form>
    <thead>
    <tr>
        <th>Id</th>
        <th>Module</th>
        <th>Group</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Groups group : groupsList) {
            %>
    <tr>
        <td><%=group.getId()%></td>
        <td><%=group.getModule().getName()%></td>
        <td><%=group.getName()%></td>
        <td class="d-flex gap-2">
            <form action="students.jsp" method="post">
                <input type="hidden" name="groupId" value="<%=group.getId()%>">
                <button class="btn btn-info">students</button>
            </form>
            <form action="addGroup.jsp" method="post">
                <input type="hidden" name="groupId" value="<%=group.getId()%>">
                <input type="hidden" name="moduleId" value="<%=group.getModule().getId()%>">
                <button class="btn btn-dark">update</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<form action="modules.jsp" method="post">
    <input type="hidden" name="courseId" value="<%=module.getCourse().getId()%>">
    <button class="btn btn-dark">Back</button>
</form>
</body>
</html>
