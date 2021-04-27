package commands;

import model.User;
import persistence.dao.DAOUser;

public class LoginCommand extends FrontCommand{
    @Override
    public void process() {
        DAOUser daoUser = new DAOUser();

        User u = daoUser.login(request.getParameter("username"), request.getParameter("password"));

        if (u != null){
            request.setAttribute("user", u);
            forward("/main_page.jsp");
        }else{
            forward("/unknown.jsp");
        }
    }
}
