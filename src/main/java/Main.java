import java.util.ArrayList;
import java.util.List;
import model.Ingredient;
import model.Menu;
import model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.json.simple.parser.ParseException;

import persistence.HibernateUtil;
import persistence.dao.DAOIngredient;
import persistence.dao.DAOMenu;
import persistence.dao.DAOUser;

public class Main {
    
    public static void main(String[] args) throws ParseException {
        createDataBase();
        HibernateUtil.shutdown();
        //DAOIngredient service = new DAOIngredient();
        //service.create(new Ingredient("hola"));
        
    }


    private static void createDataBase() {   
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }       
}