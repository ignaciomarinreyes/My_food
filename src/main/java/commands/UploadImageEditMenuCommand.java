/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package commands;

import model.Item;
import model.Menu;
import persistence.dao.DAOItem;
import persistence.dao.DAOMenu;

/**
 *
 * @author ignacio
 */
public class UploadImageEditMenuCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            DAOItem daoItem = new DAOItem();
            Item item = daoItem.read(new Integer((String)request.getAttribute("idItem")));
            item.setImage((String) request.getAttribute("pathImage"));
            daoItem.update(item);
            DAOMenu daoMenu = new DAOMenu();
            int idMenu = new Integer((String) request.getAttribute("idMenu"));
            Menu menu = daoMenu.read(idMenu);
            request.setAttribute("menuObject", menu);
            request.setAttribute("idMenu", idMenu);

            forward("/edit_menu.jsp");
        } catch(Exception e){
            e.printStackTrace();
        }

    }

}
