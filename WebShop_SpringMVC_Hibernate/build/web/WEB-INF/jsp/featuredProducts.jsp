<%-- 
    Document   : featuredProducts
    Created on : Dec 26, 2016, 9:53:19 PM
    Author     : HoangMinh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Product"%>
<%@page import="pojo.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="products-holder">
    <div class="top"></div>
    <div class="middle">													
        <div class="label">
            <h3>Danh mục sản phẩm</h3>									
        </div>


        <div class="cl"></div>
        <% ArrayList<Product> lstProduct = (ArrayList<Product>) request.getAttribute("lstFeaturedProduct");
            String pathImage = "";
            if (lstProduct != null) {
                for (Product p : lstProduct) {
                    pathImage = "resources/images/product/" + p.getImage();
        %>

        <div class="product">																										
            <a title="Details" href="productdetail.htm?product_id=<%=p.getId()%>"><img src=<%=pathImage%> alt="paperclip" /></a>
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



        <div class="cl"></div>
    </div>
    <div class="bottom"></div>									
</div>
