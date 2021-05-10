<%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 10/05/2021
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: -webkit-box;
            display: flex;
            -ms-flex-align: center;
            -ms-flex-pack: center;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>

<body class="text-center">
<form class="form-signin" action="FrontServlet" method="POST">
    <h1 class="h3 mb-3 font-weight-normal">Sign Up</h1>
    <label for="nickname" class="form-label">Nickname</label>
    <input type="text" class="form-control" id="nickname" placeholder="Nickname...">
    <label for="userPassword" class="form-label">Password</label>
    <input type="password" class="form-control" id="userPassword" name="firstPassword"
           placeholder="Password...">
    <label for="userRepeatPassword" class="form-label">Repeat Password</label>
    <input type="password" class="form-control" id="userRepeatPassword" name="secondPassword"
           placeholder="Repeat Password...">
    <label for="userName" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="userName" name="userName" placeholder="Full Name...">
    <input type="hidden" name="command" value="RegisterUserCommand">
    <button class="btn btn-lg btn-primary btn-block" style="margin-top: 8px;" type="submit">Sign Up!</button>

</form>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
