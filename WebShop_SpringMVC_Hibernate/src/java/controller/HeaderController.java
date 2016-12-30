/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import modelHelper.CategoryHelper;
import modelHelper.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Category;

/**
 *
 * @author HoangMinh
 */
@ControllerAdvice
@Scope("session")
public class HeaderController {

    @Autowired
    ShoppingCart cart;

    @ModelAttribute
    public void myMethod(@RequestParam(value = "category_id", required = false) String id,
            @RequestParam(value = "product_id", required = false) String productId,
            @RequestParam(value = "name", required = false) String productName,
            @RequestParam(value = "price", required = false) String productPrice,
            @RequestParam(value = "amount", required = false) String productAmmount,
            ModelMap model) {

        //Object myValues = // obtain your data from DB here...
        System.out.println("================ " + id);
        System.out.println("================ PRODUCT ID " + productId);

        //int idProduct = Integer.parseInt(productId);
        if (productPrice != null && productAmmount != null) {
            double price = Double.parseDouble(productPrice);
            int ammount = Integer.parseInt(productAmmount);
            cart.addItem(productId, productName, price, ammount);
            System.out.println("Gia tri torng cart " + cart.getNumOfItems());
            
            model.addAttribute("cart", cart);
        }

        model.addAttribute("lstCategory", listCategory());

        System.out.println("Model value : " + model.values());

    }

    public ArrayList<Category> listCategory() {
        CategoryHelper c = new CategoryHelper();
        ArrayList<Category> lstCategory = (ArrayList<Category>) c.showCategory();

        return lstCategory;
    }
}
