<%-- 
    Document   : header
    Created on : Dec 26, 2016, 9:47:24 PM
    Author     : HoangMinh
--%>

<%@page import="pojo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="header">
    <!-- Logo -->
    <h1 id="logo"><a title="Home" href="#">Văn phòng phẩm KTP</a></h1>
    <p class="shopping-cart"><a class="cart" href="#" title="Your Shopping Cart">Giỏ hàng</a><span>Số SP:</span>${cart.numOfItems}<span>Giá:</span>${cart.sumOfPrice}</p>					
    <!-- Search -->
    <div class="search-expand"></div>
    <div id="search">
        <div class="retract-button">
            <p>retract</p>
        </div>
        <form action="" method="post">
            <input type="text" class="field" value="Search" title="Tìm..." />
            <input type="submit" value="" class="submit-button" />
        </form>						
    </div>
    <!-- END Search -->
    <div class="cl"></div>
    <!-- Navigation -->
    <div id="navigation">
        <ul>
            <li><a title="Home" href="#">Trang chủ</a></li>
            <li><a title="Catalog" href="#">Danh mục sản phẩm</a></li>
            <li><a title="About Us" href="#">Giới thiệu</a></li>							
        </ul>						
    </div>	
    <div class="cl"></div>				
    <!-- END Navigation -->
    <!-- Dropdown Navigation -->
    <div id="sort-nav">						
        <span class="label-left"></span>
        <div class="label-bg">						
            <ul>
                <li>
                    <a title="Collections" href="#">Danh mục sản phẩm</a>							
                    <div class="dd">
                        <ul>
                            <% ArrayList<Category> lstCategory = (ArrayList<Category>) request.getAttribute("lstCategory");
                                if (lstCategory.size() > 0) {
                                    for (Category c : lstCategory) {
                            %>

                            <li><a title="Product" href="typeofproduct.htm?category_id=<%=c.getId()%>"><%=c.getName()%></a></li>

                            <%}
                                }
                            %>

                        </ul>																
                    </div>
                </li>							
                <li class="last">
                    <a title="By Price" class="Theo giá" href="#">By Price</a>
                    <div class="dd">
                        <ul>
                            <li><a title="Product" href="#">Thấp đến cao</a></li>
                            <li><a title="Product" href="#">Cao đến thấp</a></li>												
                        </ul>									
                    </div>
                </li>
            </ul>
        </div>
        <span class="label-right"></span>									
    </div>					
    <!-- END Dropdown Navigation -->
    <div class="cl"></div>
</div>
