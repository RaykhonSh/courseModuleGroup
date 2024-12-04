<%@ page import="uz.pdp.demo10.repo.PaymentRepo" %>
<%@ page import="uz.pdp.demo10.tables.Payme" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 05/12/24
  Time: 00:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background: white;
        }
        .card-header {
            font-weight: bold;
            font-size: 18px;
            background-color: #343a40;
            color: white;
            padding: 12px;
            border-bottom: 1px solid #ccc;
        }
        .card-body {
            padding: 16px;
        }
        .form-control {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ced4da;
        }
        .btn-dark {
            background-color: #343a40;
            border-color: #343a40;
        }
        .btn-dark:hover {
            background-color: #23272b;
            border-color: #1d2124;
        }
    </style>
    <title>Add payment</title>
</head>
<body>
<%
    int studentId = Integer.parseInt(request.getParameter("studentId"));
%>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-6 offset-lg-3">
            <div class="card">
                <div class="card-header text-center">
                    Add Payment
                </div>
                <div class="card-body">
                    <form action="/addPayment" method="post">
                        <input type="hidden" name="studentId" value="<%=studentId%>">
                        <input type="number" name="payAmount" class="form-control" placeholder="Amount" required>
                        <div class="text-center">
                            <button class="btn btn-dark w-100">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
