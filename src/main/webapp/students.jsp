<%@ page import="uz.pdp.demo10.repo.GroupRepo" %>
<%@ page import="uz.pdp.demo10.tables.Groups" %>
<%@ page import="uz.pdp.demo10.repo.StudentRepo" %>
<%@ page import="uz.pdp.demo10.tables.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo10.repo.PaymentRepo" %>
<%@ page import="java.util.Objects" %>
<%--<%@ page import="static jdk.nio.zipfs.ZipFileAttributeView.AttrID.group" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04/12/24
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Student</title>
</head>
<body>
<%
  int groupId = Integer.parseInt(request.getParameter("groupId"));
  Groups groupp = GroupRepo.findById(groupId);

  //StudentRepo studentRepo = new StudentRepo();

  String search= Objects.requireNonNullElse(request.getParameter("search"),"");
  int pagejon = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));

  List<Student> studentList = StudentRepo.getStudentList(pagejon,search,groupId);
  // List<Student> studentList = studentRepo.findAll(pagejon,search);
  List<Student> students = studentList.stream().filter(student -> student.getGroups().getId().equals(groupId)).toList();
%>
<form action="">
  <div class="input-group">
    <input type="hidden" name="groupId"  value="<%=groupId%>">
    <input name="search" class="form-control" type="text" placeholder="search..."  >
    <button class="btn btn-dark">Search</button>
  </div>
</form>
<table class="table">
  <form action="addStudent.jsp" method="post">
    <input type="hidden" name="groupId" value="<%=groupId%>">
    <button class="btn btn-dark">Add student</button>
  </form>
  <thead>
  <tr>
    <th>Id</th>
    <th>Group</th>
    <th>Student</th>
    <th>Pay Amount</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
    for (Student student : students) {
      int totalPayment= PaymentRepo.getTotalPaymentByStudentId(student.getId());
  %>
  <tr>
    <td><%=student.getId()%></td>
    <td><%=student.getGroups().getName()%></td>
    <td><%=student.getName()%></td>
    <td><%=totalPayment%></td>
    <td class="d-flex gap-2">
      <form action="addPayment.jsp" method="post">
        <input type="hidden" name="studentId" value="<%=student.getId()%>">
        <button class="btn btn-info">add Payment</button>
      </form>
<%--      <form action="addGroup.jsp" method="post">--%>
<%--        <input type="hidden" name="groupId" value="<%=group.getId()%>">--%>
<%--        <input type="hidden" name="moduleId" value="<%=group.getModule().getId()%>">--%>
<%--        <button class="btn btn-dark">update</button>--%>
<%--      </form>--%>
    </td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>
<%
  Long count=StudentRepo.count(search);
  int pageCount = (int) Math.ceil(count / 10.0);
  for (int i = 1; i <=pageCount ; i++) {
%>
<a href="?page=<%=i%>&search=<%=search%>&groupId=<%=groupId%>" class="btn btn-dark"><%=i%></a>

<%
  }
%>
<form action="groups.jsp" method="post">
  <input type="hidden" name="moduleId" value="<%=groupp.getModule().getId()%>">
  <button class="btn btn-dark">Back</button>
</form>
</body>
</html>
