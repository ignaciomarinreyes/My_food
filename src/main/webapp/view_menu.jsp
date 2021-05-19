<%@page import="java.util.List"%>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.*" %><%--
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

    List<Item> items = menu.getItems();
    Set<Section> sections = menu.getSections();

%>
<style>
    .imageButton{
        border-radius: 15px;
    }
</style>
<body>
<div class="row" style="margin-top: 1rem;">
    <div class="col"></div>
    <div class="col-4 text-center">
        <label for="share" class="col-sm-3 col-form-label">Share: </label>
        <input type="text" readonly class="form-control" id="share" value="<%= sharedLink %>">
        <br>
        <button class="btn btn-primary" onclick="clickShowQR()">
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

                        }

                        Set<Ingredient> ingredients = item.getIngredients();
                        String result = "";
                        for (Ingredient i :
                                ingredients) {
                            result += " " + i.getName() + ",";
                        }
                    %>
                    <div class="mb-4 row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-1 form-check form-switch">
                            <% for (Allergen allergen : item.getAllergens()) {
                                if (allergen.getName().equals("peanutsAllegen")) {
                            %>
                            <img src="IconoAlergenoCacahuete-Peanuts_icon-icons.com_67604.png">
                            <% break; }
                            } %>

                        </div>
                        <div class="col-sm-1 form-check form-switch">
                            <% for (Allergen allergen : item.getAllergens()) {
                                if (allergen.getName().equals("glutenAllegen")) {
                            %>
                            <img src="IconoAlergenoGluten-Gluten_icon-icons.com_67600.png">
                            <% break; }
                            } %>
                        </div>
                        <div class="col-sm-1 form-check form-switch">
                            <% for (Allergen allergen : item.getAllergens()) {
                                if (allergen.getName().equals("eggAllegen")) {
                            %>
                            <img src="IconoAlergenoHuevo-Egg_icon-icons.com_67598.png">
                            <% break; }
                            } %>

                        </div>
                        <div class="col-sm-1 form-check form-switch">
                            <% for (Allergen allergen : item.getAllergens()) {
                                if (allergen.getName().equals("dairyAllegen")) {
                            %>
                            <img src="IconoAlergenoLacteos-DairyProducts_icon-icons.com_67597.png">
                            <% break; }
                            } %>

                        </div>
                        <div class="col-sm-1 form-check form-switch">
                            <% for (Allergen allergen : item.getAllergens()) {
                                if (allergen.getName().equals("mollusksAllegen")) {
                            %>
                            <img src="IconoAlergenoMoluscos-Mollusks_icon-icons.com_67596.png">
                            <% break; }
                            } %>
                        </div>
                        <div class="col-sm-1 form-check form-switch">
                            <% for (Allergen allergen : item.getAllergens()) {
                                if (allergen.getName().equals("fishAllegen")) {
                            %>
                            <img src="Fish_icon-icons.com_67594.png">
                            <% break; }
                            } %>
                        </div>
                    </div>
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

<div class="position-fixed top-50 start-50 translate-middle" style="z-index: 5">
    <div id="deleteToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            <img src="" id="imageToast" class="img-thumbnail" height="500px" width="500px">
            <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">Cancel</button>
        </div>
    </div>
</div>
<div class="position-fixed top-50 start-50 translate-middle" style="z-index: 5">
    <div id="qrToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            <img src="https://qrickit.com/api/qr.php?d=<%= sharedLink %>">
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
<script>
    function clickShowQR() {
        var myAlert =document.getElementById('qrToast');//select id of toast
        var bsAlert = new bootstrap.Toast(myAlert);//inizialize it
        bsAlert.show();//show it
    };
</script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
