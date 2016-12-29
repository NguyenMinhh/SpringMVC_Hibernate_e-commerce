<%-- 
    Document   : bestSeller
    Created on : Dec 26, 2016, 9:53:45 PM
    Author     : HoangMinh
--%>

<%@page import="pojo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<div class="products-holder">
    <div class="top"></div>
    <div class="best-sellers middle">									
        <div class="label">								
            <h3>Best Sellers</h3>																		
        </div>
        <div class="cl"></div>
        <!-- Scroll Pane -->
        <div class="left-border"></div>
        <div class="scroll-pane horizontal-only">	

            <% ArrayList<Product> lstBestSellerProduct = (ArrayList<Product>) request.getAttribute("lstBestSellerProduct");
            System.out.println("++++++++" + request.getAttribute("lstBestSellerProduct"));    
            String pathImage = "";
                if (lstBestSellerProduct.size() > 0) {
                    for (Product p : lstBestSellerProduct) {
                        pathImage = "resources/images/product/" + p.getImage();
            %>
            <div class="product">																										
                <a title="Details" href="#"><img src=<%=pathImage%> alt="paperclip" /></a>
                <div class="desc">
                    <p class="name"><%=p.getName()%></p>
                    <p>Peaces in Box: <span><%=p.getAmount()%></span></p>
                    <p>Product code: <span><%=p.getId()%></span></p>
                </div>	
                <div class="price-box">
                    <p class="price"> <%=p.getPrice()%></p>
                    <p class="per-peace">VND</p>
                </div>
                <div class="cl"></div>																														
            </div>

            <%}
                }

            %>






        </div>
        <!-- END Scroll Pane -->
        <div class="right-border"></div>
        <div class="cl"></div>								
    </div>
    <div class="bottom"></div>							
</div>		
