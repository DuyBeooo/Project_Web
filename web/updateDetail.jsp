<%-- 
    Document   : updateDetail
    Created on : Mar 21, 2021, 3:32:35 PM
    Author     : DuyNQ
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/css2.css" rel="stylesheet" type="text/css"/>
        <title>Update Detail</title>
    </head>
    <body>
        <header> <%@include file="header.jsp" %></header>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2> Update Detail</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <% Product p = (Product) request.getAttribute("detail");%>
        <div class="flex-container">
            <div class="box"><img src="<%= p.getImg()%>"  /></div>
            <div class="box">               
                <form action="update" method="get">
                    <input hidden name="id" value="<%= p.getId() %>" />
                        <table>
                            <tr><td>Brand</td>   <td><input placeholder="<%= p.getBrand()%>" type="text" name="brand"/></td>
                        <tr><td>Category</td>    <td><input placeholder="<%= p.getCategory()%>" type="text" name="category"/></td>
                        <tr><td>Material</td>    <td><input placeholder="<%= p.getMaterial()%>" type="text" name="material"/></td>
                        <tr><td>Size</td>    <td><input placeholder="<%= p.getSize()%>" type="text" name="size"/></td>
                        <tr><td>Color</td>    <td><input placeholder="<%= p.getColor()%>" type="text" name="color"/></td>
                        <tr><td>Price</td>    <td><input placeholder="<%= p.showPrice(p.getPrice()) %>" type="text" name="price"/></td>
                        <tr><td>Gender</td>   <td><select  name="gender">
                                    <option selected value="none"><%= p.getGender() %></option>
                                    <option value="All">All</option>
                                    <option value="Female">Female</option>
                                    <option value="Male">Male</option>                                    
                                </select></td>                                                         
                    </table>
                        <button ><input type="submit" value="UPDATE" /> </button>
                    </form>                
            </div>            
        </div>        
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
