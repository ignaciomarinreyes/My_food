package commands;

import model.Menu;
import model.User;
import persistence.dao.DAOMenu;

import javax.servlet.http.HttpSession;

public class CreateMenuCommand extends FrontCommand{
    @Override
    public void process() {
        HttpSession session = request.getSession(true);

        User usuario = (User) session.getAttribute("user");

        String nameMenu = request.getParameter("menuName");

        DAOMenu daoMenu = new DAOMenu();

        Menu menu = new Menu(nameMenu, usuario);
        int idMenu = daoMenu.create(menu);

        request.setAttribute("menuObject", menu);
        request.setAttribute("idMenu", idMenu);

        forward("/edit_menu.jsp");
    }
}
