/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package commands;

import model.Menu;
import persistence.dao.DAOMenu;

/**
 *
 * @author ignacio
 */
public class UploadImageEditMenuCommand extends FrontCommand{

    @Override
    public void process() {
        int idMenu = (Integer) request.getAttribute("idMenu");
        DAOMenu daoMenu = new DAOMenu();
        Menu menu = daoMenu.read(idMenu);
        
        request.setAttribute("menuObject", menu);
        request.setAttribute("idMenu", idMenu);

        forward("/edit_menu.jsp");
    }
    
}
