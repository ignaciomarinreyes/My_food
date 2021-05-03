package commands;

import model.Menu;
import persistence.dao.DAOMenu;

public class GetMenuCommand extends FrontCommand{
    @Override
    public void process() {
        int idMenu = Integer.parseInt(request.getParameter("idMenu"));

        DAOMenu daoMenu = new DAOMenu();
        Menu menu = daoMenu.read(idMenu);

        forward("/view_menu.jsp");
    }
}
