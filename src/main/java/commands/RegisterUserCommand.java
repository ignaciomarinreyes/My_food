package commands;

import model.User;
import persistence.dao.DAOUser;

public class RegisterUserCommand extends FrontCommand {
    @Override
    public void process() {
        DAOUser daoUser = new DAOUser();

        String nickname = request.getParameter("nickname");
        String password = request.getParameter("firstPassword");
        String fullname = request.getParameter("fullname");

        User user = new User(nickname, password, fullname);
        daoUser.create(user);

        forward("/index.jsp");
    }
}
