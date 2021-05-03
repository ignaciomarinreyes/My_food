package commands;

import model.Menu;
import model.User;
import persistence.dao.DAOMenu;
import persistence.dao.DAOUser;

import javax.servlet.http.HttpSession;
import java.util.List;

public class LoginCommand extends FrontCommand{
    @Override
    public void process() {
        HttpSession session = request.getSession(true);

        DAOUser daoUser = new DAOUser();

        User u = daoUser.login(request.getParameter("username"), request.getParameter("password"));

        DAOMenu daoMenu = new DAOMenu();

        List<Menu> byUser = daoMenu.findByUser(u.getId());

        if (u != null){
            session.setAttribute("user", u);
            request.setAttribute("menuList", byUser);
            forward("/main_page.jsp");
        }else{
            forward("/unknown.jsp");
        }
    }
}
