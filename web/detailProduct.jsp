<%-- 
    Document   : detailProduct
    Created on : Mar 13, 2021, 1:42:22 PM
    Author     : DuyNQ
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/css2.css" rel="stylesheet" type="text/css"/>
        <title>Detail</title>        
    </head>
    <body>
        <header> <%@include file="header.jsp" %></header>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2> Product Detail</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <% Product p = (Product) request.getAttribute("detail");%>
        <div class="flex-container">
            <div class="box"><img src="<%= p.getImg()%>"  /></div>
            <div class="box">
                <ol>
                    <li><span>Name:   </span> <%= p.getBrand() + p.getId()%></li>
                    <li><span>Gender:   </span><%= p.getGender()%></li>
                    <li><span>Brand:   </span><%= p.getBrand()%></li>
                    <li><span>Category:   </span><%= p.getCategory()%></li>
                    <li><span>Material:   </span><%= p.getMaterial()%></li>
                    <li><span>Size:   </span><%= p.getSize()%></li>
                    <li><span>Color:   </span><%= p.getColor()%></li>
                    <li><span>Price:   </span><%= p.showPrice(p.getPrice()) %></li>                    
                    <li> <button class="add" > <a href="addCart?pid=<%= p.getId() %>"><b>Add To Card</b><b class="fa fa-shopping-cart"></b></a></button></li>
                </ol>
            </div>            
        </div>        
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
