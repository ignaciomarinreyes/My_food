/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dao;

import java.util.List;
import javax.persistence.Query;
import javax.transaction.Transactional;
import model.Menu;
import org.hibernate.Session;
import org.hibernate.Transaction;
import persistence.HibernateUtil;

/**
 *
 * @author ignacio
 */
public class DAOMenu extends DAOBase<Menu>{
    
    @Transactional
    public List<Menu> findByUser(int idUser) {
        List<Menu> menus = null;
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Query query = session.createNativeQuery("SELECT * FROM menu WHERE id_user = ?", Menu.class);
            query.setParameter(1, idUser);
            menus = query.getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return menus;
    }
    
    @Transactional
    public List<Menu> findByUserAndName(int idUser, String name) {
        List<Menu> menus = null;
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Query query = session.createNativeQuery("SELECT * FROM menu WHERE name LIKE '%" + name + "%' AND id_user = " + idUser, Menu.class);          
            menus = query.getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return menus;
    }
}
