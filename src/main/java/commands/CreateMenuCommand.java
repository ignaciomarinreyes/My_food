package commands;

import model.Menu;
import model.User;
import persistence.dao.DAOMenu;

public class CreateMenuCommand extends FrontCommand{
    @Override
    public void process() {
        String nameMenu = request.getParameter("nameMenu");
        DAOMenu daoMenu = new DAOMenu();
        User usuario = (User) request.getSession().getAttribute("user");
        Menu menu = new Menu(nameMenu, usuario);
        int idMenu = daoMenu.create(menu);
        request.setAttribute("idMenu", idMenu);
        forward("/edit_menu.jsp");
    }
}
