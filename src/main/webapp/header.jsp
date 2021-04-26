<%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 26/04/2021
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title>My Food</title>
    <%
        session = request.getSession(true);
    %>
    <style>
        body {
            background-color: #f8f9fa!important;
        }
    </style>
</head>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">My Food</a>

            <form class="d-flex">
                <input type="hidden" value="LogOutCommand" name="command">
                <button class="btn btn-outline-danger" type="submit">Exit</button>
            </form>
    </div>
</nav>