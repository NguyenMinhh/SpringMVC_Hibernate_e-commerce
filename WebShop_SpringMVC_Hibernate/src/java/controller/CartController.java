/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelHelper.Cart;
import modelHelper.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author HoangMinh
 */
@Controller
@RequestMapping(value = "/")
@Scope("session")
public class CartController {

    @Autowired
    ShoppingCart cart;

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String getCart(ModelMap model) {

        Enumeration e = cart.getEnumeration();
        String[] tmpItem = null;
        double thanhTien = 1;
        String name = "";
        //Iterate over the cart

        ArrayList<Cart> lst_tmpItem = new ArrayList<Cart>();
        ArrayList<Double> lst_thanhTien = new ArrayList<>();
        ArrayList<String> lst_name = new ArrayList<>();

        while (e.hasMoreElements()) {
            try {
                tmpItem = (String[]) e.nextElement();
                thanhTien = Double.parseDouble(tmpItem[2]) * Integer.parseInt(tmpItem[3]);
                byte[] b = tmpItem[1].getBytes();

                name = new String(b, "UTF-8");

                System.out.println("~~~~+++++ tmpItem : " + tmpItem[1]);
                lst_tmpItem.add(new Cart(tmpItem[0], tmpItem[1], Double.parseDouble(tmpItem[2]), Integer.parseInt(tmpItem[3])));
                lst_thanhTien.add(thanhTien);
                lst_name.add(name);

            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        model.addAttribute("tmpItem", lst_tmpItem);
        model.addAttribute("thanhTien", lst_thanhTien);
        model.addAttribute("name", lst_name);
        System.out.println("~~~~+++++ : " + model.values());
        return "cart";

    }

    @RequestMapping(value = "/cart", method = RequestMethod.POST)
    public String postCart(@RequestParam(value = "id_1") String id,
            @RequestParam(value = "amount", required = false) String amount,
            @RequestParam(value = "update", required = false) String update,
            @RequestParam(value = "delete", required = false) String delete,
            ModelMap model) {

        if (id != null) {
            if (update != null) {
                if (Integer.parseInt(amount) != 0) {
                    cart.updateQuantity(id, Integer.parseInt(amount));
                } else {
                    cart.removeItem(id);
                }
            }
            if (delete != null) {
                cart.removeItem(id);
            }
        }

        
        return "redirect:cart.htm";

    }

}
