package commands;

import model.Menu;
import model.User;
import persistence.dao.DAOMenu;

public class CreateMenuCommand extends FrontCommand{
    @Override
    public void process() {
        String parameter = request.getParameter("name");

        DAOMenu menu = new DAOMenu();
        User usuario = null; // SESSION
        Menu m = new Menu(parameter, usuario);
        menu.create(m);

        //request.setAttribute("id", id);
        forward("/edit_menu.jsp");
    }
}
