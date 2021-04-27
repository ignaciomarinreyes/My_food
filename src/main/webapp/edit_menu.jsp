<%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 27/04/2021
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="header.jsp"></jsp:include>

<body>
<div class="row">
    <div class="col-2">
        <form>
            <label for="menuName" class="col-form-label">Menu Name</label>
            <input type="text" class="form-control" name="menuName" id="menuName" value="<%= "hola" %>">
            <input type="hidden" name="idMenu" value="<%= "ID" %>">
            <input type="hidden" name="command" value="AddCommand">
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col">
        <form>
            <label for="sectionName" class="col-form-label">Section: </label>
            <input type="text" class="form-control" name="sectionName" id="sectionName" value="<%= "hola" %>">
            <input type="hidden" name="command" value="AddCommand">
            <input type="hidden" name="idMenu" value="<%= "ID" %>">

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col">
        <form>
            <label for="itemName" class="col-form-label">Item: </label>
            <input type="text" class="form-control" name="itemName" id="itemName" value="<%= "hola" %>">
            <input type="hidden" name="command" value="AddCommand">
            <input type="hidden" name="idMenu" value="<%= "ID" %>">

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>
