<%@page import="modelHelper.Pager"%>
<%@page import="pojo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <jsp:include page="header.jsp" />
                    <!-- END Header -->
                    <!-- Main -->
                    <div id="main">
                        <div id="content">
                            <!-- Featured Products -->
                            <% ArrayList<Product> lstProduct = (ArrayList<Product>) request.getAttribute("lstTypeOfProduct");
                                Pager p = (Pager) request.getAttribute("pager");
                                int selectPage = Integer.parseInt(request.getAttribute("selectPage").toString());
                                int pages = Integer.parseInt(request.getAttribute("pages").toString());
                                String getRequestURI = request.getAttribute("getRequestURI").toString();
                                String pathImage = "";
                                if (lstProduct.size() > 0) {
                                    for (Product pr : lstProduct) {
                                        pathImage = "resources/images/product/" + pr.getImage();

                            %>

                            <div class="product">																										
                                <a title="Details" href="productdetail.htm?product_id=<%=pr.getId()%>"><img src=<%=pathImage%> alt="paperclip" /></a>
                                <div class="desc">
                                    <p class="name"><%=pr.getName()%></p>
                                    <p>Peaces in Box: <span><%=pr.getAmount()%></span></p>
                                    <p>Product code: <span><%=pr.getId()%></span></p>
                                </div>	
                                <div class="price-box">
                                    <p class="price"> <%=pr.getPrice()%></p>
                                    <p class="per-peace">VND</p>
                                </div>
                                <div class="cl"></div>																														
                            </div>

                            <%}
                            %>
                            <div class="paging">
                                <h3><%=p.nextPrevQueryString(selectPage, pages, getRequestURI, "&category_id=" + request.getParameter("category_id"))%></h3>
                                <h3><%=p.pageListQueryString(selectPage, pages, getRequestURI, "&category_id=" + request.getParameter("category_id"))%></h3>
                            </div> 
                            <%
                                }
                            %>
                            <!-- END Bottom Strip -->
                        </div>
                        <!-- END Content -->
                    </div>
                    <!-- END Main -->
                </div>
            </div>

        </div>

    </body>
</html>