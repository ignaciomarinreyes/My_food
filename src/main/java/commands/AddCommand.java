package commands;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import org.hibernate.tool.schema.internal.exec.ScriptTargetOutputToFile;
import persistence.dao.DAOIngredient;
import persistence.dao.DAOItem;
import persistence.dao.DAOMenu;
import persistence.dao.DAOSection;

import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddCommand extends FrontCommand {

    String[] stringValues = {"menuName", "itemName", "sectionName", "ingredientName"};

    @Override
    public void process() {
        String parameter = recoverParameter();
        HttpSession session = request.getSession(true);
        System.out.println("ENTRA");
        System.out.println(parameter);
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
                    DAOSection daoSectionItem = new DAOSection();
                    Section sectionItem = daoSectionItem.read(Integer.parseInt(request.getParameter("idSection")));
                    DAOItem daoItem = new DAOItem();
                    Item item = new Item(sectionItem, request.getParameter(parameter));
                    double price = Double.parseDouble(request.getParameter("itemPrice"));
                    if (price != 0) {
                        item.setPrice(price);
                    }
                    daoItem.create(item);
                    break;
                case "ingredientName":
                    DAOItem daoItemIngredient = new DAOItem();
                    Item itemIngredient = daoItemIngredient.read(Integer.parseInt(request.getParameter("idItem")));
                    DAOIngredient daoIngredient = new DAOIngredient();
                    Ingredient ingredient = new Ingredient(itemIngredient, request.getParameter(parameter));
                    daoIngredient.create(ingredient);
                    itemIngredient.addIngredient(ingredient);
                    daoItemIngredient.update(itemIngredient);
                    break;
                case "sectionName":
                    DAOSection daoSection = new DAOSection();
                    Section section = new Section(menu, request.getParameter(parameter));
                    daoSection.create(section);
                    menu.addSection(section);
                    break;
                case "image":


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
            if (request.getParameter(stringValues[i]) != null) {
                return stringValues[i];
            }
        }
        return null;
    }


}
