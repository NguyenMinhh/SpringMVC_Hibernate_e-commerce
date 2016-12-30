<%-- 
    Document   : productdetail
    Created on : Dec 29, 2016, 6:37:39 PM
    Author     : HoangMinh
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title>Cửa hàng văn phòng phẩm</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="resources/css/images/favicon.ico" />
        <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="all" />
        <!--[if IE 6]>
        <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />	
        <![endif]-->
        <link rel="stylesheet" href="resources/css/jquery.jscrollpane.css" type="text/css" media="all" />
        <script src="resources/js/jquery-1.7.min.js" type="text/javascript"></script>
        <script src="resources/js/DD_belatedPNG-min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.jscrollpane.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.jcarousel.js" type="text/javascript"></script>
        <script src="resources/js/functions.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Wrapper -->
        <div id="wrapper">
            <div id="wrapper-bottom">
                <div class="shell">
                    <!-- Header -->
                    <jsp:include page="header.jsp"></jsp:include>
                        <!-- END Header -->
                        <!-- Main -->
                        <div id="main">
                            <!-- Slider -->
                        <jsp:include page="slider.jsp"></jsp:include>	
                            <!-- END Slider -->
                            <!-- Content -->
                            <div id="content">
                                <!-- Featured Products -->
                                <div class="products-holder">
                                    <div class="top"></div>
                                    <div class="middle">													
                                        <div class="cl"></div>	

                                        <div class="label">
                                            <h3>${p.getName()}</h3>									
                                    </div>
                                    <table class="product-detail">
                                        <tr>
                                            <td>
                                                <img src="resources/images/product/${p.getImage()}" alt="${p.getName()}"/>
                                            </td>
                                            <td>
                                                <div class="desc">
                                                    <p class="name">
                                                        Đơn giá: <span>${p.getPrice()}</span> vnđ/đvt
                                                    </p>
                                                    <p class="name">
                                                        SL còn: <span>${p.getAmount()}</span>
                                                    </p>
                                                </div>
                                                <div>
                                                    <p>
                                                        <form action="productdetail.htm?product_id=${p.getId()}" method="POST">
                                                            
                                                            <input type="hidden" name="name" value="${p.getName()}" />
                                                            <input type="hidden" name="price" value="${p.getPrice()}" />
                                                            <input type="number" value="1" name="amount" min="1" max="${p.getAmount()}" step="1" />
                                                            <!--<input type="text" class="field" value="" title="Nhập số lượng" name="amount" id="amount" size="10" /> -->
                                                            <input type="submit" name="dathang" value="" class="buy-button">
                                                        </form>
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="cl"></div>																														
                                </div>
                                <div class="cl"></div>
                            </div>
                            <div class="bottom"></div>									
                        </div>                            <!-- END Featured Products -->
                    </div>
                    <!-- END Content -->
                </div>
                <!-- END Main -->
            </div>
        </div>
        <div id="footer-push"></div>
        </div>
        <!-- END Wrapper -->
        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- END Footer -->
    </body>
</html>