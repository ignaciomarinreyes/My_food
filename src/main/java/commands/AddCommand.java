package commands;

import model.Item;
import model.Menu;
import model.Section;
import model.User;
import org.hibernate.tool.schema.internal.exec.ScriptTargetOutputToFile;
import persistence.dao.DAOItem;
import persistence.dao.DAOMenu;
import persistence.dao.DAOSection;

import javax.servlet.http.HttpSession;

public class AddCommand extends FrontCommand {

    String[] stringValues = {"menuName", "itemName", "sectionName"};

    @Override
    public void process() {
        String parameter = recoverParameter();
        HttpSession session = request.getSession(true);

        int idMenu = Integer.parseInt(request.getParameter("idMenu"));
        System.out.println("ID MENU EN EL ADD"+idMenu);
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
                    DAOSection daoSectionItem = new DAOSection();
                    Section sectionItem = daoSectionItem.read(Integer.parseInt(request.getParameter("idSection")));
                    DAOItem daoItem = new DAOItem();
                    Item item = new Item(sectionItem, request.getParameter(parameter));
                    daoItem.create(item);
                    break;
                case "sectionName":
                    DAOSection daoSection = new DAOSection();
                    Section section = new Section(menu, request.getParameter(parameter));
                    daoSection.create(section);
                    menu.addSection(section);
                    break;
                default:
                    forward("/unknown.jsp");
                    break;
            }

            Menu finalMenu = daoMenu.read(idMenu);
            request.setAttribute("idMenu", idMenu);
            request.setAttribute("menuObject", finalMenu);

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
