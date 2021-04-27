package commands;

public class CreateMenuCommand extends FrontCommand{
    @Override
    public void process() {
        forward("/edit_menu.jsp");
    }
}
