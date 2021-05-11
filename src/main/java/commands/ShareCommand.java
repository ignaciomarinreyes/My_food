package commands;

import model.Menu;
import persistence.dao.DAOMenu;

public class ShareCommand extends FrontCommand{
    @Override
    public void process() {
        int idMenu = Integer.parseInt(request.getParameter("idMenu"));
        DAOMenu daoMenu = new DAOMenu();
        Menu menu = daoMenu.read(idMenu);

        request.setAttribute("idMenu", idMenu);
        request.setAttribute("menuObject", menu);

        forward("/shared_menu.jsp");
    }
}
