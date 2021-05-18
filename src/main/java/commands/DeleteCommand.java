package commands;

import model.Menu;
import persistence.dao.DAOIngredient;
import persistence.dao.DAOItem;
import persistence.dao.DAOMenu;
import persistence.dao.DAOSection;

public class DeleteCommand extends FrontCommand{
String[] stringValues = {"itemId", "sectionId", "ingredientId"};

    @Override
    public void process() {
        try {
            String parameter = recoverParameter();
            int idMenu = Integer.parseInt(request.getParameter("idMenu"));
            if (parameter == null) {
                forward("/unknown.jsp");
            } else {
                DAOMenu daoMenu = new DAOMenu();
                Menu menu = daoMenu.read(idMenu);
                switch (parameter) {
                    case "itemId":
                        int idItem = Integer.parseInt(request.getParameter("itemId"));
                        DAOItem daoitem = new DAOItem();
                        daoitem.remove(idItem);
                        break;
                    case "ingredientId":
                        int idIngredient = Integer.parseInt(request.getParameter("ingredientId"));
                        DAOIngredient daoingredient = new DAOIngredient();
                        daoingredient.remove(idIngredient);
                        break;
                    case "sectionId":
                        int idSection = Integer.parseInt(request.getParameter("sectionId"));
                        DAOSection daosection = new DAOSection();
                        daosection.remove(idSection);
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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String recoverParameter() {
        for (int i = 0; i < stringValues.length; i++) {
            if (request.getParameter(stringValues[i]) != null) {
                return stringValues[i];
            }
        }
        return null;
    }
}
