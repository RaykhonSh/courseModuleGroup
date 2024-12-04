<%@ page import="uz.pdp.demo10.repo.ModuleRepo" %>
<%@ page import="uz.pdp.demo10.tables.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo10.tables.Groups" %>
<%@ page import="uz.pdp.demo10.repo.GroupRepo" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04/12/24
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add group</title>
</head>
<body>
<%
  List<Module> modules = ModuleRepo.getModules();
  int moduleId = Integer.parseInt(request.getParameter("moduleId"));
  String id = request.getParameter("groupId");
  Groups group=null;
  if (id!=null){
    int groupId = Integer.parseInt(id);
    group= GroupRepo.findById(groupId);
  }
%>
<div class="row">
  <div class="col-6 offset-3">
    <div class="card">
      <div class="card-header">
        <%=group==null?"Add group":"Update group"%>
      </div>
      <div class="card body">
        <form action="<%=group==null?"/addGroup":"/updateGroup"%>" method="post">
             <%
                if(group==null){
                    %>
            <input type="hidden" name="moduleId" value="<%=moduleId%>">
            <%
                }
            %>
          <input value="<%=group==null?"":group.getName()%>" class="form-control" type="text" name="groupName" placeholder="groupName">
          <%
            if (group!=null){
              %>
          <input type="hidden" name="groupId" value="<%=group.getId()%>">
          <select  class="form-control" name="moduleId">
            <option selected disabled value="">Select module</option>
           <%
              for (Module module : modules) {
                if (group.getModule().getId().equals(module.getId())){
                  %>
            <option selected value="<%=module.getId()%>"><%=module.getName()%></option>
            <%
                }else{
                %>
            <option value="<%=module.getId()%>"><%=module.getName()%></option>
          <%
              }
              }
          %>
              </select>
          <%
            }
          %>
          <button class="btn btn-dark">Save</button>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
