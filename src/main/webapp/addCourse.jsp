<%@ page import="uz.pdp.demo10.repo.CourseRepo" %>
<%@ page import="uz.pdp.demo10.tables.Course" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/12/24
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add course</title>
</head>
<body>
<%
    String id = request.getParameter("courseId");
    Course course=null;
    if (id!=null){
        int courseId = Integer.parseInt(id);
        course=CourseRepo.getById(courseId);
    }
%>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header"><%=course==null?"Add course":"Update course"%></div>
            <div class="card-body">
                <form action="<%=course==null?"/addCourse":"/updateCourse"%>" method="post">
                    <%
                        if (course!=null){
                            %>
                    <input type="hidden" name="courseId" value="<%=course.getId()%>">
                    <%
                        }
                    %>
                    <input value="<%=course==null?"":course.getName()%>" class="form-control" type="text" placeholder="name" name="name">
                    <button class="btn btn-success">save</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
