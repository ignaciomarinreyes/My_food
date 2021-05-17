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
<style>
    .imageButton{
        border-radius: 15px;
    }
</style>
<body>
<div class="row" style="margin-top: 2rem;">
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
                <li class="list-group-item">
                    <%= item.getName() %> - - - - - - <%= item.getPrice() %>€
                    <%
                        if (item.getImage() != null) {
                    %>
                    <button class="btn btn-outline-dark" onclick="clickShowImage('<%= item.getId() %>')">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                        </svg>
                        <img src="<%= item.getImage()%>" id="<%= item.getId() %>" class="imageButton" height="50px" width="50px">
                    </button>
                    <%
                    } else {
                    %>
                    <form action="UploadServlet" method="post" enctype="multipart/form-data">
                        <label class="btn btn-outline-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                 class="bi bi-card-image" viewBox="0 0 16 16">
                                <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
                            </svg>
                            <input type='file' hidden name='image' accept="image/*"/>
                        </label>
                        <input type="hidden" name="command" value="UploadImageEditMenuCommand">
                        <input type="hidden" name="idMenu" value="<%= menu.getId()%>">
                        <input type="hidden" name="idItem" value="<%= item.getId()%>">
                        <button type="submit" class="btn btn-outline-success">
                            Upload
                        </button>
                    </form>
                    <%
                        }
                    %>

                    <%
                        Set<Ingredient> ingredients = item.getIngredients();
                        String result = "";
                        for (Ingredient i :
                                ingredients) {
                            result += " " + i.getName() + ",";
                        }
                    %>
                    <br>
                    <% if (!result.equals("")) {%>
                    Ingredients: <%= result %>
                    <% } %>
                    <br>
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
                %>
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
                <%
                        }
                    } %>

            </ul>
            <%
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

<!--
<li class="list-group-item">
                    <form action="FrontServlet" method="POST">
                        <div class="mb-3 row">
                            <label for="ingredientNameItem1" class="col-sm-3 col-form-label">Add Ingredient: </label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="ingredientName" id="ingredientNameItem1">
                            </div>
                            <input type="hidden" name="command" value="AddCommand">
                            <input type="hidden" name="idMenu" value="<% //idMenu %>">
                            <input type="hidden" name="idItem" value="<% //item.getId() %>">

                            <button type="submit" class="col-sm-1 btn btn-outline-success">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-plus" viewBox="0 0 16 16">
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                            </button>
                        </div>
                    </form>
                </li>


<ul class="list-group list-group-flush">
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

<div class="position-fixed top-50 start-50 translate-middle" style="z-index: 5">
    <div id="deleteToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            <img src="" id="imageToast" class="img-thumbnail" height="500px" width="500px">
            <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">Cancel</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
<script>
    function clickShowImage(url) {
        var myAlert =document.getElementById('deleteToast');//select id of toast
        var bsAlert = new bootstrap.Toast(myAlert);//inizialize it
        bsAlert.show();//show it
        document.getElementById('imageToast').src = document.getElementById(url).src;
    };
</script>

<jsp:include page="footer.jsp"></jsp:include>
</html>
