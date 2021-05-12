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
public class SearchMenuCommand extends FrontCommand{

    @Override
    public void process() {
        DAOMenu daoMenu = new DAOMenu();
        try{
            List<Menu> menus = daoMenu.findByUserAndName(((User) request.getSession().getAttribute("user")).getId(), request.getParameter("search"));
            request.setAttribute("menuList", menus);
        forward("/main_page.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
}
