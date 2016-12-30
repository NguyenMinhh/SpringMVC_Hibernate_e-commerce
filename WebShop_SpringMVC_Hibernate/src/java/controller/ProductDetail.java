/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import modelHelper.ProductHelper;
import org.springframework.stereotype.Controller;
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
public class ProductDetail {

    @RequestMapping(value = "/productdetail", method = RequestMethod.GET)
    public String getDetailOfProduct(@RequestParam(value = "product_id") int id, ModelMap model){
        
        System.out.println("Id of product : " + id);
        ProductHelper p = new ProductHelper();
        Product pr = p.getProductById(id);
        model.addAttribute("p", pr);
        
        return "productdetail";
    }
    
    @RequestMapping(value = "/productdetail", method = RequestMethod.POST)
    public String getDetailOfProductPost(@RequestParam(value = "product_id") int id, ModelMap model){
        
        System.out.println("Id of product method post: " + id);
        
        //ProductHelper p = new ProductHelper();
        //Product pr = p.getProductById(id);
        //model.addAttribute("p", pr);
        
        return "redirect:productdetail.htm?product_id=" + id;
    }

}
