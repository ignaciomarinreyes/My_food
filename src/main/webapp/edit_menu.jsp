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
    <div class="col">
        <form>
            <label for="menuName" class="col-sm-2 col-form-label">Email</label>
            <input type="text" class="form-control-plaintext" name="menuName" id="menuName" value="<%= "hola" %>">
            <input type="hidden" name="command" value="AddCommand">
            <button type="submit">COMOSERA</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col">
        <form>
            <label for="sectionName" class="col-sm-2 col-form-label">Email</label>
            <input type="text" class="form-control-plaintext" name="sectionName" id="sectionName" value="<%= "hola" %>">
            <input type="hidden" name="command" value="AddCommand">
            <button type="submit">COMOSERA</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-2"></div>
    <div class="col">
        <form>
            <label for="itemName" class="col-sm-2 col-form-label">Email</label>
            <input type="text" class="form-control-plaintext" name="itemName" id="itemName" value="<%= "hola" %>">
            <input type="hidden" name="id" value="<%= "value" %>">
            <input type="hidden" name="command" value="AddCommand">
            <button type="submit">COMOSERA</button>
        </form>
    </div>
</div>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>
