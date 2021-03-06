package commands;

import model.Menu;
import persistence.dao.DAOMenu;

import javax.servlet.http.HttpSession;

public class PreviewCommand extends FrontCommand{
    @Override
    public void process() {

        int idMenu = Integer.parseInt(request.getParameter("idMenu"));
        DAOMenu daoMenu = new DAOMenu();
        Menu menu = daoMenu.read(idMenu);

        request.setAttribute("idMenu", idMenu);
        request.setAttribute("menuObject", menu);

        request.setAttribute("sharedLink", "http://localhost:8080/My_food/FrontServlet?command=ShareCommand&idMenu="+idMenu);

        forward("/view_menu.jsp");
    }
}
