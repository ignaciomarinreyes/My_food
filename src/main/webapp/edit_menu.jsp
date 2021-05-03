<%@ page import="model.Menu" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="model.Item" %>
<%@ page import="model.Section" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %><%--
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
    System.out.println("Menu en el edit" +menu);
    System.out.println("Items en el edit"+items);
    System.out.println("id en el edit" + idMenu);
    System.out.println("seccion en el edit"+sections);

%>

<body>
    <%
        if (sections != null){
            System.out.println("ENTRO");
        Iterator<Section> iterator = sections.iterator();
        while (iterator.hasNext()){
            Section next = iterator.next();
    %>
<div class="row">

    <div class="col-4">
        <span class="badge bg-info text-dark"><%= next.getName() %></span>
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
    <div class="col-2">
    </div>
    <div class="col-4">

        <span class="badge bg-info text-dark"><%= item.getName() %></span>
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
                <input type="hidden" name="idMenu" value="<%= idMenu %>">
                <% System.out.println("ID ANTES DE MANDAR" + next.getId()); %>
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
<div class="row">
    <div class="col-2">

    </div>
    <div class="col-4">
        <form action="FrontServlet" method="POST">
            <label for="itemName" class="form-label">Item: </label>
            <input type="text" class="form-control" name="itemName" id="itemName" value="<%= "hola" %>">
            <input type="hidden" name="command" value="AddCommand">
            <input type="hidden" name="idMenu" value="<%= idMenu %>">

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-2">

    </div>
    <div class="col-2">
        <form action="FrontServlet" method="POST">
            <label for="ingredientName" class="form-label">Ingredient: </label>
            <input type="text" class="form-control" name="ingredientName" id="ingredientName" value="<%= "hola" %>">
            <input type="hidden" name="command" value="AddCommand">
            <input type="hidden" name="idMenu" value="<%= idMenu %>">

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>
