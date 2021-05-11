package commands;

import javax.servlet.http.HttpSession;

public class LogOutCommand extends FrontCommand{
    @Override
    public void process() {
        HttpSession session = request.getSession(true);

        session.setAttribute("user", null);

        forward("/index.jsp");
    }
}
