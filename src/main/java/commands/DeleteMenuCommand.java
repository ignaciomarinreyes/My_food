/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package commands;

import java.util.List;
import model.Menu;
import model.User;
import persistence.dao.DAOMenu;

/**
 *
 * @author ignacio
 */
public class DeleteMenuCommand extends FrontCommand{

    @Override
    public void process() {
        int idMenu = Integer.parseInt(request.getParameter("id"));
        System.out.println(idMenu);
        DAOMenu daoMenu = new DAOMenu();
        daoMenu.remove(idMenu);
        List<Menu> ListMenuAll = daoMenu.findByUser(((User) request.getSession().getAttribute("user")).getId());
        request.setAttribute("menuList", ListMenuAll);
        forward("/main_page.jsp");
    }
    
}
