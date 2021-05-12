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
    <div class="col"></div>
    <div class="col-6">
        <div class="card  text-center">
            <div class="card-header">
                <%= menu.getName() %>
            </div>
            <%
                if (sections != null) {
                    Iterator<Section> iterator = sections.iterator();
                    while (iterator.hasNext()) {
                        Section next = iterator.next();
            %>
            <div class="card-body">
                <h4 class="card-title">
                    <%= next.getName() %>
                </h4>
            </div>
            <%
                Set sectionItems = next.getItems();
                if (sectionItems != null) {%>
            <ul class="list-group list-group-flush">
                <%
                    Iterator<Item> itemIterator = sectionItems.iterator();
                    while (itemIterator.hasNext()) {
                        Item item = itemIterator.next();
                %>
                <li class="list-group-item"><%= item.getName() %> - - - - - - <%= item.getPrice() %>€</li>

                <%
                    Set<Ingredient> ingredients = item.getIngredients();
                    String result = "";
                    for (Ingredient i :
                            ingredients) {
                        result += " " + i.getName() + ",";
                    }
                %>
                <% if (!result.equals("")) {%>
                <li class="list-group-item">
                    Ingredients: <%= result %>
                </li>
                <% } %>
                <li class="list-group-item">
                    <form action="FrontServlet" method="POST">
                        <div class="mb-3 row">
                            <label for="ingredientNameItem1" class="col-sm-3 col-form-label">Add Ingredient: </label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="ingredientName" id="ingredientNameItem1">
                            </div>
                            <input type="hidden" name="command" value="AddCommand">
                            <input type="hidden" name="idMenu" value="<%= idMenu %>">
                            <input type="hidden" name="idItem" value="<%= item.getId() %>">

                            <button type="submit" class="col-sm-1 btn btn-outline-success">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-plus" viewBox="0 0 16 16">
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                            </button>
                        </div>
                    </form>
                </li>

                <%
                        }
                    } %>
                <li class="list-group-item">
                    <form action="FrontServlet" method="POST">
                        <div class="mb-3 row">
                            <label for="itemNameNew1" class="col-sm-3 col-form-label">Add Item: </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="itemName" id="itemNameNew1">
                                <input type="hidden" name="command" value="AddCommand">
                            </div>
                            <div class="col-sm-2">
                                <input type="number" class="form-control" name="itemPrice" value="0">
                                <input type="hidden" name="idMenu" value="<%= idMenu %>">
                                <input type="hidden" name="idSection" value="<%= next.getId() %>">
                            </div>
                            <button type="submit" class="col-sm-1 btn btn-outline-success">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-plus" viewBox="0 0 16 16">
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                            </button>
                        </div>
                    </form>
                </li>
            </ul>
            <%
                    }
                }
            %>
            <div class="card-body">
                <h4 class="badge bg-secondary card-title">
                    <form action="FrontServlet" method="POST">
                        <label for="sectionName1" class="form-label">Add Section: </label>
                        <input type="text" class="form-control" name="sectionName" id="sectionName1" value="">
                        <input type="hidden" name="command" value="AddCommand">
                        <input type="hidden" name="idMenu" value="<%= idMenu %>">

                        <button type="submit" class="btn btn-primary">Add</button>
                    </form>
                </h4>
            </div>
        </div>
    </div>
    <div class="col"></div>
</div>
</body>

<!-- <ul class="list-group list-group-flush">
    <li class="list-group-item">An item</li>
    <li class="list-group-item">A second item</li>
    <li class="list-group-item">A third item</li>

                <p class="card-text"> </p>
<div class="row">
    <div class="card text-center">
        <div class="card-header">
            MENU TITLE
        </div>
        <div class="card-body">
            <h4 class="badge bg-secondary card-title">
                ONE SECTION
            </h4>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">An item</li>
            <p class="card-text">INGREDIENTES</p>
            <li class="list-group-item">A second item</li>
            <li class="list-group-item">A third item</li>
        </ul>

    </div>
</div>



<div class="row">
    <div class="col">
        <h5><%= menu.getName() %>
        </h5>
    </div>
</div>
<%
    if (sections != null) {
        Iterator<Section> iterator = sections.iterator();
        while (iterator.hasNext()) {
            Section next = iterator.next();
%>
<div class="row">

    <div class="col-1">
        <span class="badge bg-secondary"><%= next.getName() %></span>
    </div>
</div>
<%
    Set sectionItems = next.getItems();
    if (sectionItems != null) {
        Iterator<Item> itemIterator = sectionItems.iterator();
        while (itemIterator.hasNext()) {
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
            for (Ingredient i :
                    ingredients) {
                result += " " + i.getName() + ",";
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
</ul>-->

<jsp:include page="footer.jsp"></jsp:include>
</html>
