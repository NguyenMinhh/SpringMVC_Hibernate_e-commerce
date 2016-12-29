/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import modelHelper.Pager;
import modelHelper.ProductHelper;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Product;

/**
 *
 * @author HoangMinh
 */
@Controller
@RequestMapping(value = "/")
public class TypeOfProduct {

    @RequestMapping(value = "typeofproduct", method = RequestMethod.GET)
    public String getProductByCategoryId(@RequestParam(value = "category_id") int id,
            @RequestParam(value = "page", required = false) String page, ModelMap m, HttpServletRequest request) {
        
        Pager p = new Pager();
        int limit = 8;
        int selectPage = 0;
        System.out.println("~~~~~~~~~~~~~~~~~~  " + page);
        if (page != null) {
            selectPage = Integer.parseInt(page);
        }
        int start = p.findStart(limit, selectPage);
        int count = lstProductByCategoryId(id).size();
        int pages = p.findPages(count, limit);
        
        
        m.addAttribute("lstTypeOfProduct", lstProductByCategoryId(id, start, limit));
        m.addAttribute("pager", p);
        m.addAttribute("selectPage", selectPage);
        m.addAttribute("pages", pages);
        m.addAttribute("getRequestURI", request.getRequestURI());

        System.out.println("~~~ : " + m.values());
        return "typeofproduct";
    }

    public ArrayList<Product> lstProductByCategoryId(int id, int start, int limit) {
        ProductHelper p = new ProductHelper();
        //String sql = "Select p From Product p, Category c Where p.categoryId = c.id";
        ArrayList<Product> lstProductById = p.getProductByCategoryId(id, start, limit);
        return lstProductById;
    }
    
    public ArrayList<Product> lstProductByCategoryId(int id) {
        ProductHelper p = new ProductHelper();
        //String sql = "Select p From Product p, Category c Where p.categoryId = c.id";
        ArrayList<Product> lstProductById = p.getProductByCategoryId(id);
        return lstProductById;
    }
}
