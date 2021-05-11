<%@ page import="model.Menu" %>
<%@ page import="model.Item" %>
<%@ page import="model.Section" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Ingredient" %>
<%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 11/05/2021
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title>Welcome!</title>
    <style>
        body {
            background-color: #f8f9fa!important;
        }
    </style>

</head>

<%
    Menu menu = (Menu) request.getAttribute("menuObject");
    Integer idMenu = (Integer) request.getAttribute("idMenu");

    Set<Item> items = menu.getItems();
    Set<Section> sections = menu.getSections();

%>
<body>
<div class="row" style="margin-top: 2rem;">
    <div class="col"></div>
    <div class="col-6">
        <div class="card  text-center">
            <div class="card-header">
                <h2><%= menu.getName() %>
                </h2>
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
                </li>
                <%
                    }
                %>
            </ul>
            <%
                        }
                    }
                }
            %>
        </div>
    </div>
    <div class="col"></div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
