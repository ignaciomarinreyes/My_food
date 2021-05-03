package commands;

import model.Menu;
import persistence.dao.DAOMenu;

public class EditMenuCommand extends FrontCommand{
    @Override
    public void process() {
        int idMenu = Integer.parseInt(request.getParameter("idMenu"));
        DAOMenu daoMenu = new DAOMenu();
        Menu menu = daoMenu.read(idMenu);

        request.setAttribute("menuObject", menu);
        request.setAttribute("idMenu", idMenu);

        forward("/edit_menu.jsp");
    }
}
