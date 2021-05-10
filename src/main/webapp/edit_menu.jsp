<%@ page import="model.Menu" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="model.Item" %>
<%@ page import="model.Section" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="model.Ingredient" %><%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 27/04/2021
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="header.jsp"></jsp:include>

<%
    Menu menu = (Menu) request.getAttribute("menuObject");
    Integer idMenu = (Integer) request.getAttribute("idMenu");

    Set<Item> items = menu.getItems();
    Set<Section> sections = menu.getSections();


%>

<body>

<div class="row">
    <div class="col">
        <h5> <%= menu.getName() %></h5>
    </div>
</div>
    <%
        if (sections != null){
        Iterator<Section> iterator = sections.iterator();
        while (iterator.hasNext()){
            Section next = iterator.next();
    %>
<div class="row">

    <div class="col-1">
        <span class="badge bg-secondary"><%= next.getName() %></span>
    </div>
</div>
<%
    Set sectionItems = next.getItems();
    if (sectionItems != null){
    Iterator<Item> itemIterator = sectionItems.iterator();
    while (itemIterator.hasNext()){
        Item item = itemIterator.next();
%>
<div class="row">
    <div class="col-1">
    </div>
    <div class="col-3">

        <span><%= item.getName() %> - - - - - - <%= item.getPrice() %>€</span>
    </div>
</div>
<div class="row">
    <div class="col-1">
    </div>
    <div class="col-3">
        <%
            Set<Ingredient> ingredients = item.getIngredients();
            String result = "";
            for (Ingredient i:
                 ingredients) {
                result += " "+ i.getName()+",";
            }
        %>
        <span><%= result %></span>
    </div>
</div>
<div class="row">
    <div class="col-2">

    </div>
    <div class="col-2">
        <form action="FrontServlet" method="POST">
            <label for="ingredientNameItem" class="form-label">Ingredient: </label>
            <input type="text" class="form-control" name="ingredientName" id="ingredientNameItem">
            <input type="hidden" name="command" value="AddCommand">
            <input type="hidden" name="idMenu" value="<%= idMenu %>">
            <input type="hidden" name="idItem" value="<%= item.getId() %>">

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
<% }
    }%>
    <div class="row">
        <div class="col-2">

        </div>
        <div class="col-4">
            <form action="FrontServlet" method="POST">
                <label for="itemNameNew" class="form-label">Item: </label>
                <input type="text" class="form-control" name="itemName" id="itemNameNew">
                <input type="hidden" name="command" value="AddCommand">
                <input type="number" class="form-control" name="itemPrice" value="0">
                <input type="hidden" name="idMenu" value="<%= idMenu %>">
                <input type="hidden" name="idSection" value="<%= next.getId() %>">

                <button type="submit" class="btn btn-primary">Add</button>
            </form>
        </div>
    </div>
<% }
    }
%>
    <div class="row">
        <div class="col-4">
            <form action="FrontServlet" method="POST">
                <label for="sectionName" class="col-form-label">Section: </label>
                <input type="text" class="form-control" name="sectionName" id="sectionName" value="">
                <input type="hidden" name="command" value="AddCommand">
                <input type="hidden" name="idMenu" value="<%= idMenu %>">

                <button type="submit" class="btn btn-primary">Add</button>
            </form>
        </div>
    </div>

</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>
