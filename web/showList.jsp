<%-- 
    Document   : showListSearch
    Created on : Mar 19, 2021, 5:18:57 PM
    Author     : DuyNQ
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
    </head>
    <body>        
        <%
            List<Product> listt = (List<Product>) request.getAttribute("data");
            if (listt != null) {
        %>
               
            <div class="brand-bg">
                <div class="container">
                    <div class="row">
                        <% for (Product p : listt) {%>
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 margin">
                            <div class="brand_box">
                                <a href="showDetail?id=<%= p.getId()%>"><img src="<%= p.getImg()%>" alt="img" /></a>
                                <h3><strong class="red"> <%= p.showPrice(p.getPrice())%> </strong></h3>
                                <span><%= p.getBrand() + p.getId()%></span> 
                                <button class="add"> <a href="addCart?pid=<%= p.getId()%>"><b>Add To Card</b><b class="fa fa-shopping-cart"></b></a></button>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        
        <% }%>
    </body>
</html>
