package commands;

import model.*;
import persistence.dao.*;

import java.util.ArrayList;
import java.util.List;

public class AddCommand extends FrontCommand {

    String[] stringValues = {"allergenName", "menuName", "itemName", "sectionName", "ingredientName"};
    String[] allergenList = { "peanutsAllegen", "glutenAllegen", "eggAllegen", "dairyAllegen", "mollusksAllegen", "fishAllegen" };

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
                    case "menuName":
                        menu.setName(request.getParameter(parameter));
                        daoMenu.update(menu);
                        break;
                    case "itemName":
                        DAOSection daoSectionItem = new DAOSection();
                        Section sectionItem = daoSectionItem.read(Integer.parseInt(request.getParameter("idSection")));
                        DAOItem daoItem = new DAOItem();
                        Item item = new Item(request.getParameter(parameter));
                        item.addSection(sectionItem);
                        double price = Double.parseDouble(request.getParameter("itemPrice"));
                        if (price != 0) {
                            item.setPrice(price);
                        }                      
                        menu.addItem(item);
                        item.addMenu(menu);
                        daoMenu.update(menu);
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
                    case "allergenName":
                        DAOItem daoItemAllergen = new DAOItem();
                        Item itemAllergen = daoItemAllergen.read(Integer.parseInt(request.getParameter("idItem")));
                        DAOAllergen daoAllergen = new DAOAllergen();

                        List<String> recoverAllergen = recoverAllergen();
                        List<Allergen> allergenListObject = new ArrayList<>();

                        recoverAllergen.forEach((allergen) -> {
                            allergenListObject.add(new Allergen(itemAllergen, allergen));
                        });

                        allergenListObject.forEach((object) -> {
                            daoAllergen.create(object);
                            itemAllergen.addAllergen(object);
                        });

                        daoItemAllergen.update(itemAllergen);
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

    private List<String> recoverAllergen() {
        List<String> resultList = new ArrayList<>();
        for (int i = 0; i < allergenList.length; i++) {
            if (request.getParameter(allergenList[i]) != null) {
                resultList.add(allergenList[i]);
            }
        }
        return resultList;
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
