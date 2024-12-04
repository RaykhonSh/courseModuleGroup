<%@ page import="uz.pdp.demo10.repo.ModuleRepo" %>
<%@ page import="uz.pdp.demo10.tables.Course" %>
<%@ page import="uz.pdp.demo10.repo.CourseRepo" %>
<%@ page import="uz.pdp.demo10.tables.Module" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/12/24
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Modules</title>
</head>
<body>
<%
  int courseId = Integer.parseInt(request.getParameter("courseId"));
  List<Course> courses = CourseRepo.getAllCourses();
  String id = request.getParameter("moduleId");
  Module module=null;
  if (id!=null){
    int moduleId = Integer.parseInt(id);
   module=ModuleRepo.getById(moduleId);
  }
%>
</body>
<div class="row">
  <div class="col-6 offset-3">
    <div class="card">
      <div class="card-header">
       <%=module!=null?"Update module":"Add module"%>
      </div>
      <div class="card-body">
        <form action="<%=module==null?"/addModule":"/updateModule"%>" method="post">
            <%
                if (module==null){
                    %>
            <input type="hidden" name="courseId" value="<%=courseId%>">
            <%
                }
            %>
          <input value="<%=module==null?"":module.getName()%>" class="form-control" type="text" name="modulName" placeholder="Module name">
            <%
                if (module!=null){
            %>
            <input type="hidden" name="moduleId" value="<%=module.getId()%>">
            <select class="form-control" name="courseId" >
                <option selected disabled value="">Select course</option>
                <%
                    for (Course course : courses) {
                        if ( module.getCourse().getId().equals(course.getId())){
                %>
                <option selected value="<%=course.getId()%>" ><%=course.getName()%></option>
                <%
                }else {
                %>
                <option value="<%=course.getId()%>" ><%=course.getName()%></option>
                <%
                        }
                    } %>
            </select>
            <%
                }
            %>
          <button class="btn btn-dark">save</button>
        </form>
      </div>
    </div>
  </div>
</div>
</html>
