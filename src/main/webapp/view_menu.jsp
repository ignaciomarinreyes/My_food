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

    String sharedLink = (String) request.getAttribute("sharedLink");

    Set<Item> items = menu.getItems();
    Set<Section> sections = menu.getSections();

%>
<body>
<div class="row" style="margin-top: 1rem;">
    <div class="col"></div>
    <div class="col-4 text-center">
        <label for="share" class="col-sm-3 col-form-label">Share: </label>
        <input type="text" readonly class="form-control" id="share" value="<%= sharedLink %>">
        <br>
        <button class="btn btn-primary">
            Generate QR
        </button>
        <button class="btn btn-outline-warning" onclick="copyFunction()" data-bs-toggle="tooltip" data-bs-placement="top" title="Copy to clipboard">
            Copy
        </button>
    </div>
    <div class="col"></div>
</div>
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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
    function copyFunction() {
        var copyText = document.getElementById("share");
        copyText.select();
        copyText.setSelectionRange(0, 99999)
        document.execCommand("copy");
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
