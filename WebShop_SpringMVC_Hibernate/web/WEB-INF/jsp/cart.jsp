<%-- 
    Document   : cart
    Created on : Jan 1, 2017, 7:50:30 AM
    Author     : HoangMinh
--%>

<%@page import="modelHelper.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <h1>Hello World!</h1>
        <jsp:include page="header.jsp" />
        <h3>Chi tiết giỏ hàng</h3>

        <div class="product-detail">
            <table width="600" cellspacing="7" cellpadding="7" border="0">
                <tr>
                    <th class="name" align="left">Tên sản phẩm</th>
                    <th class="name">Đơn giá</th>
                    <th class="name">Số lượng</th>
                    <th class="name">Thành tiền</th>
                    <th class="name">Cập nhật</th>
                    <th class="name">Xóa</th>
                </tr>
                <%
                    ArrayList<Cart> lst_tmpItem = (ArrayList<Cart>) request.getAttribute("tmpItem");
                    ArrayList<Double> lst_thanhTien = (ArrayList<Double>) request.getAttribute("thanhTien");
                    ArrayList<String> lst_name = (ArrayList<String>) request.getAttribute("name");
                    int lengOfCart = lst_name.size();
                    System.out.println("leng of cart : " + lengOfCart);

                    int sizeOfCart = lst_tmpItem.size() / 4;

                    for (int i = 0; i < lengOfCart; i++) {
                        System.out.println("value of lstTemp : " + lst_tmpItem.get(i));

                        System.out.println("name : " + lst_name.get(i).toString());

                %>
                <tr border="1">
                <form action="cart.htm" method="POST">
                    <input type="hidden" name="id_1" value="<%=lst_tmpItem.get(i).getId()%>"/>
                    <td class="name"><%=lst_name.get(i).toString()%></td>
                    <td class="name" align="center"><%=lst_tmpItem.get(i).getName()%></td>
                    <td class="name" align="center">
                        <input type="text" value="<%=lst_tmpItem.get(i).getAmount()%>" name="amount" id="amount" size="5"/>
                    </td>
                    <td class="name" align="center"><%=lst_thanhTien.get(i)%></td>
                    <td class="name" align="center">

                        <input type="submit" value="Cập nhật" name="update"/>
                    </td>
                    <td class="name" align="center">
                        <input type="submit" value="Xóa" name="delete"/>
                    </td>
                </form>
                </tr>
                <%}
                %>
            </table>
        </div>
    </body>
</html>
