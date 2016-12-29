/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelHelper;

import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Category;

/**
 *
 * @author HoangMinh
 */
public class CategoryHelper {
    Session session = null;
    
    public CategoryHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public ArrayList<Category> showCategory(){
        ArrayList<Category> lstCategory = null;
        
        try{
            Transaction tx = session.beginTransaction();
            String sql = "from Category";
            Query q = session.createQuery(sql);
            lstCategory = (ArrayList<Category>) q.list();
            tx.commit();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return lstCategory;
    }
}
