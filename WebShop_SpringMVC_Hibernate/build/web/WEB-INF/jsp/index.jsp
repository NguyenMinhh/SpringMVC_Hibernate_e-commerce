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
                        <!-- Slider -->
                        <jsp:include page="slider.jsp" />
                        <!-- END Slider -->
                        <!-- Content -->
                        <div id="content">
                            <!-- Featured Products -->
                            <jsp:include page="featuredProducts.jsp" />
                            <!-- END Featured Products -->
                            <!-- Best Sellers -->
                            <jsp:include page="bestSeller.jsp" />		
                            <!-- END Best Sellers -->
                            <!-- Bottom Strip -->
                            <jsp:include page="bottomTrip.jsp" />
                            <!-- END Bottom Strip -->
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
        <jsp:include page="footer.jsp" />
        <!-- END Footer -->
    </body>
</html>