<%@ page import="uz.pdp.demo10.repo.CourseRepo" %>
<%@ page import="uz.pdp.demo10.tables.Course" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/12/24
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Course</title>
</head>
<body>
<%
    List<Course> courses = CourseRepo.getAllCourses();
%>
<table class="table">
    <a href="addCourse.jsp" class="btn btn-dark">Add course</a>
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Course course : courses) {
            %>
    <tr>
        <td><%=course.getId()%></td>
        <td><%=course.getName()%></td>
        <td class="d-flex gap-2">

                <form action="modules.jsp" method="post">
                    <input type="hidden" name="courseId" value="<%=course.getId()%>">
                    <button class="btn btn-info">modules</button>
                </form>
                <form action="addCourse.jsp" method="post">
                    <input type="hidden" name="courseId" value="<%=course.getId()%>">
                    <button class="btn btn-dark">update</button>
                </form>
<%--                <form action="/deleteCourse" method="post">--%>
<%--                    <input type="hidden" name="courseId" value="<%=course.getId()%>">--%>
<%--                    <button class="btn btn-danger">delete</button>--%>
<%--                </form>--%>

        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
