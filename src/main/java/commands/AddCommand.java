package commands;

import model.Item;
import model.Menu;
import model.Section;
import model.User;
import persistence.dao.DAOItem;
import persistence.dao.DAOMenu;
import persistence.dao.DAOSection;

public class AddCommand extends FrontCommand {

    String[] stringValues = {"menuName", "itemName", "sectionName"};

    @Override
    public void process() {
        String parameter = recoverParameter();
        int idMenu = Integer.parseInt(request.getParameter("idMenu"));
        if (parameter == null) {
            forward("/unknown.jsp");
        } else {
            DAOMenu daoMenu = new DAOMenu();
            Menu menu = daoMenu.read(idMenu);
            switch (parameter) {
                case "menuName":
                    menu.setName(request.getParameter(parameter));
                    daoMenu.update(menu);
                    break;
                case "itemName":
                    DAOItem daoItem = new DAOItem();
                    Item item = new Item(request.getParameter(parameter));
                    daoItem.create(item);                    
                    menu.addItem(item);
                    break;
                case "sectionName":
                    DAOSection daoSection = new DAOSection();
                    Section section = new Section(request.getParameter(parameter));
                    daoSection.create(section);
                    break;
                default:
                    forward("/unknown.jsp");
                    break;
            }

            request.setAttribute("idMenu", idMenu);
            forward("/edit_menu.jsp");
        }
    }

    private String recoverParameter() {
        for (int i = 0; i < stringValues.length; i++) {
            if (request.getParameter(stringValues[i]) != null) return stringValues[i];
        }
        return null;
    }
}
