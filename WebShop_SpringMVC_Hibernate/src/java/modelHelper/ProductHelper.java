/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelHelper;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Product;

/**
 *
 * @author HoangMinh
 */
public class ProductHelper {

    Session session = null;

    public ProductHelper() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public ArrayList<Product> getProductByHQL(String sql) {
        ArrayList<Product> lstProduct = null;
        try {
            Transaction tx = session.beginTransaction();
            //get featured product
            //String sql = "from Product order by create_date desc";            
            //get bestseller
            //String sql2 = "select p from Product p, Report r where p.id = r.productId and r.type = 'X' order by r.amount desc";

            Query q = session.createQuery(sql);
            //q.setFirstResult(5);
            q.setMaxResults(8);
            lstProduct = (ArrayList<Product>) q.list();
            tx.commit();
        } catch (Exception ex) {
            System.out.println("~~~~~~~~~" + ex.getMessage());
        }

        return lstProduct;
    }

    public ArrayList<Product> getProductByCategoryId(int id, int start, int limit) {
        ArrayList<Product> lstProduct = null;
        try {
            Transaction tx = session.beginTransaction();
            String sql = "Select p From Product p, Category c Where p.categoryId = :id";

            Query q = session.createQuery(sql);
            q.setFirstResult(start);
            q.setMaxResults(limit);
            q.setInteger("id", id);
            //q.setInteger("start", start);
            //q.setInteger("limit", limit);
            lstProduct = (ArrayList<Product>) q.list();
            tx.commit();
        } catch (Exception ex) {
            System.out.println("~~~~~~~~~" + ex.getMessage());
        }

        return lstProduct;
    }
    
    public ArrayList<Product> getProductByCategoryId(int id) {
        ArrayList<Product> lstProduct = null;
        try {
            Transaction tx = session.beginTransaction();
            String sql = "Select p From Product p, Category c Where p.categoryId = :id";

            Query q = session.createQuery(sql);
            
            q.setInteger("id", id);
            //q.setInteger("start", start);
            //q.setInteger("limit", limit);
            lstProduct = (ArrayList<Product>) q.list();
            tx.commit();
        } catch (Exception ex) {
            System.out.println("~~~~~~~~~" + ex.getMessage());
        }

        return lstProduct;
    }
    
    public Product getProductById(int id){
        this.session = HibernateUtil.getSessionFactory().openSession();
        Product p = new Product();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            p = (Product) session.get(Product.class, id);
            tx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            session.getTransaction().rollback();
        }
        session.close();
        return p;
    }

}
