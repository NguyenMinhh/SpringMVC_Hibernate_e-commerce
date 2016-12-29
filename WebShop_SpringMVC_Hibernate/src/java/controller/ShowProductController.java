/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import modelHelper.CategoryHelper;
import modelHelper.ProductHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pojo.Category;
import pojo.Product;

/**
 *
 * @author HoangMinh
 */
@Controller
@RequestMapping(value = "/")
public class ShowProductController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getEightProduct(ModelMap model) {


        String sqlGetFeaturedProduct = "from Product order by create_date desc";
        String sqlGetBestSellerProduct = "select p from Product p, Report r where p.id = r.productId and r.type = 'X' order by r.amount desc";

        model.addAttribute("lstFeaturedProduct", listFeaturedProduct());
        model.addAttribute("lstBestSellerProduct", listBestSellerProduct());
        model.addAttribute("lstCategory", listCategory());

        System.out.println(listFeaturedProduct().size());
        System.out.println(listBestSellerProduct().size());
        System.out.println("xem gia tri trong model map : " + model.values());

        return "index";
    }

    public ArrayList<Product> listFeaturedProduct() {
        ProductHelper p = new ProductHelper();
        String sqlGetFeaturedProduct = "from Product order by create_date desc";
        ArrayList<Product> tmp1 = (ArrayList<Product>) p.getProductByHQL(sqlGetFeaturedProduct);
        System.out.println("|||||||" + tmp1.size());
        return tmp1;
    }

    public ArrayList<Product> listBestSellerProduct() {
        ProductHelper p = new ProductHelper();
        String sqlGetBestSellerProduct = "select p from Product p, Report r where p.id = r.productId and r.type = 'X' order by r.amount desc";
        ArrayList<Product> tmp2 = (ArrayList<Product>) p.getProductByHQL(sqlGetBestSellerProduct);
        System.out.println("+++" + tmp2.size());
        return tmp2;
    }
    
    public ArrayList<Category> listCategory(){
        CategoryHelper c = new CategoryHelper();
        ArrayList<Category> lstCategory = (ArrayList<Category>) c.showCategory();
        
        return lstCategory;
    }

}
