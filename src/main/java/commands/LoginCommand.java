package commands;

import persistence.dao.DAOUser;

public class LoginCommand extends FrontCommand{
    @Override
    public void process() {
        

        forward("/main_page.jsp");
    }
}
