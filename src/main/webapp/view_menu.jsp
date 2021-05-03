<%@ page import="model.Menu" %>
<%@ page import="model.Item" %>
<%@ page import="model.Section" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Ingredient" %><%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 03/05/2021
  Time: 11:08
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
<br>
</div>
<% }
}
}
  }
%>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
