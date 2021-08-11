<%-- 
    Document   : home
    Created on : Jan 24, 2021, 9:56:06 AM
    Author     : DuyNQ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <header> <%@include file="header.jsp" %></header>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>All Product</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <div class="sort">            
            <form action="home" method="get">
                <select class="select" name="sort">
                    <option selected>Sort By</option>
                    <option value="1">Low to High Price</option>
                    <option value="2">Hight to Low Price</option>
                    <option value="3">Oldest Product</option>
                    <option value="4">Latest Product</option>
                </select>
                <input type="submit" value="OK" />
            </form>            
        </div>
        <%@include file="showList.jsp" %>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
