<%@ page import="model.User" %>
<%@ page import="model.Menu" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Luicko
  Date: 26/04/2021
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="header.jsp"></jsp:include>

<%
    User user = (User) session.getAttribute("user"); //MANDAR AL HEADER?
    ArrayList<Menu> menuList;
    menuList = (ArrayList<Menu>) request.getAttribute("menuList");
%>

<body>
<main class="flex-shrink-0">
    <div class="container">
        <div class="row">
            <div class="col-2">
                <h2>Menus</h2>
            </div>
            <div class="col">
                <form action="FrontServlet" method="GET">
                    <input type="text" class="form-control" placeholder="Search..." name="search">
                    <input type="hidden" name="command" value="SearchMenuCommand">
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button"
                   aria-expanded="false" aria-controls="collapseExample">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-plus" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </a>
                <div class="collapse" id="collapseExample">
                    <form action="FrontServlet" method="GET">
                        <input type="hidden" name="command" value="CreateMenuCommand">
                        <label for="menuInput" class="form-label">Menu Name</label>
                        <input type="text" name="menuName" class="form-control" id="menuInput">
                        <button type="submit" class="btn btn-outline-success">Create</button>
                    </form>
                </div>
            </div>
            <div class="col">

            </div>
        </div>
        <br>
        <div class="row">
            <%
                for (Menu menu :
                        menuList) {
            %>
            <div class="col-3">
                <!-- SE DEBERÍA ACOMODAR EL WITH -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= menu.getName() %>
                        </h5>
                        <div class="container">
                            <div class="row">
                                <form action="FrontServlet" method="GET" style="width: 43px">
                                    <input type="hidden" name="command" value="EditMenuCommand">
                                    <input type="hidden" name="idMenu" value="<%= menu.getId() %>">
                                    <button type="submit" class="btn btn-outline-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-pencil" viewBox="0 0 16 16">
                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
                                        </svg>
                                    </button>
                                </form>
                                <form action="FrontServlet" method="GET" style="width: 43px">
                                    <input type="hidden" name="command" value="PreviewCommand">
                                    <input type="hidden" name="idMenu" value="<%= menu.getId() %>">
                                    <button type="submit" class="btn btn-outline-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-eye" viewBox="0 0 16 16">
                                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                        </svg>
                                    </button>
                                </form>
                                <form action="FrontServlet" method="GET" style="width: 43px">
                                    <input type="hidden" name="command" value="DeleteMenuCommand">
                                    <input type="hidden" name="id" value="<%= menu.getId() %>">
                                    <button type="button" class="btn btn-outline-secondary" id="WAIT FOR IT">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor"
                                         class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                    </svg>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>

        </div>
    </div>
    <button type="button" class="btn btn-primary" id="deleteToastBtn">Show live toast</button>

    <div class="position-fixed top-50 start-50 translate-middle" style="z-index: 5">
        <div id="deleteToas" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <img src="..." class="rounded me-2" alt="...">
                <strong class="me-auto">Bootstrap</strong>
                <small>11 mins ago</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Hello, world! This is a toast message.
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
    <script>
        document.getElementById("deleteToastBtn").onclick = function() {
            var myAlert =document.getElementById('deleteToas');//select id of toast
            var bsAlert = new bootstrap.Toast(myAlert);//inizialize it
            bsAlert.show();//show it
        };
    </script>
</main>
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>
