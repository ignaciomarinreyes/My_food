package commands;

import model.Item;
import model.Menu;
import model.User;
import persistence.dao.DAOItem;
import persistence.dao.DAOMenu;

public class AddCommand extends FrontCommand {

    String[] stringValues = {"menuName", "itemName", "sectionName"};

    //EDITAR DE CREAR <-

    @Override
    public void process() {
        int id = Integer.parseInt(request.getParameter("id"));
        String parameter = recoverParameter();
        if (parameter == null) {
            forward("/unknown.jsp");
        } else {
            DAOMenu menu = new DAOMenu();

            Menu me = menu.read(id);

            switch (parameter) {
                case "menuName":
                    //CREAR
                    User usuario = null; // SESSION
                    Menu m = new Menu(parameter, usuario);
                    menu.create(m);

                    break;
                case "itemName":
                    DAOItem item = new DAOItem();
                    Item i = new Item(parameter);

                    item.create(i);
                    me.add(item);
                    //QUE RETORNE EL ID CUANDO SE CREA UN MENU
                    //MENU.ADD(ITEM)
                    //CONSTRUCTOR DE ITEM QUE RECIBA EL NOMBRE
                    break;
                case "sectionName":
                    //FUNCION DE AÑADIR SECTION
                    break;
                default:
                    forward("/unknown.jsp");
                    break;
            }
        }
    }

    private String recoverParameter() {
        for (int i = 0; i < stringValues.length; i++) {
            if (request.getParameter(stringValues[i]) != null) return request.getParameter(stringValues[i]);
        }
        return null;
    }
}