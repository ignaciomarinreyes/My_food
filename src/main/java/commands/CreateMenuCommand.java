package commands;

import model.Menu;
import model.User;
import persistence.dao.DAOMenu;

import javax.servlet.http.HttpSession;

public class CreateMenuCommand extends FrontCommand{
    @Override
    public void process() {
        HttpSession session = request.getSession(true);

        String nameMenu = request.getParameter("nameMenu");
        DAOMenu daoMenu = new DAOMenu();

        User usuario = (User) session.getAttribute("user");

        Menu menu = new Menu(nameMenu, usuario);
        int idMenu = daoMenu.create(menu);

        session.setAttribute("menu", menu);
        request.setAttribute("idMenu", idMenu);

        forward("/edit_menu.jsp");
    }
}
